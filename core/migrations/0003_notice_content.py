# Generated by Django 3.1.4 on 2020-12-13 11:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_auto_20201211_1410'),
    ]

    operations = [
        migrations.AddField(
            model_name='notice',
            name='content',
            field=models.TextField(blank=True, null=True),
        ),
    ]
