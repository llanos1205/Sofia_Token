from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView

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
        return data
class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer