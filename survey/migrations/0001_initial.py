# Generated by Django 2.2.5 on 2019-12-26 09:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Roles',
            fields=[
                ('id', models.UUIDField(db_column='Id', primary_key=True, serialize=False)),
                ('name', models.CharField(db_column='Name', max_length=256, unique=True)),
            ],
            options={
                'db_table': 'roles',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Userclaims',
            fields=[
                ('id', models.AutoField(db_column='Id', primary_key=True, serialize=False)),
                ('claimtype', models.TextField(db_column='ClaimType')),
                ('claimvalue', models.TextField(db_column='ClaimValue')),
            ],
            options={
                'db_table': 'userclaims',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Userlogins',
            fields=[
                ('loginprovider', models.CharField(db_column='LoginProvider', max_length=128, primary_key=True, serialize=False)),
                ('providerkey', models.CharField(db_column='ProviderKey', max_length=128)),
            ],
            options={
                'db_table': 'userlogins',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Userprofiles',
            fields=[
                ('id', models.AutoField(db_column='Id', primary_key=True, serialize=False)),
                ('deviceid', models.TextField(blank=True, db_column='DeviceId', null=True)),
                ('supervisorid', models.UUIDField(blank=True, db_column='SupervisorId', null=True)),
                ('deviceappversion', models.TextField(blank=True, db_column='DeviceAppVersion', null=True)),
                ('deviceappbuildversion', models.IntegerField(blank=True, db_column='DeviceAppBuildVersion', null=True)),
                ('deviceregistrationdate', models.DateField(blank=True, db_column='DeviceRegistrationDate', null=True)),
            ],
            options={
                'db_table': 'userprofiles',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('id', models.UUIDField(db_column='Id', primary_key=True, serialize=False)),
                ('fullname', models.TextField(blank=True, db_column='FullName', null=True)),
                ('isarchived', models.BooleanField(db_column='IsArchived')),
                ('islockedbysupervisor', models.BooleanField(db_column='IsLockedBySupervisor')),
                ('islockedbyheadquaters', models.BooleanField(db_column='IsLockedByHeadquaters')),
                ('creationdate', models.DateTimeField(db_column='CreationDate')),
                ('passwordhashsha1', models.TextField(blank=True, db_column='PasswordHashSha1', null=True)),
                ('email', models.CharField(blank=True, db_column='Email', max_length=256, null=True)),
                ('emailconfirmed', models.BooleanField(db_column='EmailConfirmed')),
                ('passwordhash', models.TextField(blank=True, db_column='PasswordHash', null=True)),
                ('securitystamp', models.TextField(blank=True, db_column='SecurityStamp', null=True)),
                ('phonenumber', models.TextField(blank=True, db_column='PhoneNumber', null=True)),
                ('phonenumberconfirmed', models.BooleanField(db_column='PhoneNumberConfirmed')),
                ('twofactorenabled', models.BooleanField(db_column='TwoFactorEnabled')),
                ('lockoutenddateutc', models.DateTimeField(blank=True, db_column='LockoutEndDateUtc', null=True)),
                ('lockoutenabled', models.BooleanField(db_column='LockoutEnabled')),
                ('accessfailedcount', models.IntegerField(db_column='AccessFailedCount')),
                ('username', models.CharField(db_column='UserName', max_length=256, unique=True)),
            ],
            options={
                'db_table': 'users',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Versioninfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('version', models.BigIntegerField(db_column='Version')),
                ('appliedon', models.DateTimeField(blank=True, db_column='AppliedOn', null=True)),
                ('description', models.CharField(blank=True, db_column='Description', max_length=1024, null=True)),
            ],
            options={
                'db_table': 'VersionInfo',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Userroles',
            fields=[
                ('userid', models.ForeignKey(db_column='UserId', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='survey.Users')),
            ],
            options={
                'db_table': 'userroles',
                'managed': False,
            },
        ),
    ]
