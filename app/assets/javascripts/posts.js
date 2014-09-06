jQuery(function() {
    return $('#file_upload').fileupload({
        dataType: 'json',
        done: function(e, data) {
            $('#post_body').after('<input id="post_post_image" name="post[post_image_ids][]" type="hidden" value="'+data.result.post_image.id+'">');
            $('#file_upload').after('<br><img src="'+data.result.post_image.url+'"><b>'+'![place alt text here]('+data.result.post_image.url+')</b>')
      },
        fail: function(e, data) { alert('Upload failed') }
    });
});
