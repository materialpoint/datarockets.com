jQuery(function() {
    $('#file_upload_projects').fileupload({
        dataType: 'json',
        done: function(e, data) {
            $('#project_description').after('<input id="project_project_image" name="project[project_image_ids][]" type="hidden" value="'+data.result.project_image.id+'">');
            $('#file_upload_projects').after('<br><img src="'+data.result.project_image.url+'"><b>'+'![place alt text here]('+data.result.project_image.url+')</b>')
        },
        fail: function(e, data) { alert('Upload failed') }
    });
});

$(document).ready(function(){
  $('.admin__view').sortable({
    cursor: 'pointer',
    opacity: 0.4,
    scroll: true,
    axis: 'y',
    dropOnEmpty: false,
    update: function(){
      $.ajax({
        url: 'projects/sort',
        type: 'post',
        dataType: 'script',
        data: $('.admin__view').sortable('serialize'),
        success: function(request){
          $('.admin__view').effect('highlight');
        },
        fail: function(e, data) { alert('Failed') }
      });
    }
  });
});
