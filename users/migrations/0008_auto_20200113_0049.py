# Generated by Django 2.2.5 on 2020-01-12 18:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0007_auto_20200113_0005'),
    ]

    operations = [
        migrations.AddField(
            model_name='territory',
            name='code',
            field=models.CharField(default=417242, max_length=14, unique=True, verbose_name='code'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='employee',
            name='territory',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='users.Territory', verbose_name='territory'),
        ),
    ]
