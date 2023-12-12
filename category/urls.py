from django.urls import path
from . import views

urlpatterns = [
    path('', views.all_categories, name='all_categories'),
    path('list/', views.category_list, name='category-list'),
    path('create/', views.category_create, name='category-create'),
]
