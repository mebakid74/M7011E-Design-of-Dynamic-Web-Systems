# Generated by Django 4.2.7 on 2023-12-06 11:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('course', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='for_admins',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='course',
            name='for_examiners',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='course',
            name='for_students',
            field=models.BooleanField(default=False),
        ),
    ]
