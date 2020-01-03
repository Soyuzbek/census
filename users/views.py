import random
import string

from django.conf import settings
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponseForbidden, HttpResponse
from django.shortcuts import render, redirect
from django.urls import reverse
from django.utils.decorators import method_decorator
from django.views import View
from django.views.generic import DetailView, ListView
from django.utils.translation import ugettext_lazy as _

from users.forms import EmployeeForm, UserLoginForm, EmployeeCreateForm
from users.models import Employee

# my imports
from django.views.generic.edit import FormView, CreateView


class LoginView(View):
    template_name = 'login.html'
    form_class = UserLoginForm

    def get(self, request):
        if request.user.is_authenticated:
            return redirect('users:home')
        form = self.form_class({'next': request.GET.get('next', reverse('users:home'))})
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
    success_url = '/'

    def form_valid(self, form):
        employee = form.save(commit=False)
        employee.district = self.request.user.district
        employee.save()
        return super().form_valid(form)
