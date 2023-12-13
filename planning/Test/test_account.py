from rest_framework.test import APITestCase, APIClient
from django.test import TestCase
from django.urls import reverse
from rest_framework import status
from account.models import User


class RegisterViewTest(TestCase):
    def setUp(self):
        # Create an instance of the APIClient for making API requests
        self.client = APIClient()

    def test_register_user(self):
        # Test registration of a new user
        url = reverse('register')
        data = {
            'name': 'John Doe',
            'email': 'john@example.com',
            'password': 'securepassword'
        }
        # Make a POST request to the registration endpoint
        response = self.client.post(url, data, format='json')
        # Check if the response status code is 201 (Created)
        self.assertEqual(response.status_code, status.HTTP_201_CREATED,
                         "Expected account creation for user")
        if response.status_code == status.HTTP_201_CREATED:
            print("Account created successfully")
        # Check if a user with the provided name is created in the database
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(User.objects.get().name, 'John Doe')


class LoginViewTest(TestCase):
    def setUp(self):
        # Create an instance of the APIClient for making API requests
        self.client = APIClient()
        # Create a test user for login testing
        self.user = User.objects.create_user(
            email='test@example.com',
            password='testpassword',
            name='Test User'
        )

    def test_login_user(self):
        # Test successful login with correct credentials
        url = reverse('login')
        data = {
            'email': 'test@example.com',
            'password': 'testpassword'
        }
        # Make a POST request to the login endpoint
        response = self.client.post(url, data, format='json')
        # Check if the response status code is 200 (OK)
        self.assertEqual(response.status_code, status.HTTP_200_OK,
                         "Expected to log in")
        if response.status_code == status.HTTP_200_OK:
            print("Account logged in successfully")
        # Check if the 'jwt' token is present in the response cookies
        self.assertIn('jwt', response.cookies)

    def test_login_invalid_credentials(self):
        # Test login with invalid credentials
        url = reverse('login')
        data = {
            'email': 'test@example.com',
            'password': 'wrongpassword'
        }
        # Make a POST request to the login endpoint with incorrect password
        response = self.client.post(url, data, format='json')
        # Check if the response status code is 401 (Unauthorized)
        self.assertEqual(response.status_code, status.HTTP_401_UNAUTHORIZED,
                         "Expected unauthorized login")
        if response.status_code == status.HTTP_401_UNAUTHORIZED:
            print("Unauthorized account logged in unsuccessfully")
