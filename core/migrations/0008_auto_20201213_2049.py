# Generated by Django 3.1.4 on 2020-12-13 20:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0007_auto_20201213_2037'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notice',
            name='description',
            field=models.TextField(blank=True, null=True, verbose_name='Description'),
        ),
    ]
