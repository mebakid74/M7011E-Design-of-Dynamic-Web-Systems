# Generated by Django 4.2.7 on 2023-12-07 09:52

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0011_alter_user_role'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='role',
        ),
    ]
