import os
import string
from io import BytesIO
import random

import qrcode
from django.conf import settings
from django.contrib.auth.base_user import BaseUserManager, AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin
from django.core.files.uploadedfile import InMemoryUploadedFile
from django.core.validators import RegexValidator
from django.db import models
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _

phone = RegexValidator(regex=r'^\d{9}$',
                       message=_("must be in 123456789 format!"))


class UserManager(BaseUserManager):

    def _create_user(self, number, password, is_staff, is_superuser, **extra_fields):
        user = self.model(
            number=number,
            is_staff=is_staff,
            is_superuser=is_superuser,
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, number, password, **extra_fields):
        return self._create_user(number, password, False, False, **extra_fields)

    def create_superuser(self, number, password, **extra_fields):
        user = self._create_user(number, password, True, True, **extra_fields)
        user.save(using=self._db)
        return user


class User(AbstractBaseUser, PermissionsMixin):
    number = models.CharField(_('number'), max_length=255, validators=[phone],
                              unique=True)
    region = models.ForeignKey('Region', models.CASCADE, verbose_name=_('Region'), null=True)
    district = models.ForeignKey('District', models.CASCADE, verbose_name=_('district'), null=True, blank=True)
    is_staff = models.BooleanField(_('is staff'), default=True)
    is_superuser = models.BooleanField(_('super user'), default=False)

    USERNAME_FIELD = 'number'
    EMAIL_FIELD = 'number'
    objects = UserManager()

    class Meta(AbstractBaseUser.Meta):
        verbose_name = _('User')
        verbose_name_plural = _('Users')

    def __str__(self):
        return f'{self.number}'


class Region(models.Model):
    REGION_CHOICES = (
        ('chu', _('Chue')),
        ('osh', _('Osh')),
        ('bat', _('Batken')),
        ('jal', _('Jalalabad')),
        ('tal', _('Talas')),
        ('nar', _('Narin')),
        ('kol', _('Issikkol'))
    )
    name = models.CharField(_('name'), max_length=9, choices=REGION_CHOICES, unique=True)
    address = models.CharField(_('address'), max_length=255)

    class Meta:
        verbose_name = _('Region')
        verbose_name_plural = _('Regions')

    def __str__(self):
        return f'{dict(self.REGION_CHOICES)[self.name]}'


class District(models.Model):
    name = models.CharField(_('name'), max_length=55)
    region = models.ForeignKey(Region, models.CASCADE, verbose_name=_('region'))
    gov_admin = models.CharField(_('gov admin (NSP)'), max_length=255)
    stat_admin = models.CharField(_('stat admin (NSP)'), max_length=255)
    counter = models.CharField(_('counter of agreements'), max_length=8, default='000001')

    class Meta:
        verbose_name = _('District')
        verbose_name_plural = _('Districts')

    def __str__(self):
        return f'{self.name}'


def increment_territory_country():
    last_territory = Territory.objects.order_by('counter').last()
    if not last_territory:
        return '0001'
    return '{:04}'.format(int(last_territory.counter) + 1)


class Territory(models.Model):
    name = models.CharField(_('name'), max_length=90)
    code = models.CharField(_('code'), max_length=14, unique=True)
    district = models.ForeignKey(District, models.CASCADE)
    counter = models.CharField(_('counter of Territory'), max_length=4, default=increment_territory_country,
                               editable=False, unique=True)

    class Meta:
        verbose_name = _('Territory')
        verbose_name_plural = _('Territories')

    def __str__(self):
        return f'{self.name}'


