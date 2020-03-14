from rest_framework import serializers
from ..models import Employee, District


class DistrictSerializer(serializers.ModelSerializer):
    class Meta:
        model = District
        fields = '__all__'


class EmployeeSerializer(serializers.ModelSerializer):
    district = DistrictSerializer(read_only=True)
    agreement = serializers.CharField(required=False)
    login = serializers.CharField(required=False)
    password = serializers.CharField(required=False)

    class Meta:
        model = Employee
        fields = '__all__'

    def get_validation_exclusions(self):
        exclusions = super().get_validation_exclusions()
        return exclusions + ['agreement', 'login', 'password']


class EmployeeExcelSerializer(serializers.ModelSerializer):

    class Meta:
        model = Employee
        fields = ('last_name', 'first_name', 'patronymic', 'department', 'sector', 'plot')
