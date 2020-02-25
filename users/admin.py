import os

from django.contrib import admin, messages
from django.contrib.auth.admin import UserAdmin
from django.utils.translation import ugettext_lazy as _, ngettext
from rest_framework.authtoken.models import Token

from users.models import User, District, Employee, Region, Territory, SiteSettings, RoleInfo


def regenerate(modeladmin, request, queryset):
    for instance in queryset:
        try:
            os.remove(instance.qrcode.path)
        except:
            pass
        instance.generate_qrcode()
    messages.info(request, ngettext("The QR code for instance of model %(model)s is regenerated",
                                    "The QR codes for %(queryset)d instances of model %(model)s are regenerated",
                                    len(queryset)) % {"queryset": len(queryset),
                                                      "model": modeladmin.model._meta.verbose_name})


regenerate.short_description = _("Regenerate QR code")


@admin.register(User)
class UserAdmin(UserAdmin):
    fieldsets = (
        (None, {
            'fields': ('number', 'password', 'region', 'district', 'is_staff', 'is_superuser')
        }),
        ('Permissions', {'fields': (
            'groups', 'user_permissions',
        )}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide', 'extrapretty'),
            'fields': ('number', 'password1', 'password2'),
        }),
    )
    ordering = ('number',)
    list_display = ('number', 'is_superuser')
    list_filter = ('is_superuser', 'is_staff', 'district')
    search_fields = ('number',)
    filter_horizontal = ('groups', 'user_permissions',)


@admin.register(Employee)
class EmployeeAdmin(admin.ModelAdmin):
    fieldsets = (
        (None, {
            'fields': (
                'number',
                'last_name',
                'first_name',
                'patronymic',
                'gender',
                'birth_day',
                'serial',
                'passport_num',
                'address',
                'authority',
                'PIN',
                'photo',
                'role',
                'department',
                'sector',
                'plot',
                'district',
                'territory',
                'agreement',
                'login',
                'password'
            )
        }),
    )

    ordering = ('id',)
    list_display = ('first_name', 'last_name', 'login', 'birth_day')
    list_filter = ('role', 'district', 'department', 'sector')
    search_fields = ('first_name', 'last_name', 'patronymic', 'number')
    actions = [regenerate]


class TerritoryAdmin(admin.TabularInline):
    model = Territory
    extra = 5


@admin.register(District)
class DistrictAdmin(admin.ModelAdmin):
    exclude = ('counter',)
    inlines = [TerritoryAdmin]


@admin.register(Region)
class RegionAdmin(admin.ModelAdmin):
    pass


@admin.register(Territory)
class TerritoryAdminPure(admin.ModelAdmin):
    list_display = ['name', 'counter']


class RoleInfoInline(admin.StackedInline):
    model = RoleInfo
    extra = 1


@admin.register(SiteSettings)
class SiteSettingsAdmin(admin.ModelAdmin):
    inlines = [RoleInfoInline]


admin.site.unregister(Token)
