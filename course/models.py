from django.db import models

from category.models import Categories


class Course(models.Model):
    class Meta:
        db_table = 'course'

    course_name = models.CharField(max_length=30)
    course_description = models.TextField()
    course_date = models.DateField()

    category = models.ForeignKey(Categories, on_delete=models.CASCADE, related_name='courses', default=None)

    def __str__(self):
        return self.course_name
