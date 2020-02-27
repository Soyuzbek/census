import os
import random
import string
from io import BytesIO

import qrcode
from django.conf import settings
from django.contrib.auth.base_user import BaseUserManager, AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin
from django.core.cache import cache
from django.core.files.uploadedfile import InMemoryUploadedFile
from django.core.validators import RegexValidator
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.urls import reverse
from django.utils import dateformat
from django.utils.translation import ugettext_lazy as _
from num2words import num2words

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
    region = models.ForeignKey('Region', models.CASCADE, verbose_name=_('region'), null=True)
    district = models.ForeignKey('District', models.CASCADE, verbose_name=_('district'), null=True)
    is_staff = models.BooleanField(_('is staff'), default=True)
    is_superuser = models.BooleanField(_('super user'), default=False)

    USERNAME_FIELD = 'number'
    EMAIL_FIELD = 'number'
    objects = UserManager()

    class Meta(AbstractBaseUser.Meta):
        verbose_name = _('User')
        verbose_name_plural = _('Users')
        permissions = [
            ("can_print_badge", "Can print a badge"),
            ("can_print_agreement", "Can print an agreement"),
        ]

    def __str__(self):
        return f'{self.number}'


class Region(models.Model):
    REGION_CHOICES = (
        ('chu', 'Чүй'),
        ('osh', 'Ош'),
        ('bat', 'Баткен'),
        ('jal', 'Жалал-Абад'),
        ('tal', 'Талас'),
        ('nar', 'Нарын'),
        ('kol', 'Ысык-Көл'),
        ('bis', 'г.Бишкек'),
        ('oshc', 'г.Ош'),
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
    gov_admin = models.CharField(max_length=255, verbose_name='Мам админстрация башчы (ААТ)')
    stat_admin = models.CharField(max_length=255, verbose_name='Статистика башчы (ААТ)')
    counter = models.CharField(max_length=6, default='000001')
    center = models.CharField(_('center of district'), max_length=255, null=True, blank=True)
    agreement_ky = models.CharField(max_length=255, null=True, blank=True)
    agreement_ru = models.CharField(max_length=255, null=True, blank=True)
    stat_address = models.CharField(max_length=255, null=True, blank=True)
    did = models.CharField(max_length=2, null=True, blank=True)

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
    counter = models.CharField(max_length=4, default=increment_territory_country,
                               editable=False, unique=True)

    class Meta:
        verbose_name = _('Territory')
        verbose_name_plural = _('Territories')
        ordering = ['code']

    def __str__(self):
        return f'{self.name}'


class Employee(models.Model):
    GENDER_CHOICES = (
        ('2', _('male')),
        ('1', _('female')),
    )
    ROLE_CHOICES = (
        ('cor', _('Coordinator')),
    )
    EDUCATION_CHOICES = (
        ('1', _('bachelor')),
        ('2', _('specialist')),
        ('3', _('master')),
        ('4', _('incomplete higher education')),
        ('5', _('specialized secondary education')),
        ('6', _('initial vocational training')),
        ('7', _('general secondary education')),
        ('8', _('lower secondary education'))
    )
    WORKDAY_CHOICES = (
        ('full', _('full time work')),
        ('half', _('half time work'))
    )

    number = models.CharField(_('number'), max_length=255, validators=[phone], unique=True,
                              error_messages={'unique': "Мундай номер бар."})
    last_name = models.CharField(_('last name'), max_length=45)
    first_name = models.CharField(_('first name'), max_length=45)
    patronymic = models.CharField(_('patronymic'), max_length=45, null=True, blank=True)
    gender = models.CharField(_('gender'), max_length=1, choices=GENDER_CHOICES, default='2')
    birth_day = models.DateField(_('birth day'))
    serial = models.CharField(_('serial'), max_length=2, choices=(('ID', 'ID'), ('AN', 'AN'), ('AC', 'AC')),
                              default='ID')
    passport_num = models.CharField(_('number of passport'), max_length=7, unique=True)
    address = models.CharField(_('address'), max_length=255)
    authority = models.CharField(_('authority'), max_length=10)
    PIN = models.CharField(_('PIN'), max_length=14, unique=True)
    photo = models.ImageField(_('photo'), upload_to='users/img')
    education = models.CharField(_('education'), max_length=1, choices=EDUCATION_CHOICES, default=1)
    role = models.CharField(_('role'), max_length=50, choices=ROLE_CHOICES, default='cor')
    department = models.PositiveSmallIntegerField(_('census department'), default=1)
    sector = models.PositiveSmallIntegerField(_('coordinator sector'), default=1)
    plot = models.PositiveSmallIntegerField(_('enumerator plot'), default=1)
    district = models.ForeignKey(District, models.SET_NULL, verbose_name=_('district'), null=True, blank=True)
    territory = models.ForeignKey(Territory, models.SET_NULL, verbose_name=_('territory'), null=True, blank=True)
    workday = models.CharField(_('workday'), max_length=4, choices=WORKDAY_CHOICES, default='full')
    agreement = models.CharField(_('agreement'), max_length=6)
    qrcode = models.ImageField(_('QR code'), upload_to='users/qr-codes', blank=True, null=True)
    date_joined = models.DateTimeField(_('date joined'), auto_now_add=True)
    login = models.CharField(_('login'), max_length=9)
    password = models.CharField(_('password'), max_length=13)
    is_badge_printed = models.BooleanField(_('is badge printed?'), default=False)
    is_badge_returned = models.BooleanField(_('is badge returned?'), default=False)
    dismissed = models.BooleanField(_('Dismissed?'), default=False)

    class Meta:
        verbose_name = _('Employee')
        verbose_name_plural = _('Employees')
        unique_together = ('district', 'agreement')
        ordering = ['-id']

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
        instance.login = instance.number
        # password generation using department, sector, plot and 4 random character
        instance.password = f'{instance.number}' + ''.join(random.choice(string.ascii_lowercase) for i in range(4))
        instance.agreement = "{:02}{:04}".format(int(instance.district.did), int(instance.district.counter))
        instance.district.counter = "{:06}".format(int(instance.district.counter) + 1)
        instance.district.save()
        instance.save()


class SingletonModel(models.Model):
    class Meta:
        abstract = True

    def delete(self, *args, **kwargs):
        pass

    def set_cache(self):
        cache.set(self.__class__.__name__, self)

    def save(self, *args, **kwargs):
        self.pk = 1
        super().save(*args, **kwargs)

    @classmethod
    def load(cls):
        obj, created = cls.objects.get_or_create(pk=1)
        return obj


class SiteSettings(SingletonModel):
    class Meta:
        verbose_name = 'Настройки сайта'
        verbose_name_plural = 'Настройки сайта'

    def __str__(self):
        return "Настройки сайта"


class RoleInfo(models.Model):
    ROLE_CHOICES = (
        ('enum', _('Enumerator')),
        ('ins', _('Instructor')),
        ('cor', _('Coordinator')),

    )
    site_settings = models.ForeignKey(SiteSettings, on_delete=models.CASCADE)
    role = models.CharField(max_length=50, choices=ROLE_CHOICES, null=True)
    salary = models.PositiveIntegerField(null=True)
    workday_start_date = models.DateField(null=True)
    workday_end_date = models.DateField(null=True)
    days_off = models.CharField(max_length=255, null=True, blank=True)
    agreement_day = models.DateField(null=True, blank=True)
    workday_num = models.PositiveSmallIntegerField(null=True, blank=True)

    @property
    def census_start_date_humanized(self):
        date_humanized = '{date_humanized}'.format(
            date_humanized=dateformat.format(self.workday_start_date, settings.DATE_FORMAT)
        )
        return date_humanized

    @property
    def census_end_date_humanized(self):
        date_humanized = '{date_humanized}'.format(
            date_humanized=dateformat.format(self.workday_end_date, settings.DATE_FORMAT)
        )
        return date_humanized

    @property
    def half_salary(self):
        return int(self.salary / 2)

    @property
    def salary2words(self):
        return num2words(self.salary, lang='ru')

    @property
    def half_salary2words(self):
        return num2words(self.half_salary, lang='ru')

    @property
    def workday2words(self):
        return num2words(self.workday_num, lang='ru')
# ('enum', _('Enumerator')),
# ('ins', _('Instructor')),
