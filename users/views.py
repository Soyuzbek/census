from django.conf import settings
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core import serializers
from django.http import HttpResponse, HttpResponseForbidden, JsonResponse
from django.shortcuts import render, redirect
from django.urls import reverse
from django.utils.datastructures import MultiValueDictKeyError
from django.utils.decorators import method_decorator
from django.utils.translation import ugettext_lazy as _
from django.views import View
from django.views.generic import DetailView, ListView
# my imports
from django.views.generic.edit import CreateView, UpdateView
from pyexcel_xls import get_data as xls_get
from pyexcel_xlsx import get_data as xlsx_get
from rest_framework.views import APIView

from users.forms import UserLoginForm, EmployeeCreateForm, EmployeeUpdateForm
from users.models import Employee, District, Territory


class LoginView(View):
    template_name = 'login.html'
    form_class = UserLoginForm

    def get(self, request):
        if request.user.is_authenticated:
            return redirect('users:home')
        form = self.form_class()
        redirect_url = request.GET.get('next', reverse('users:home'))

        return render(request, self.template_name, locals())

    def post(self, request):
        form = self.form_class(request.POST)
        if form.is_valid():
            user = authenticate(username=form.cleaned_data.get('number'), password=form.cleaned_data.get('password'))
            if user is not None:
                login(request, user)
                return redirect(form.cleaned_data.get('next'))
            messages.add_message(request, messages.ERROR,
                                 _("Number or password is incorrect. Note that both fields might be case-sensitive"),
                                 'alert-danger')
            return render(request, self.template_name, locals())

        return render(request, self.template_name, locals())


class EmployeeListView(LoginRequiredMixin, ListView):
    paginate_by = 20
    model = Employee
    template_name = 'employee/list.html'


class EmployeeDetailView(DetailView):
    model = Employee
    template_name = 'employee/detail.html'


class AgreementDetailView(LoginRequiredMixin, DetailView):
    model = Employee
    template_name = 'agreements/enumerator.html'


class LogoutView(View):
    login_required = True
    next_page = settings.LOGOUT_REDIRECT_URL

    def get(self, request):
        if request.user.is_authenticated:
            logout(request)
        return redirect(self.next_page)


class LanguageView(View):

    @staticmethod
    def get(request, lang):
        request.session['_language'] = lang
        return redirect(request.META.get('HTTP_REFERER', '/'))


class EmployeeCreateView(LoginRequiredMixin, CreateView):
    model = Employee
    template_name = 'index.html'
    form_class = EmployeeCreateForm

    def form_valid(self, form):
        employee = form.save(commit=False)
        employee.district = self.request.user.district
        employee.save()
        return redirect(reverse('users:agreement_detail', args=[employee.pk]))


class IndexView(View):
    template_name = 'index.html'
    form_class = EmployeeCreateForm

    @method_decorator(login_required)
    def get(self, request):
        if request.user.is_superuser:
            form = self.form_class(request.user, initial={'district': request.user.district})
            pass
        if not request.user.is_authenticated:
            meta_lang = 'ky'
        return render(request, self.template_name, locals())

    @method_decorator(login_required)
    def post(self, request):
        if request.user.is_superuser:
            form = self.form_class(request.user, request.POST, request.FILES)
            if form.is_valid():
                form.save()
                messages.success(request, _('The employee added successfully.'), 'alert-success')
                return redirect('users:home')
            messages.add_message(request, messages.ERROR, _('Please check the fields below form!'), 'alert-danger')
            print(form.errors)
            return render(request, self.template_name, locals())
        return HttpResponseForbidden(b'Forbidden')


class EmployeeUpdateView(LoginRequiredMixin, UpdateView):
    model = Employee
    template_name = 'users/update.html'
    form_class = EmployeeUpdateForm

    def get_initial(self):
        initial = super().get_initial()
        initial['territory'] = Territory.objects.filter(district=self.object.district)
        return initial


class ParseExcel(APIView):

    def get(self, request):
        return render(request, 'users/upload-excel.html')

    def post(self, request, format=None):
        try:
            excel_file = request.FILES['file']

        except MultiValueDictKeyError:
            return HttpResponse("Oops! Something is wrong.")

        if str(excel_file).split('.')[-1] == "xls":
            data = xls_get(excel_file, column_limit=4)
            print('xls')
        elif str(excel_file).split('.')[-1] == "xlsx":
            data = xlsx_get(excel_file, column_limit=4)
            print('xlsx')
        else:
            return HttpResponse("Oops! Something is wrong in checking excel type")

        for item in data['SOAT']:
            print(item)
        return HttpResponse(data['SOAT'])


def load_districts_view(request):
    if request.method == 'GET':
        region = request.GET.get('region')
        districts = District.objects.filter(region=region)
        data = serializers.serialize('json', districts, fields=('name',))
        return JsonResponse({'data': data})


def load_territories_view(request):
    if request.method == 'GET':
        district = request.GET.get('district')
        territory = Territory.objects.filter(district=district)
        data = serializers.serialize('json', territory, fields=('name',))
        return JsonResponse({'data': data})


# Error handler
def error_404(request, exception):
    return render(request, 'errors/404.html', status=404)


def error_500(request):
    return render(request, 'errors/500.html', status=404)
