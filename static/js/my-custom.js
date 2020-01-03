$('document').ready(function(){
    'use strict';

    var PIN = document.getElementById('id_PIN');
    var gender_val = document.getElementById('id_gender');
    var birth_day = document.getElementById('id_birth_day');
    PIN.value = gender_val.value;

    $('#id_birth_day').on('input', function(){
        var date = $(this).val();
        var value = date.split('.').join('');
        PIN.value = (gender_val.value + value);
    });

    $('#id_gender').on('change', function(){
        var date = birth_day.value;
        var value = date.split('.').join('');
        PIN.value = ($(this).val() + value);
    });
});