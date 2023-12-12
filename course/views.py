from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated, BasePermission
from rest_framework import viewsets
from .serializers import CourseSerializer
from rest_framework import status
from account.models import User
from .models import Course


# Custom Permissions for different user roles
class IsStudent(BasePermission):
    def has_permission(self, request, view):
        return request.user.role == User.STUDENT if request.user.role else False


class IsExaminer(BasePermission):
    def has_permission(self, request, view):
        return request.user.role == User.EXAMINER if request.user.role else False


class IsAdmin(BasePermission):
    def has_permission(self, request, view):
        return request.user.role == User.ADMIN if request.user.role else False


# ViewSet for Course model to handle CRUD operations
class CourseViewSet(viewsets.ModelViewSet):
    serializer_class = CourseSerializer
    queryset = Course.objects.all()
    permission_classes = [IsAuthenticated]

    # Settings for different permissions based on actions
    def get_permissions(self):
        if self.action == 'list':
            return [IsAuthenticated()]
        elif self.action in ['retrieve', 'update', 'partial_update']:
            return [IsAuthenticated() | IsExaminer() | IsAdmin()]
        elif self.action in ['create', 'destroy']:
            return [IsAuthenticated(), IsAdmin()]
        else:
            return [IsAuthenticated()]


@api_view(['GET'])
@permission_classes([IsAuthenticated])
#  Returns URLs for course-related actions
def course(request):
    course_urls = {
        'List': '/course-list/',
        'Detail View': '/course-detail/<int:id>',
        'Create': '/course-create/',
        'Update': '/course-update/<int:id>',
        'Delete': '/course-delete/<int:id>',
    }
    return Response(course_urls)


@api_view(['GET'])
@permission_classes([IsAuthenticated, IsStudent | IsExaminer | IsAdmin])
# Lists all courses accessible to students, examiners, and admins
def course_list(request):
    try:
        courses = Course.objects.all()
        serializer = CourseSerializer(courses, many=True)
        return Response(serializer.data)
    except:
        return Response({"error": "Access denied, unauthorized user!"}, status=status.HTTP_403_FORBIDDEN)


@api_view(['GET'])
@permission_classes([IsAuthenticated, IsStudent | IsExaminer | IsAdmin])
# Retrieves details of a specific course by ID for authorized users
def course_detail(request, id):
    try:
        course = get_object_or_404(Course, id=id)
        serializer = CourseSerializer(course)
        return Response(serializer.data)
    except:
        return Response({"error": "Access denied, unauthorized user!"}, status=status.HTTP_403_FORBIDDEN)


@api_view(['POST'])
@permission_classes([IsAuthenticated, IsAdmin])
# Creates a new course by admins
def course_create(request):
    serializer = CourseSerializer(data=request.data)

    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    return Response({"error": "Access denied, unauthorized user!"}, status=status.HTTP_403_FORBIDDEN)


@api_view(['PUT'])
@permission_classes([IsAuthenticated, IsAdmin | IsExaminer])
# Updates an existing course by admins or examiners
def course_update(request, id):
    course = get_object_or_404(Course, id=id)
    serializer = CourseSerializer(course, data=request.data)

    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)

    return Response({"error": "Access denied, unauthorized user!"}, status=status.HTTP_403_FORBIDDEN)


@api_view(['DELETE'])
@permission_classes([IsAuthenticated, IsAdmin])
# Deletes a course by admins
def course_delete(request, id):
    user = request.user
    course = get_object_or_404(Course, id=id)

    if user.role == User.ADMIN:
        course.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    else:
        return Response({"error": "Access denied, unauthorized user!"}, status=status.HTTP_403_FORBIDDEN)
