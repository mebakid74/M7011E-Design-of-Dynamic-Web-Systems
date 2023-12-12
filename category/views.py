from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from category.models import Categories
from category.serializers import CategorySerializer
from rest_framework import status
from course.views import IsAdmin


# API view to show available category URLs
@api_view(['GET'])
def all_categories(request):
    category_urls = {
        'List': "/category-list/",
        'Create': "/category-create/",
    }
    return Response(category_urls)


# API view to list all categories
@api_view(['GET'])
def category_list(request):
    categories = Categories.objects.all()
    serialized_categories = CategorySerializer(categories, many=True).data
    return Response(serialized_categories)


# API view to create a new category by Admin
@api_view(['POST'])
@permission_classes([IsAuthenticated, IsAdmin])
def category_create(request):
    serializer = CategorySerializer(data=request.data)

    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    return Response({"error": "Access denied, unauthorized user!"}, status=status.HTTP_403_FORBIDDEN)
