from django.db import models
from django.conf import settings
from course.models import Course


class Student(models.Model):
    class Meta:
        db_table = 'student'

    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    courses = models.ManyToManyField(Course, related_name='students')

    def __str__(self):
        return f"Student: {self.user.email}"
