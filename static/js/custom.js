function printWindow() {
    window.print();
}

$('document').ready(function () {
    $('#id_birth_day').mask('00.00.0000');
    $('#id_region').change(function () {
        $.ajax({
            url: '/ajax/load-districts/',
            method: 'GET',
            dataType: 'JSON',
            data: {
                'region': this.value
            },
            success: function (data) {
                let set = JSON.parse(data.data);
                let text = '';
                for (let i = 0; i < set.length; i++) {
                    text += '<option value="' + set[i].pk + '">' + set[i].fields.name + '</option>'
                }
                $('#id_district').html(text);
            }
        })
    });
    $('#id_district').change(function () {
        $.ajax({
            url: '/ajax/load-territories/',
            method: 'GET',
            dataType: 'JSON',
            data: {
                'district': this.value
            },
            success: function (data) {
                let set = JSON.parse(data.data);
                let text = '';
                for (let i = 0; i < set.length; i++) {
                    text += '<option value="' + set[i].pk + '">' + set[i].fields.name + '</option>'
                }
                $('#id_territory').html(text);
            }
        })
    });
    // codes of Nurlan
    let PIN = document.getElementById('id_PIN');
    let gender = document.getElementById('id_gender');
    let birth_day = document.getElementById('id_birth_day');
    let role = $('#id_role option:selected').val();
    if (PIN && PIN.length < 2) {
        if (gender) {
            PIN.value = gender.value;
        }
    }

    $('#id_birth_day').on('input', function () {
        let date = $(this).val();
        let value = date.split('.').join('');
        PIN.value = (gender.value + value);
    });

    $('#id_gender').on('change', function () {
        let date = birth_day.value;
        let value = date.split('.').join('');
        PIN.value = ($(this).val() + value);
    });

    $('.invalid-feedback').closest('.form-group').find('.form-control').addClass('is-invalid');
});

window.setMobileTable = function (selector) {
    const tableEl = document.querySelector(selector);
    const thEls = tableEl.querySelectorAll('thead th');
    const tdLabels = Array.from(thEls).map(el => el.innerText);
    tableEl.querySelectorAll('tbody tr').forEach(tr => {
        Array.from(tr.children).forEach(
            (td, ndx) => td.setAttribute('label', tdLabels[ndx])
        );
    });
};