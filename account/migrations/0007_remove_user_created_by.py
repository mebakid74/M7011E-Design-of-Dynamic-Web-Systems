# Generated by Django 4.2.7 on 2023-11-30 10:50

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0006_remove_user_uid'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='created_by',
        ),
    ]
