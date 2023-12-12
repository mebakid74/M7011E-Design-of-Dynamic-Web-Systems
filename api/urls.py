from django.contrib import admin
from django.urls import path, include

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)
# URL patterns for routing requests to different apps or views
urlpatterns = [
    # Admin site URL for Django administration
    path('admin/', admin.site.urls),

    # API endpoints for user authentication and other functionalities
    path('api/', include('account.urls')),
    path('courses/', include('course.urls')),
    path('student/', include('student.urls')),
    path('examiner/', include('examiner.urls')),
    path('category/', include('category.urls')),

    # URL patterns for JWT token-based authentication provided by Django REST Framework
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]
