import re

from django.contrib.auth.management.commands import createsuperuser
from django.core import exceptions
from django.core.validators import RegexValidator

from users.models import Phone

phone_regex_kg = RegexValidator(regex=r'^\+\(?996\)? ?\(?\d{3}\)? ?\d{2} ? ?\d{2} ?\d{2}$',
                                message="+(996)(123)456789")


class Command(createsuperuser.Command):
    help = 'creates a phone number which requires in user creation'

    def get_input_data(self, field, message, default=None):
        raw_value = input(message)
        if default and raw_value == '':
            raw_value = default
        try:
            if raw_value == '':
                self.stdout.write('Error: Phone number can not be blank!')
                return None
            if re.match(phone_regex_kg.regex, raw_value):
                number, created = Phone.objects.get_or_create(number=raw_value)
                if created:
                    number.save()
                    val = raw_value
                else:
                    self.stdout.write(f'Error: Phone instance with number {raw_value} already exists!')
                    return None
            else:
                self.stdout.write(f'Error: Phone number must be in "+996 XXX XX XX XX" format!')
                return None
            val = field.clean(raw_value, None)
        except exceptions.ValidationError as e:
            self.stderr.write("Error: %s" % '; '.join(e.messages))
            val = None
        return val
