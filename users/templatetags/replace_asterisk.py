from django import template
from django.template.defaultfilters import stringfilter

register = template.Library()


@register.filter
def cover(word, symbol):
    """replaces all characters to given one except first three character"""
    if len(word) > 6:
        return word[:2] + symbol*len(word[3:-3]) + word[-2:]
    elif len(word) > 3:
        return word[:2] + symbol*len(word[3:])
    else:
        return word[0] + symbol