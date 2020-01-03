from PIL import Image
from django import forms
from django.core.exceptions import ValidationError
from django.core.validators import RegexValidator
from django.forms import TextInput, PasswordInput, DateInput
from django.utils.translation import ugettext_lazy as _
from users.models import User, phone, District, Employee


class TelInput(TextInput):
    input_type = 'tel'


class HiddenSelectInput(forms.Select):
    input_type = 'hidden'


class EmployeeForm(forms.ModelForm):
    class Meta:
        model = Employee
        exclude = ['qrcode', 'agreement', 'login', 'password', 'district']
        widgets = {
            'number': TelInput(attrs={'class': 'form-control masked', 'placeholder': '550XXXXXX',
                                      'pattern': '\d{9}'}),
            'last_name': TextInput(attrs={'class': 'form-control'}),
            'first_name': TextInput(attrs={'class': 'form-control'}),
            'patronymic': TextInput(attrs={'class': 'form-control'}),
            'gender': forms.Select(attrs={'class': 'form-control'}),
            'birth_day': forms.DateInput(
                attrs={'class': 'date form-control', 'placeholder': 'Мисалы: 31.12.2004'},
                format='%d.%m.%Y'),
            'serial': forms.Select(attrs={'style': 'text-transform: uppercase;', 'class': 'form-control'}),
            'passport_num': TelInput(attrs={'class': 'form-control'}),
            'address': TextInput(attrs={'class': 'form-control'}),
            'authority': TextInput(attrs={'style': 'text-transform: uppercase;', 'class': 'form-control'}),
            'PIN': TelInput(attrs={'class': 'form-control'}),
            'photo': forms.FileInput(attrs={'class': 'form-control-file'}),
            'role': forms.Select(attrs={'class': 'form-control'}),
            'department': forms.Select(attrs={'class': 'form-control'}),
            'sector': forms.Select(attrs={'class': 'form-control'}),
            'plot': forms.Select(attrs={'class': 'form-control'}),

        }


class UserLoginForm(forms.Form):
    number = forms.CharField(validators=[phone],
                             widget=TelInput(
                                 attrs={'class': 'col-12 form-control-sm masked', 'placeholder': '550XXXXXX',
                                        'pattern': '^\d{9}$'}),
                             required=True, help_text=_('This field required'), label=_('number'))
    password = forms.CharField(widget=PasswordInput(attrs={'class': 'col-12 form-control-sm'}), required=True,
                               help_text=_('Password required'), label=_('password'))
    next = forms.CharField(widget=TextInput(attrs={'hidden': True}), required=False)

    class Meta:
        fields = ['number', 'password', 'next']


class EmployeeCreateForm(forms.ModelForm):
    class Meta:
        model = Employee
        exclude = ['qrcode', 'agreement', 'login', 'password', 'district']
