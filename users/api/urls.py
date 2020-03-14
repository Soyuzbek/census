from django.urls import path
from rest_framework.routers import DefaultRouter
from . import views

app_name = 'api-users'

router = DefaultRouter()
router.register(r'employees', views.EmployeeViewSet)

urlpatterns = [
    path('login/', views.LoginView.as_view(), name='login'),
    path('logout/', views.LogoutView.as_view(), name='logout'),
    path('employee_create/', views.EmployeeCreateView.as_view(), name='employee_create'),
    path('docs/', views.APIDocsView.as_view(), name='docs'),
    path('excel/', views.EmployeeExcel.as_view(), name='excel')
]

urlpatterns += router.urls
