from rest_framework.test import APITestCase, APIClient
from rest_framework import status
from django.urls import reverse
from account.models import User
from course.models import Course
from category.models import Categories


class CourseTestCase(APITestCase):
    def setUp(self):
        self.category = Categories.objects.create(category_name='Test Category')

        self.admin_user = User.objects.create_user(email='admin@example.com', password='adminpass', role=User.ADMIN)
        self.student_user = User.objects.create_user(email='student@example.com', password='studentpass',
                                                     role=User.STUDENT)
        self.examiner_user = User.objects.create_user(email='examiner@example.com', password='examinerpass',
                                                      role=User.EXAMINER)

        self.course = Course.objects.create(
            course_name='Test Course',
            course_description='Test Description',
            course_date='2023-12-31',
            category=self.category
        )

        self.client = APIClient()

    def test_admin_access_course_list(self):
        # Authenticate as admin user
        self.client.force_authenticate(user=self.admin_user)
        url = reverse('course-list')
        response = self.client.get(url)

        # Assuming admin should have access to the course list, expect granted (HTTP 200)
        self.assertEqual(response.status_code, status.HTTP_200_OK,
                         "Expected access to course list to be successful for admin user")

        if response.status_code == status.HTTP_200_OK:
            print("Access to course list is successful for admin user")
        self.assertIn('Test Course', response.data[0]['course_name'])

    def test_student_access_course_list(self):
        # Authenticate as student user
        self.client.force_authenticate(user=self.student_user)
        url = reverse('course-list')
        response = self.client.get(url)

        # Assuming students shouldn't have access to the course list, expect forbidden (HTTP 403)
        self.assertEqual(response.status_code, status.HTTP_403_FORBIDDEN,
                         "Expected access to course list to be forbidden for this user")

        if response.status_code != status.HTTP_403_FORBIDDEN:
            print("Access to course list is allowed for this user")

    def test_examiner_access_course_list(self):
        # Authenticate as examiner user
        self.client.force_authenticate(user=self.examiner_user)
        url = reverse('course-list')
        response = self.client.get(url)

        # Assuming examiner should have access to the course list, expect granted (HTTP 200)
        self.assertEqual(response.status_code, status.HTTP_200_OK, "Expected access to course list to be successful "
                                                                   "for examiner user")
        if response.status_code == status.HTTP_200_OK:
            print("Access to course list is successful for examiner user")
        self.assertIn('Test Course', response.data[0]['course_name'])
