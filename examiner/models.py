from django.db import models
from django.conf import settings
from course.models import Course


class Examiner(models.Model):
    class Meta:
        db_table = 'examiner'

    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=30)
    phone_number = models.CharField(max_length=30)
    date = models.DateField()

    course = models.OneToOneField(Course, on_delete=models.CASCADE)

    def __str__(self):
        return f"Examiner: {self.user.email}"
