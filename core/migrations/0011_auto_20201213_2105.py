# Generated by Django 3.1.4 on 2020-12-13 21:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0010_remove_notice_content'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notice',
            name='image',
            field=models.URLField(null=True),
        ),
    ]
