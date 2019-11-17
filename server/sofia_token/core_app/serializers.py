from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework import serializers
from sofia_token.core_app import models
from django.contrib.auth.models import User
class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)

        # Add custom claims
        token['name'] = user.username
        token['email']=user.email
        token['pk']=user.pk
        # ...
        return token
    def validate(self, attrs):
        data=super().validate(attrs)
          #mi implementacion no deberia estar tocando nada aqui pero ni modales
        data['name'] = self.user.username
        data['email']=self.user.email
        data['pk']=self.user.pk
        #data['token']=data['access']
        return data
class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer

class ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model=models.Item
        fields="__all__"
class Orden_n_ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model=models.Orden_n_Item
        fields="__all__"
class Orden_n_ItemSerializer2(serializers.ModelSerializer):
    class Meta:
        model=models.Orden_n_Item
        fields=['id','cantidad','producto']
        depth=1

class OrdenSerializer(serializers.ModelSerializer):
    items=Orden_n_ItemSerializer2(many=True,source='orden_n_item_set',read_only=True)
    class Meta:
        model=models.Orden
        fields="__all__"

