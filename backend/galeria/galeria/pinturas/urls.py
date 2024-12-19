from django.urls import path
from .views import PinturaListView, PinturaDetailView

urlpatterns = [
    path('pinturas/', PinturaListView.as_view(), name='pintura-list'),
    path('pintura/<int:pk>/', PinturaDetailView.as_view(), name='pintura-detail'),
]
