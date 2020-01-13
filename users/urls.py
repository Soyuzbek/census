from django.urls import path
from users.views import (LoginView,
                         LogoutView,
                         EmployeeCreateView,
                         AgreementDetailView,
                         EmployeeListView,
                         EmployeeDetailView,
                         EmployeeUpdateView,
                         EmployeeDeleteView, ExampleView)

urlpatterns = [
    path('', LoginView.as_view(), name='login'),
    path('home/', EmployeeCreateView.as_view(), name='home'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('employee/list/', EmployeeListView.as_view(), name='list'),
    path('employee/<int:pk>/', EmployeeDetailView.as_view(), name='detail'),
    path('employee/update/<int:pk>/', EmployeeUpdateView.as_view(), name='update'),
    path('employee/delete/<int:pk>/', EmployeeDeleteView.as_view(), name='delete'),
    path('employee/agreement/<int:pk>/', AgreementDetailView.as_view(), name='agreement_detail'),
    path('example/', ExampleView.as_view()),
]