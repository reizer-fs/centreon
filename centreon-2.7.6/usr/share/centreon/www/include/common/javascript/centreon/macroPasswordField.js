jQuery(function() {
    jQuery("input[id^='macroPassword_']").each(function(id, el) {
        change_macro_input_type(el, false);
    });
});

function change_macro_input_type(box, must_disable) {
    var tmp = box.id.split('_');
    var macro_dom_id = tmp[1];
    var input = jQuery("#macroValue_" + macro_dom_id);

    if (must_disable === true) {
        jQuery(box).parent().hide();
    }
    
    
    if(typeof input[0] != 'undefined'){
        if (box.checked) {
            input[0].type = 'password';
        } else {
            input[0].type = 'text';
        }
    }
}
