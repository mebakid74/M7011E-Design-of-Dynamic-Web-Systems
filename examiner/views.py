from rest_framework import viewsets
from .serializers import ExaminerSerializer
from .models import Examiner


class ExaminerViewSet(viewsets.ModelViewSet):
    queryset = Examiner.objects.all()
    serializer_class = ExaminerSerializer
