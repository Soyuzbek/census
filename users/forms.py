from django import forms
from django import forms
from django.forms import TextInput, PasswordInput
from django.utils.translation import ugettext_lazy as _

from users.models import phone, Employee, District, Territory


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
        exclude = ['qrcode', 'agreement', 'login', 'password']
        widgets = {
            'number': TelInput(attrs={'class': 'form-control masked', 'placeholder': '123456789',
                                      'pattern': '\d{9}'}),
            'last_name': TextInput(attrs={ 'class': 'form-control'}),
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
            'territory': forms.Select(attrs={'class': 'form-control'}),
            'district': forms.HiddenInput(
                attrs={'class': 'text-dark font-weight-bold form-control'}),

        }

    def __init__(self, user, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['district'].queryset = District.objects.filter(user=user)
        self.fields['district'].initial = District.objects.first()
        self.fields['district'].empty_label = None
        self.fields['territory'].queryset = Territory.objects.filter(district=user.district)


class EmployeeUpdateForm(forms.ModelForm):
    class Meta:
        model = Employee
        exclude = ['qrcode', 'agreement', 'login', 'password', 'district']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        initial = kwargs.get('initial')

        territory = initial.get('territory')

        self.fields['territory'].queryset = territory

