import django_filters

from users.models import Employee, Territory


def territories(request):
    if request is None:
        return Territory.objects.all()
    return Territory.objects.filter(district=request.user.district)


class EmployeeFilter(django_filters.FilterSet):
    # territory = django_filters.ModelChoiceFilter(queryset=territories)

    class Meta:
        model = Employee
        fields = {
            'number': ['exact'],
            'first_name': ['icontains'],
            'last_name': ['icontains'],
            'role': ['exact'],
            'territory': ['exact'],
            'is_badge_printed': ['exact'],
            'dismissed': ['exact'],

        }
