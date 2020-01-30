import django_filters

from users.models import Employee


class EmployeeFilter(django_filters.FilterSet):
    class Meta:
        model = Employee
        fields = ('number', 'first_name', 'last_name', 'is_badge_printed')
