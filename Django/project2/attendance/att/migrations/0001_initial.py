# Generated by Django 5.0.7 on 2024-07-22 10:28

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='student',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('student_id', models.IntegerField(max_length=100)),
                ('name', models.CharField(max_length=200)),
                ('class_teacher', models.CharField(max_length=200)),
                ('attendence', models.IntegerField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='teacher',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.IntegerField(max_length=200)),
                ('salary', models.IntegerField(max_length=200)),
            ],
        ),
    ]