import os
from abc import ABC

from django.contrib import admin, messages
from django.contrib.admin import SimpleListFilter
from django.contrib.auth.admin import UserAdmin
from django.db.models import Q
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


class InputFilter(admin.SimpleListFilter, ABC):
    template = 'admin/input_filter.html'

    def lookups(self, request, model_admin):
        # Dummy, required to show the filter.
        return (),

    def choices(self, changelist):
        # Grab only the "all" option.
        all_choice = next(super().choices(changelist))
        all_choice['query_parts'] = (
            (k, v)
            for k, v in changelist.get_filters_params().items()
            if k != self.parameter_name
        )
        yield all_choice


class TerritoryFilter(InputFilter):
    parameter_name = 'territory'
    title = _('territory')

    def queryset(self, request, queryset):
        term = self.value()
        if term is None:
            return
        any_name = Q()
        for bit in term.split():
            any_name &= (
                Q(territory__name__icontains=bit)
            )
        return queryset.filter(any_name)


class CustomTerritory(SimpleListFilter, ABC):
    title = _('Territory')
    parameter_name = 'territory'

    def lookups(self, request, model_admin):
        list_of_territories = []
        queryset = Territory.objects.filter(district=request.user.district)
        return [(t.id, t.name) for t in queryset]

    def queryset(self, request, queryset):
        if self.value() is not None:
            return queryset.filter(territory=self.value())
        return queryset


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
            )
        }),
    )

    ordering = ('id',)
    list_display = ('first_name', 'last_name', 'dismissed')
    search_fields = ('first_name', 'last_name', 'patronymic', 'number')
    actions = [regenerate]

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(district=request.user.district)

    def get_list_filter(self, request):
        if request.user.is_superuser:
            return 'role', 'dismissed', 'district', TerritoryFilter
        else:
            return 'role', 'dismissed', CustomTerritory


class TerritoryAdmin(admin.TabularInline):
    model = Territory
    extra = 5


@admin.register(District)
class DistrictAdmin(admin.ModelAdmin):
    exclude = ('counter',)
    inlines = [TerritoryAdmin]
    ordering = ('name', )
    list_filter = ('region',)


@admin.register(Region)
class RegionAdmin(admin.ModelAdmin):
    pass


@admin.register(Territory)
class TerritoryAdminPure(admin.ModelAdmin):
    list_display = ['name', 'counter']
    search_fields = ('name', 'code')
    list_filter = ('district', )
    ordering = ('name',)


class RoleInfoInline(admin.StackedInline):
    model = RoleInfo
    extra = 1


@admin.register(SiteSettings)
class SiteSettingsAdmin(admin.ModelAdmin):
    inlines = [RoleInfoInline]


# admin.site.unregister(Token)
