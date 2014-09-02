jQuery(function() {
  return $('#file_upload').fileupload({
    dataType: 'json',
    done: function(e, data) {
      $('#project_description').after('<input id="project_project_image" name="project[project_image_ids][]" type="hidden" value="'+data.result.id+'">');
      $('#file_upload').after('<br><img src="'+data.result.url+'"><b>'+'![place alt text here]('+data.result.url+')</b>')
    },
    fail: function(e, data) { alert('Upload failed') }
  });
});

