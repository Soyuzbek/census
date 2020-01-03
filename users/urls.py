from django.urls import path
from users.views import (LoginView,
                         LogoutView,
                         EmployeeCreateView,
                         AgreementDetailView,
                         EmployeeListView,
                         EmployeeDetailView)

urlpatterns = [
    path('', LoginView.as_view(), name='login'),
    path('home/', EmployeeCreateView.as_view(), name='home'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('employee/list/', EmployeeListView.as_view(), name='list'),
    path('employee/<int:pk>/', EmployeeDetailView.as_view(), name='detail'),
    path('employee/agreement/<int:pk>/', AgreementDetailView.as_view(), name='agreement_detail'),
]