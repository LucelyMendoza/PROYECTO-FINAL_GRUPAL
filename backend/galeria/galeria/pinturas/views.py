from rest_framework import generics
from .models import Pintura
from .serializers import PinturaSerializer

class PinturaListView(generics.ListCreateAPIView):
    queryset = Pintura.objects.all()
    serializer_class = PinturaSerializer

class PinturaDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Pintura.objects.all()
    serializer_class = PinturaSerializer



