# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from django.utils.translation import ugettext_lazy as _


class Versioninfo(models.Model):
    version = models.BigIntegerField(db_column='Version')
    appliedon = models.DateTimeField(db_column='AppliedOn', blank=True, null=True)
    description = models.CharField(db_column='Description', max_length=1024, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users\".\"VersionInfo'
        app_label = 'survey'
        unique_together = (('version', 'version', 'version', 'version'),)


class Roles(models.Model):
    id = models.UUIDField(db_column='Id', primary_key=True)
    name = models.CharField(db_column='Name', unique=True, max_length=256)

    class Meta:
        managed = False
        db_table = '"users\".\"roles"'
        app_label = 'survey'
        verbose_name = _('Role')
        verbose_name_plural = _('Roles')

    def __str__(self):
        return f'{self.name}'


class Userclaims(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)
    userid = models.ForeignKey('Users', models.DO_NOTHING, db_column='UserId')
    claimtype = models.TextField(db_column='ClaimType')
    claimvalue = models.TextField(db_column='ClaimValue')

    class Meta:
        managed = False
        db_table = 'users\".\"userclaims'
        app_label = 'survey'
        verbose_name = _('Claim of user')
        verbose_name_plural = _('Claims of users')


class Userlogins(models.Model):
    loginprovider = models.CharField(db_column='LoginProvider', primary_key=True, max_length=128)
    providerkey = models.CharField(db_column='ProviderKey', max_length=128)
    userid = models.ForeignKey('Users', models.DO_NOTHING, db_column='UserId')

    class Meta:
        managed = False
        db_table = 'users\".\"userlogins'
        app_label = 'survey'
        unique_together = (('loginprovider', 'providerkey', 'userid'),)
        verbose_name = _('Userlogin')
        verbose_name_plural = _('Userlogins')


class Userprofiles(models.Model):
    id = models.AutoField(db_column='Id', primary_key=True)
    deviceid = models.TextField(db_column='DeviceId', blank=True, null=True)
    supervisorid = models.UUIDField(db_column='SupervisorId', blank=True, null=True)
    deviceappversion = models.TextField(db_column='DeviceAppVersion', blank=True, null=True)
    deviceappbuildversion = models.IntegerField(db_column='DeviceAppBuildVersion', blank=True, null=True)
    deviceregistrationdate = models.DateField(db_column='DeviceRegistrationDate', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users\".\"userprofiles'
        app_label = 'survey'
        verbose_name = _('Profile')
        verbose_name_plural = _('Profiles')


class Userroles(models.Model):
    userid = models.OneToOneField('Users', models.DO_NOTHING, db_column='UserId', primary_key=True)
    roleid = models.ForeignKey(Roles, models.DO_NOTHING, db_column='RoleId')

    class Meta:
        managed = False
        db_table = 'users\".\"userroles'
        app_label = 'survey'
        unique_together = (('userid', 'roleid'),)
        verbose_name = _('User role')
        verbose_name_plural = _('User roles')

    def __str__(self):
        return f'{self.userid.username} - {self.roleid.name}'


class Users(models.Model):
    id = models.UUIDField(db_column='Id', primary_key=True)
    userprofileid = models.ForeignKey(Userprofiles, models.DO_NOTHING, db_column='UserProfileId', blank=True, null=True)
    fullname = models.TextField(db_column='FullName', blank=True, null=True)
    isarchived = models.BooleanField(db_column='IsArchived')
    islockedbysupervisor = models.BooleanField(db_column='IsLockedBySupervisor')
    islockedbyheadquaters = models.BooleanField(db_column='IsLockedByHeadquaters')
    creationdate = models.DateTimeField(db_column='CreationDate')
    passwordhashsha1 = models.TextField(db_column='PasswordHashSha1', blank=True, null=True)
    email = models.CharField(db_column='Email', max_length=256, blank=True, null=True)
    emailconfirmed = models.BooleanField(db_column='EmailConfirmed')
    passwordhash = models.TextField(db_column='PasswordHash', blank=True, null=True)
    securitystamp = models.TextField(db_column='SecurityStamp', blank=True, null=True)
    phonenumber = models.TextField(db_column='PhoneNumber', blank=True, null=True)
    phonenumberconfirmed = models.BooleanField(db_column='PhoneNumberConfirmed')
    twofactorenabled = models.BooleanField(db_column='TwoFactorEnabled')
    lockoutenddateutc = models.DateTimeField(db_column='LockoutEndDateUtc', blank=True, null=True)
    lockoutenabled = models.BooleanField(db_column='LockoutEnabled')
    accessfailedcount = models.IntegerField(db_column='AccessFailedCount')
    username = models.CharField(db_column='UserName', unique=True, max_length=256)

    class Meta:
        managed = False
        db_table = 'users\".\"users'
        app_label = 'survey'
        verbose_name = _('User')
        verbose_name_plural = _('Users')

    def __str__(self):
        return f'{self.username}'
