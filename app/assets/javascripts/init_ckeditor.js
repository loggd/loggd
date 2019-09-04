
function ready() {
    $('.ckeditor').each(function () {
        CKEDITOR.replace($(this).attr('id'));
    });
}

$(document).ready(ready);
$(document).on('page:load', ready);
$(document).bind('turbolinks:before-cache', function() {
    var name, results;
    if (typeof CKEDITOR === 'undefined') {
        return;
    }
    results = [];
    for (name in CKEDITOR.instances) {
        if (name !== null) {
            results.push(CKEDITOR.instances[name].destroy());
        }
    }
    return results;
});

$(document).bind('turbolinks:load', function() {
    if (typeof CKEDITOR === 'undefined') {
        return;
    }
    return $('.js-ckeditor').each(function() {
        return CKEDITOR.replace($(this).attr('id'));
    });
});
