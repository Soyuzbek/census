from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework.parsers import MultiPartParser, FormParser
from django.contrib.auth import authenticate
from django.views.decorators.csrf import csrf_exempt
from rest_framework.authtoken.models import Token
from rest_framework.decorators import permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.status import (
    HTTP_400_BAD_REQUEST,
    HTTP_404_NOT_FOUND,
    HTTP_200_OK
)

from ..models import Employee
from .serializers import EmployeeSerializer


class LoginView(APIView):

    @csrf_exempt
    @permission_classes((AllowAny,))
    def post(self, request):
        data = request.data

        number = data.get('number', None)
        password = data.get('password', None)

        if number is None or password is None:
            return Response({'error': 'Please provide both username and password'},
                            status=HTTP_400_BAD_REQUEST)

        user = authenticate(number=number, password=password)

        if not user:
            return Response({'error': 'Invalid Credentials'},
                            status=HTTP_404_NOT_FOUND)

        token, _ = Token.objects.get_or_create(user=user)
        return Response({'token': token.key},
                        status=HTTP_200_OK)


class LogoutView(APIView):

    @permission_classes((IsAuthenticated,))
    def get(self, request):
        request.user.auth_token.delete()
        return Response(status=HTTP_200_OK)


class EmployeeViewSet(viewsets.ModelViewSet):
    queryset = Employee.objects.all().order_by('-date_joined')
    serializer_class = EmployeeSerializer


class EmployeeCreateView(APIView):
    permission_classes = (IsAuthenticated,)
    parser_classes = (MultiPartParser, FormParser)

    @csrf_exempt
    def post(self, request):
        serializer = EmployeeSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(district=request.user.district)
        else:
            return Response({'errors': serializer.errors})

        return Response({'message': 'OK'},
                        status=HTTP_200_OK)