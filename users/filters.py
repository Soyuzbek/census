import django_filters

from users.models import Employee


class EmployeeFilter(django_filters.FilterSet):
    class Meta:
        model = Employee
        fields = {
            'number': ['exact'],
            'first_name': ['icontains'],
            'last_name': ['icontains'],
            'role': ['exact'],
            'is_badge_printed': ['exact']

        }
