# Generated by Django 2.2.8 on 2020-02-25 12:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0026_auto_20200225_1722'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employee',
            name='education',
            field=models.CharField(choices=[('1', 'bachelor'), ('2', 'specialist'), ('3', 'master'), ('4', 'incomplete higher education'), ('5', 'specialized secondary education'), ('6', 'initial vocational training'), ('7', 'general secondary education'), ('8', 'lower secondary education')], default=1, max_length=1, verbose_name='education'),
        ),
    ]
