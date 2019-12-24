from django.contrib.auth.decorators import login_required
from django.urls import path, include

from users.views import LoginView, IndexView, LogoutView, AgreementDetailView, EmployeeListView, EmployeeDetailView, EmployeeCreateView

urlpatterns = [
    path('', LoginView.as_view(), name='login'),
    path('home/', login_required(IndexView.as_view()), name='home'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('create/', EmployeeCreateView.as_view(), name='create'),
    path('employee/list/', EmployeeListView.as_view(), name='list'),
    path('employee/<int:pk>/', EmployeeDetailView.as_view(), name='detail'),
    path('employee/agreement/<int:pk>/', login_required(AgreementDetailView.as_view()), name='agreement_detail'),
]