from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.generics import ListAPIView
from rest_framework.exceptions import NotFound
from django.contrib.auth.decorators import login_required
from rest_framework.decorators import api_view
from .serializers import UserSerializer
from .models import User
import jwt, datetime


# Views for user registration, login, user listing, and logout
class RegisterView(APIView):

    # Method to register a new user
    def post(self, request):

        # Serialize user data from request
        serializer = UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        # Extract validated data from serializer
        email = serializer.validated_data.get('email')
        password = serializer.validated_data.get('password')
        name = serializer.validated_data.get('name')

        role = None

        # Check email domain to assign role
        is_superuser = User.objects.filter(email=email).exists()

        # Email's should end like this to get the correct role
        if email.endswith('@examiner.com'):
            role = User.EXAMINER
        elif email.endswith('@student.com'):
            role = User.STUDENT
        elif is_superuser:
            role = User.ADMIN

        # Create user with specified details
        user = User.objects.create_user(email=email, password=password, name=name, role=role)

        return Response(serializer.data, status=status.HTTP_201_CREATED)


# Views for user login
class LoginView(APIView):
    def post(self, request):
        # Extract email and password from request data
        email = request.data['email']
        password = request.data['password']

        # Retrieve the user based on the provided email
        user = User.objects.filter(email=email).first()

        # Check if user exists
        if user is None:
            raise AuthenticationFailed('Error: User is not found!')

        # Check if the provided password matches the user's password
        if not user.check_password(password):
            raise AuthenticationFailed('Error: Incorrect password!')

        # Create a JWT token for user authentication
        payload = {
            'id': user.id,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(minutes=60),
            'iat': datetime.datetime.utcnow()
        }

        token = jwt.encode(payload, 'secret', algorithm='HS256')
        response = Response()

        # Set JWT token as a cookie in the response
        response.set_cookie(key='jwt', value=token, httponly=True)
        response.data = {
            'message': 'Login Successful!',
            'jwt': token
        }
        return response


# Views for retrieving user details
class UserView(ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def list(self, request, *args, **kwargs):
        token = request.COOKIES.get('jwt')

        if not token:
            raise AuthenticationFailed('Error: Unauthenticated!')

        # Validate the JWT token
        try:
            payload = jwt.decode(token, 'secret', algorithms=['HS256'])
        except jwt.ExpiredSignatureError:
            raise AuthenticationFailed('Error: Unauthenticated!')

        user_id = kwargs.get('pk')
        queryset = self.get_queryset()

        # Retrieve user details based on the user ID
        user = queryset.filter(id=user_id).first()

        if not user:
            raise NotFound('User not found!')

        serializer = self.get_serializer(user)
        return Response(serializer.data)


# Views for user logout
class LogoutView(APIView):
    def post(self, request):
        response = Response()

        # Delete JWT token cookie from the response
        response.delete_cookie('jwt')
        response.data = {
            'message': 'Logout Successful!'
        }
        return response

