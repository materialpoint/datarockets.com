//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery-fileupload/basic
//= require jquery_nested_form
//= require_tree .

$(document)
    .on('page:change', function() {
        var form = $('.client_contacts'),
            msg = form.serialize();

        function sendAjaxMsg () {
            $.ajax({
              type: 'POST',
              url: '/client_contacts',
              data: msg,
              success: function(data) {
                    alert('success! :D');
              },
              error:  function(xhr, str){
                    alert('Возникла ошибка: ' + xhr.responseCode);
                }
            });
        }

        form.attr('action', 'javascript:void(null);');
        form.on('submit', sendAjaxMsg);

    });
