# Generated by Django 4.2.7 on 2023-12-13 11:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0013_user_role'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='email',
            field=models.EmailField(max_length=255, unique=True),
        ),
    ]
