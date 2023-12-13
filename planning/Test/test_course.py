from rest_framework.test import APITestCase, APIClient
from rest_framework import status
from django.urls import reverse
from account.models import User
from course.models import Course
# from django.contrib.auth.models import User
from django.contrib.auth.models import User as DjangoUser
from django.conf import settings

# settings.configure(DEBUG=True)


class CourseTestCase(APITestCase):
    def setUp(self):
        # Create a user with specific roles
        # self.student_user = User.objects.create_user(username='student', role=User.STUDENT)
        # self.examiner_user = User.objects.create_user(username='examiner', role=User.EXAMINER)
        # self.admin_user = User.objects.create_user(username='admin', role=User.ADMIN)

        self.user = User.objects.create_user(username='testuser', password='testpassword', role=User.STUDENT)

        self.course = Course.objects.create(
            course_name='Test Course',
            course_description='Test Description',
            course_date='2023-12-31'
            # Add other required fields here
        )

        # Set up the client for API requests
        self.client = APIClient()

        def test_course_list(self):
            # Authenticate the client
            self.client.force_authenticate(user=self.user)

            # Make a GET request to the course list endpoint
            url = reverse('course-list')
            response = self.client.get(url)

            # Check if the request was successful (HTTP 200 OK)
            self.assertEqual(response.status_code, status.HTTP_200_OK)

            # Check if the test course is present in the response data
            self.assertIn('Test Course', response.data[0]['course_name'])

        def test_course_detail_access(self):
            # Check if authenticated examiner user can access the course details
            self.client.force_authenticate(user=self.examiner_user)
            response = self.client.get(reverse('course-detail', kwargs={'id': self.course1.id}))
            self.assertEqual(response.status_code, status.HTTP_200_OK)