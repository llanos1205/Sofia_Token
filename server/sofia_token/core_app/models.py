from django.db import models
from django.contrib.auth.models import User
# Create your models here.
class Item(models.Model):
    imagen=models.URLField()
    nombre=models.CharField(max_length=200)
    precio=models.FloatField(default=0)
    descripcion=models.TextField(max_length=800,default="")
    class Meta:
        managed=True
        db_table="Item"
class Orden(models.Model):
    total=models.FloatField(default=0)
    estado=models.TextField(max_length=800)
    cliente=models.ForeignKey(User,on_delete=models.CASCADE)
    fecha=models.DateTimeField()
    items=models.ManyToManyField(Item,related_name='items',through='Orden_n_Item',through_fields=('orden','producto'))
    class Meta:
        managed=True
        db_table="Orden"
class Orden_n_Item(models.Model):
    cantidad=models.IntegerField(default=0)
    orden=models.ForeignKey(Orden,on_delete=models.CASCADE)
    producto=models.ForeignKey(Item,on_delete=models.CASCADE)
    class Meta:
        managed=True
        db_table="Orden_n_Item"


