# Generated by Django 3.1.4 on 2020-12-13 20:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0005_notice_image'),
    ]

    operations = [
        migrations.CreateModel(
            name='Announcement',
            fields=[
                ('notice_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='core.notice')),
                ('category', models.CharField(max_length=50)),
            ],
            bases=('core.notice',),
        ),
        migrations.AlterField(
            model_name='notice',
            name='image',
            field=models.FilePathField(blank=True, null=True),
        ),
    ]
