from django.urls import path

from users.views import (LoginView,
                         LogoutView,
                         AgreementDetailView,
                         EmployeeListView,
                         EmployeeDetailView,
                         EmployeeUpdateView,
                         EmployeeDeleteView,
                         IndexView,
                         PhotoUpdateView,
                         load_territories_view,
                         load_districts_view, LoadDataByPINView)

urlpatterns = [
    path('', LoginView.as_view(), name='login'),
    path('home/', IndexView.as_view(), name='home'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('employee/list/', EmployeeListView.as_view(), name='list'),
    path('employee/<int:pk>/', EmployeeDetailView.as_view(), name='detail'),
    path('employee/update/<int:pk>/', EmployeeUpdateView.as_view(), name='update'),
    path('employee/delete/<int:pk>/', EmployeeDeleteView.as_view(), name='delete'),
    path('employee/agreement/<int:pk>/', AgreementDetailView.as_view(), name='agreement_detail'),
    path('ajax/load-districts/', load_districts_view, name='load_districts'),
    path('ajax/load-territories/', load_territories_view, name='load_territories'),
    path('ajax/update-photo/<int:pk>', PhotoUpdateView.as_view(), name='update_photo'),
    path('ajax/load-data-by-pin', LoadDataByPINView.as_view(), name='load_data_by_pin'),
]
