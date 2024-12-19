from rest_framework import serializers
from .models import Pintura

class PinturaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pintura
        fields = '__all__'
