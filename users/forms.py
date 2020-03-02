from django import forms
from django.forms import TextInput, PasswordInput
from django.utils.translation import ugettext_lazy as _
from users.models import phone, Employee, District, Territory, SiteSettings


class TelInput(TextInput):
    input_type = 'tel'


class HiddenSelectInput(forms.Select):
    input_type = 'hidden'


class UserLoginForm(forms.Form):
    number = forms.CharField(
        validators=[phone],
        widget=TelInput(attrs={'placeholder': '550XXXXXX',
                               'pattern': '^\d{9}$'}),
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
        exclude = ['qrcode', 'agreement', 'login', 'password', 'is_badge_printed', 'is_badge_returned', 'photo',
                   'dismissed']
        widgets = {
            'number': TelInput(attrs={'class': 'form-control masked', 'placeholder': '555 500 000',
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
            # 'photo': forms.FileInput(attrs={'class': 'form-control-file'}),
            'education': forms.Select(attrs={'class': 'form-control'}),
            'role': forms.Select(attrs={'class': 'form-control'}),
            'department': TextInput(attrs={'class': 'form-control'}),
            'sector': TextInput(attrs={'class': 'form-control'}),
            'plot': TextInput(attrs={'class': 'form-control'}),
            'territory': forms.Select(attrs={'class': 'form-control'}),
            'workday': forms.Select(attrs={'class': 'form-control'}),
            'district': forms.HiddenInput(
                attrs={'class': 'text-dark font-weight-bold form-control'}),
        }

    def __init__(self, user, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['district'].queryset = District.objects.filter(user=user)
        self.fields['district'].initial = District.objects.first()
        self.fields['district'].empty_label = None
        self.fields['territory'].queryset = Territory.objects.filter(district=user.district)
        settings = SiteSettings.load()
        role_temp = settings.role
        if role_temp == 'cor':
            role = (
                ('cor', _('Coordinator')),
            )
        elif role_temp == 'ins':
            role = (
                ('ins', _('Instructor')),
            )
        elif role_temp == 'enum':
            role = (
                ('enum', _('Enumerator')),
            )

        self.fields['role'].choices = role


class EmployeeUpdateForm(forms.ModelForm):
    class Meta:
        model = Employee
        exclude = ['qrcode', 'agreement', 'login', 'password', 'district', 'photo']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        initial = kwargs.get('initial')

        territory = initial.get('territory')

        self.fields['territory'].queryset = territory


class PhotoUpdateForm(forms.ModelForm):
    x1 = forms.CharField(widget=forms.HiddenInput(), required=False)
    y1 = forms.CharField(widget=forms.HiddenInput(), required=False)
    x2 = forms.CharField(widget=forms.HiddenInput(), required=False)
    y2 = forms.CharField(widget=forms.HiddenInput(), required=False)

    class Meta:
        model = Employee
        fields = ['photo']
