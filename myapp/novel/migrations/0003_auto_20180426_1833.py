# Generated by Django 2.0 on 2018-04-26 10:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('novel', '0002_employeeinfo'),
    ]

    operations = [
        migrations.RenameField(
            model_name='employeeinfo',
            old_name='Email',
            new_name='ownEmail',
        ),
    ]
