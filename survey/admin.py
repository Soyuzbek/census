from django.contrib import admin

from survey import models


@admin.register(models.Userlogins)
class ULogins(admin.ModelAdmin):
    pass


@admin.register(models.Users)
class UAdmin(admin.ModelAdmin):
    exclude = ['id']


@admin.register(models.Userprofiles)
class UProfiles(admin.ModelAdmin):
    pass


@admin.register(models.Userclaims)
class UClaims(admin.ModelAdmin):
    pass
