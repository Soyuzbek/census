from django import forms
from .models import Employee


class EmployeeCreateForm(forms.ModelForm):
    class Meta:
        model = Employee
        exclude = ['qrcode', 'agreement', 'login', 'password', 'district']
