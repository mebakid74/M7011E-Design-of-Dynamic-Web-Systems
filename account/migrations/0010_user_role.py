# Generated by Django 4.2.7 on 2023-11-30 11:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0009_remove_user_role'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='role',
            field=models.PositiveSmallIntegerField(blank=True, choices=[(1, 'Admin'), (2, 'Examiner'), (3, 'Student')], default=3, null=True),
        ),
    ]
