from django import forms
from django import forms
from django.forms import TextInput, PasswordInput
from django.utils.translation import ugettext_lazy as _

from users.models import phone, Employee


class TelInput(TextInput):
    input_type = 'tel'


class HiddenSelectInput(forms.Select):
    input_type = 'hidden'


class UserLoginForm(forms.Form):
    number = forms.CharField(
        validators=[phone],
        widget=TelInput(),
        label=_('number'))

    password = forms.CharField(
        widget=PasswordInput(),
        label=_('password'))

    next = forms.CharField(
        widget=TextInput(attrs={'hidden': True}),
        required=False)

    class Meta:
        fields = ['number', 'password', 'next']


class EmployeeCreateForm(forms.ModelForm):
    class Meta:
        model = Employee
        exclude = ['qrcode', 'agreement', 'login', 'password', 'district']
