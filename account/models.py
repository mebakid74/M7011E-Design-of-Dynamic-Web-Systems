from django.db import models
from django.contrib.auth.models import AbstractUser, PermissionsMixin, BaseUserManager


# CustomUser model to handle user creation and superuser logic
class CustomUserManager(BaseUserManager):

    # Method to create a standard user
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('The Email field must be set')

        """
        Normalize the email (convert to lowercase)
        Create a new user instance with the provided email and extra fields
        Set the password for the user and save in the database
        """
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)

        return user

    # Method to create a superuser with additional privileges
    def create_superuser(self, email, password=None, **extra_fields):
        # Set default values for fields if not provided
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('role', User.ADMIN)

        # Ensure that the superuser has staff and superuser privileges
        if not extra_fields['is_staff']:
            raise ValueError('Superuser must have is_staff=True.')
        if not extra_fields['is_superuser']:
            raise ValueError('Superuser must have is_superuser=True.')

        # Create a new superuser using the create_user method with provided email, password, and extra fields
        return self.create_user(email, password, **extra_fields)


# User model inheriting from AbstractUser and PermissionsMixin
class User(AbstractUser, PermissionsMixin):
    # Constants representing different roles
    ADMIN = 1
    EXAMINER = 2
    STUDENT = 3

    # Choices for the role field in the User model
    ROLE_CHOICES = (
        (ADMIN, 'Admin'),
        (EXAMINER, 'Examiner'),
        (STUDENT, 'Student')
    )

    username = None
    email = models.EmailField(max_length=500, unique=True)
    name = models.CharField(max_length=500)

    # Define the role field with choices for the user's role
    role = models.PositiveSmallIntegerField(choices=ROLE_CHOICES, blank=True, null=True, default=None)

    # Set email as the unique identifier for the user instead of username
    USERNAME_FIELD = 'email'

    # Fields required when creating a user
    REQUIRED_FIELDS = ['name']

    # Use the CustomUserManager for managing User objects
    objects = CustomUserManager()

    # Return the email when the User object is printed
    def __str__(self):
        return self.email
