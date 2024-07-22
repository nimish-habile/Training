from django.db import models

# Create your models here.
class student(models.Model):
    student_id = models.IntegerField(max_length=100)
    name = models.CharField(max_length=200)
    class_teacher = models.CharField(max_length=200)
    attendence = models.IntegerField(max_length=10)
    
class teacher(models.Model):
    name = models.IntegerField(max_length=200)
    salary = models.IntegerField(max_length=200)
    attendance = models.IntegerField(max_length=10)