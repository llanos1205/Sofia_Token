from django.urls import path
from sofia_token.core_app import views

urlpatterns = [
    path('hello/', views.HelloView.as_view(), name='hello'),
]