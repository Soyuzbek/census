from rest_framework import serializers

from users.models import Employee


class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = ['pk', 'number', 'first_name', 'last_name', 'patronymic', 'agreement']


class EmployeeCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        exclude = ['qrcode', 'date_joined']
