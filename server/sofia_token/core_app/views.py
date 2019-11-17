from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from sofia_token.core_app import models,serializers
from sofia_token.core_app import filters
class HelloView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        content = {'message': 'Hello, World!'}
        return Response(content)
class ItemListView(generics.ListCreateAPIView):
    permission_classes=(IsAuthenticated,)
    queryset=models.Item.objects.all()
    serializer_class=serializers.ItemSerializer
class OrdenListView(generics.ListCreateAPIView):
    #permission_classes=(IsAuthenticated,)
    filter_class=filters.OrdenFilter
    queryset=models.Orden.objects.all()
    serializer_class=serializers.OrdenSerializer
class Orden_n_ItemListView(generics.ListCreateAPIView):
    #permission_classes=(IsAuthenticated,)
    queryset=models.Orden_n_Item.objects.all()
    serializer_class=serializers.Orden_n_ItemSerializer
class Orden_n_ItemListView2(generics.ListCreateAPIView):
    #permission_classes=(IsAuthenticated,)
    queryset=models.Orden_n_Item.objects.all()
    serializer_class=serializers.Orden_n_ItemSerializer2

class ItemDetailView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes=(IsAuthenticated,)
    queryset=models.Item.objects.all()
    serializer_class=serializers.ItemSerializer
class OrdenDetailView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes=(IsAuthenticated,)
    queryset=models.Orden.objects.all()
    serializer_class=serializers.OrdenSerializer
class Orden_n_ItemDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset=models.Orden_n_Item.objects.all()
    serializer_class=serializers.Orden_n_ItemSerializer