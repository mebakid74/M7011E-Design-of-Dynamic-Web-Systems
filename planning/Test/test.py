from rest_framework.test import APITestCase
from rest_framework import status
from django.urls import reverse
from account.models import User
from course.models import Course


class CourseViewsTestCase(APITestCase):
    def setUp(self):
        # Create a user with specific roles
        self.student_user = User.objects.create_user(username='student', role=User.STUDENT)
        self.examiner_user = User.objects.create_user(username='examiner', role=User.EXAMINER)
        self.admin_user = User.objects.create_user(username='admin', role=User.ADMIN)

        # Create some courses
        self.course1 = Course.objects.create(title='Course 1', description='Description 1')
        self.course2 = Course.objects.create(title='Course 2', description='Description 2')

    def test_course_list_access(self):
        # Check if authenticated users can access the course list
        self.client.force_authenticate(user=self.student_user)
        response = self.client.get(reverse('course-list'))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_course_detail_access(self):
        # Check if authenticated users can access the course details
        self.client.force_authenticate(user=self.examiner_user)
        response = self.client.get(reverse('course-detail', kwargs={'id': self.course1.id}))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    # Write similar test methods for other views (course_create, course_update, course_delete, etc.)
