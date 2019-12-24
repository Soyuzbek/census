import os
from io import BytesIO

from PIL import Image
from django.contrib.auth import get_user_model
from django.core.files import File
from django.test import TestCase
from django.urls import reverse

from users.models import District


class TestUser(TestCase):
    @staticmethod
    def get_image_file(name, ext='png', size=(50, 50), color=(256, 0, 0)):
        file_obj = BytesIO()
        image = Image.new("RGBA", size=size, color=color)
        image.save(file_obj, ext)
        file_obj.seek(0)
        return File(file_obj, name=name)

    def setUp(self):
        district = District.objects.create(region=District.REGION_CHOICES[1][0], name='Uzgen')
        district.save()
        data = {
            'number': '+996 (559) 50 35 00',
            'password': 'test1234df',
            'firstname': 'Soyuzbek',
            'last_name': 'Orozbek uulu',
            'district': district,
            'agreement': '000035',
            'image': self.get_image_file('sample'),
            'is_staff': True,
            'is_superuser': True
        }
        self.user = get_user_model().objects.create_user(data, password='test10er3')

    def tearDown(self):
        self.user.delete()

    def test_existence(self):
        user = get_user_model().objects.get(firstname='Soyuzbek')
        self.assertEqual(user.get_absolute_url(), reverse('users:detail', kwargs={'pk': user.pk}))