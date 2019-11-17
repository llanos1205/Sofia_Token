from rest_framework import viewsets
import rest_framework_filters as filters
from sofia_token.core_app import models

class OrdenFilter(filters.FilterSet):
    class Meta:
        model = models.Orden
        fields = "__all__"