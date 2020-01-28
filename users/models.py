import os
import random
import string
from io import BytesIO

import qrcode
from django.conf import settings
from django.contrib.auth.base_user import BaseUserManager, AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin
from django.core.files.uploadedfile import InMemoryUploadedFile
from django.core.validators import RegexValidator
from django.db import models
from django.db.models.signals import post_save
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
    number = models.CharField(max_length=255, validators=[phone],
                              unique=True, verbose_name='номуру')
    region = models.ForeignKey('Region', models.CASCADE, verbose_name='облус', null=True)
    district = models.ForeignKey('District', models.CASCADE, verbose_name='район', null=True)
    is_staff = models.BooleanField(default=True, verbose_name='кызматкер статусу')
    is_superuser = models.BooleanField(default=False, verbose_name='башкаруучу')

    USERNAME_FIELD = 'number'
    EMAIL_FIELD = 'number'
    objects = UserManager()

    class Meta(AbstractBaseUser.Meta):
        verbose_name = 'Колдонуучу'
        verbose_name_plural = 'Колдонуучулар'

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
        ('kol', 'Ысык-Көл')
    )
    name = models.CharField(max_length=9, choices=REGION_CHOICES, unique=True, verbose_name='аты')
    address = models.CharField(max_length=255, verbose_name='дарек')

    class Meta:
        verbose_name = 'Облус'
        verbose_name_plural = 'Облустар'

    def __str__(self):
        return f'{dict(self.REGION_CHOICES)[self.name]}'


class District(models.Model):
    name = models.CharField(max_length=55, verbose_name='аты')
    region = models.ForeignKey(Region, models.CASCADE, verbose_name='облус')
    gov_admin = models.CharField(max_length=255, verbose_name='Мам админстрациа башчы (ААТ)')
    stat_admin = models.CharField(max_length=255, verbose_name='Статистика башчы (ААТ)')
    counter = models.CharField(max_length=8, default='000001')

    class Meta:
        verbose_name = 'Район'
        verbose_name_plural = 'Райондор'

    def __str__(self):
        return f'{self.name}'


def increment_territory_country():
    last_territory = Territory.objects.order_by('counter').last()
    if not last_territory:
        return '0001'
    return '{:04}'.format(int(last_territory.counter) + 1)


class Territory(models.Model):
    name = models.CharField(max_length=90, verbose_name='Аты')
    code = models.CharField(max_length=14, unique=True, verbose_name='Коду')
    district = models.ForeignKey(District, models.CASCADE, verbose_name='Район')
    counter = models.CharField(max_length=4, default=increment_territory_country,
                               editable=False, unique=True)

    class Meta:
        verbose_name = 'Территория'
        verbose_name_plural = 'Территориялар'
        ordering = ['code']

    def __str__(self):
        return f'{self.name}'


class Employee(models.Model):
    GENDER_CHOICES = (
        ('2', 'эркек'),
        ('1', 'аял')
    )
    ROLE_CHOICES = (
        ('enum', 'Каттоочу'),
        ('ins', 'Инструктор'),
        ('cor', 'Координатор'),

    )
    NUM_CHOICES = (
        (1, '1'), (2, '2'), (3, '3'), (4, '4'), (5, '5'), (6, '6'), (7, '7'), (8, '8'), (9, '9'), (10, '10'),
        (11, '11'),
        (12, '12'), (13, '13'), (14, '14'), (15, '15'))
    number = models.CharField(max_length=255, validators=[phone], unique=True, verbose_name='телефон номуру',
                              error_messages={'unique': "Мундай номер бар."})
    last_name = models.CharField(max_length=45, verbose_name='фамилиясы')
    first_name = models.CharField(max_length=45, verbose_name='аты')
    patronymic = models.CharField(max_length=45, null=True, blank=True, verbose_name='атасынын аты')
    gender = models.CharField(max_length=1, choices=GENDER_CHOICES, default='2', verbose_name='жынысы')
    birth_day = models.DateField(verbose_name='туулган күнү')
    serial = models.CharField(max_length=2, choices=(('ID', 'ID'), ('AN', 'AN'), ('AC', 'AC')),
                              default='ID', verbose_name='паспорт сериясы')
    passport_num = models.CharField(max_length=7, verbose_name='паспорт номуру')
    address = models.CharField(max_length=255, verbose_name='дарек')
    authority = models.CharField(max_length=10, verbose_name='паспорт берген орган')
    PIN = models.CharField(max_length=14, verbose_name='ПИН')
    photo = models.ImageField(upload_to='users/img', verbose_name='сүрөт')
    role = models.CharField(max_length=50, choices=ROLE_CHOICES, default=ROLE_CHOICES[2], verbose_name='ролу')
    department = models.PositiveSmallIntegerField(choices=NUM_CHOICES, default=1, verbose_name='каттоо бөлүмү')
    sector = models.PositiveSmallIntegerField(choices=NUM_CHOICES, default=1, verbose_name='инструктордук участок')
    plot = models.PositiveSmallIntegerField(choices=NUM_CHOICES, default=1, verbose_name='каттоо участогу')
    district = models.ForeignKey(District, models.CASCADE, verbose_name='район')
    territory = models.ForeignKey(Territory, models.CASCADE, verbose_name='территория')
    agreement = models.CharField(max_length=6, verbose_name='келишим')
    qrcode = models.ImageField(upload_to='users/qr-codes', blank=True, null=True, verbose_name='QR код')
    date_joined = models.DateTimeField(auto_now_add=True, verbose_name='Ишке алынган күнү')
    login = models.CharField(max_length=50, verbose_name='логин')
    password = models.CharField(max_length=16, verbose_name='пароль')
    is_badge_printed = models.BooleanField(default=False)
    is_badge_returned = models.BooleanField(default=False)

    class Meta:
        verbose_name = 'Кызматкер'
        verbose_name_plural = 'Кызматкерлер'
        unique_together = ('district', 'agreement')

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
