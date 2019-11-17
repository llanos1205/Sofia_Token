from django.urls import path
from sofia_token.core_app import views

urlpatterns = [
    path('hello/', views.HelloView.as_view(), name='hello'),
    path('Items/',views.ItemListView.as_view()),
    path('Ordenes/',views.OrdenListView.as_view()),
    path('Ordenes_Items/',views.Orden_n_ItemListView.as_view()),
    path('Ordenes_Items2/',views.Orden_n_ItemListView2.as_view()),
    path('Items/<int:pk>/',views.ItemDetailView.as_view()),
    path('Ordenes/<int:pk>/',views.OrdenDetailView.as_view()),
    path('Ordenes_Items/<int:pk>/',views.Orden_n_ItemDetailView.as_view()),
]