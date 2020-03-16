from django import template

register = template.Library()


@register.simple_tag(takes_context=True)
def param_replace(context, **kwargs):
    d = context['request'].GET.copy()
    for k, v in kwargs.items():
        d[k] = v
    for k in [k for k, v in d.items() if not v]:
        del d[k]
    return d.urlencode()


@register.filter(name='mul')
def mul(number, page):
    if page is None:
        return number
    return 20 * (page-1) + number


@register.simple_tag(name='get_initials')
def get_initials(full_name):
    full_name_list = full_name.split()
    initials = ""
    if len(full_name_list) == 3:
        surname = full_name_list[0]
        name = full_name_list[1]
        patronymic = full_name_list[2]
        initials = "{} {}. {}.".format(surname, name[0], patronymic[0])
    if len(full_name_list) == 2:
        surname = full_name_list[0]
        name = full_name_list[1]
        initials = "{} {}.".format(surname, name[0])
    if len(full_name_list) == 1:
        surname = full_name_list[0]
        initials = "{}".format(surname)
    return initials
