from django.views.generic.edit import CreateView
from .temp_forms import EmployeeCreateForm
from django.views.generic.base import TemplateView
from .models import Employee


class EmployeeCreationView(CreateView):
    model = Employee
    template_name = 'employee-create.html'
    form_class = EmployeeCreateForm
    success_url = '/thanks/'

    def form_valid(self, form):
        employee = form.save(commit=False)
        employee.district = self.request.user.district
        employee.save()
        return super().form_valid(form)


class ThanksView(TemplateView):
    template_name = 'thanks.html'
