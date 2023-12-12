from django.urls import path
from . import views

# URL for listing available actions for courses
urlpatterns = [
    path('', views.course, name='all_course'),
    path('list/', views.course_list, name='course-list'),
    path('create/', views.course_create, name='course-create'),
    path('detail/<int:id>/', views.course_detail, name='course-detail'),
    path('update/<int:id>/', views.course_update, name='course-update'),
    path('delete/<int:id>/', views.course_delete, name='course-delete')
]