class Employee(models.Model):
    GENDER_CHOICES = (
        ('2', _('male')),
        ('1', _('female'))
    )
    ROLE_CHOICES = (
        ('con', _('Controller')),
        ('cor', _('Coordinator')),
        ('enum', _('Enumerator')),

    )
    NUM_CHOICES = (
        (1, '1'), (2, '2'), (3, '3'), (4, '4'), (5, '5'), (6, '6'), (7, '7'), (8, '8'), (9, '9'), (10, '10'),
        (11, '11'),
        (12, '12'), (13, '13'), (14, '14'), (15, '15'))
    number = models.CharField(_('number'), max_length=255, validators=[phone], unique=True)
    last_name = models.CharField(_('last name'), max_length=45)
    first_name = models.CharField(_('first name'), max_length=45)
    patronymic = models.CharField(_('patronymic'), max_length=45, null=True, blank=True)
    gender = models.CharField(_('gender'), max_length=1, choices=GENDER_CHOICES, default='2')
    birth_day = models.DateField(_('birth day'))
    serial = models.CharField(_('serial'), max_length=2, choices=(('ID', 'ID'), ('AN', 'AN'), ('AC', 'AC')),
                              default='ID')
    passport_num = models.CharField(_('number of passport'), max_length=7)
    address = models.CharField(_('address'), max_length=255)
    authority = models.CharField(_('Authority'), max_length=10)
    PIN = models.CharField(_('PIN'), max_length=14)
    photo = models.ImageField(_('photo'), upload_to='users/img')
    role = models.CharField(_('role'), max_length=50, choices=ROLE_CHOICES, default=ROLE_CHOICES[2])
    department = models.PositiveSmallIntegerField(_('Census department'), choices=NUM_CHOICES, default=1)
    sector = models.PositiveSmallIntegerField(_('Coordinator sector'), choices=NUM_CHOICES, default=1)
    plot = models.PositiveSmallIntegerField(_('Enumerator plot'), choices=NUM_CHOICES, default=1)
    district = models.ForeignKey(District, models.CASCADE, verbose_name=_('district'))
    territory = models.ForeignKey(Territory, models.CASCADE, verbose_name=_('territory'))
    agreement = models.CharField(_('agreement'), max_length=6)
    qrcode = models.ImageField(_('QR code'), upload_to='users/qr-codes', blank=True, null=True)
    date_joined = models.DateTimeField(_('date joined'), auto_now_add=True)
    login = models.CharField(_('login'), max_length=50)
    password = models.CharField(_('password'), max_length=16)

    class Meta:
        verbose_name = _('Employee')
        verbose_name_plural = _('Employees')

    def get_absolute_url(self):
        return reverse('users:detail', args=[self.id])

    def delete(self, using=None, keep_parents=False):
        if self.qrcode:
            try:
                os.remove(self.qrcode.path)
            except FileNotFoundError:
                pass
        super().delete()

    def generate_qrcode(self):
        qr = qrcode.QRCode(
            version=1,
            error_correction=qrcode.constants.ERROR_CORRECT_L,
            box_size=6,
            border=2
        )
        qr.add_data(settings.DOMAIN_NAME + self.get_absolute_url())
        qr.make(fit=True)

        img = qr.make_image()
        buffer = BytesIO()
        img.save(buffer)
        filename = f'{self.number}'
        filebuffer = InMemoryUploadedFile(
            buffer, None, filename, 'image/png', buffer.tell(), None
        )
        self.qrcode.save(filename, filebuffer)

    @property
    def get_role(self):
        return dict(Employee.ROLE_CHOICES).get(self.role)

    def __str__(self):
        return f'{self.first_name}'


@receiver(post_save, sender=Employee)
def set_agreement_number(sender, instance, created=False, **kwargs):
    if created:
        instance.generate_qrcode()
        instance.login = f"T{instance.territory.counter}P{instance.department}I{instance.sector}S{instance.plot}"
        # password generation using department, sector, plot and 4 random character
        instance.password = f'{instance.login}' + ''.join(random.choice(string.ascii_lowercase) for i in range(4))
        instance.agreement = instance.district.counter
        instance.district.counter = "{:06}".format(int(instance.district.counter) + 1)
        instance.district.save()
        instance.save()
