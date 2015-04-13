$(function(){
	// PGW MODAL
    var joinUsButton = $('.join-us-button');
	joinUsButton.on('click', function(){
		$.pgwModal({
			target: '#joinUsModal'
		});
	});

    // Team: Developers Match Heigth
    var developer = $('.team').find('.developer').not('.join-us');
    developer.matchHeight();
    // console.log(developer);

	//Sticky Menu
	// var navOffset = $('.blog-body .navigation').offset().top;
	// $('.blog-body .menu').wrap('<div class="menu-wrapper"></div>');
	// $('.menu-wrapper').height($('.blog-body .navigation').find('.blog-body nav').outerHeight());
	// $(window).scroll(function(){
	// 	var scrollPos = $(window).scrollTop() -11;
	// 	if (scrollPos >= navOffset) {
	// 		$('.blog-body .menu').addClass('fixed');
	// 	}
	// 	else {
	// 		$('.blog-body .menu').removeClass('fixed');
	// 	}
	// });



	// Validate Form: Contact Us
	// $(document).on('submit','form#contact-us-form',function(e){
	// 	e.preventDefault();
	// 	var name = $('.name').val();
	// 	var email = $('.email').val();
	// 	var message = $('.message').val();

	// 	if ( name == '' || email == '' || message == '') {
	// 		$('.error-name').css('visibility', 'visible');
	// 		$('.error-email').css('visibility', 'visible');
	// 		$('.error-message').css('visibility', 'visible');
	// 	}
	// 	else {
	// 		// SEND MESSAGE
	// 		alert('Message Send');
	// 		$('form#contact-us-form').find('input').val('');
	// 		$('form#contact-us-form').find('textarea').val('');
	// 		$('span').css('visibility', 'hidden');
	// 	}
	// });

	// Validate Form: Add A Comment
	// $(document).on('submit','form#add-a-comment',function(e){
	// 	e.preventDefault();
	// 	var message = $('.fields-container textarea');
	// });

	// Form: Add A Comment
	// var sign = $('.sign-container');
	// var send = $('input[type="submit"]');
	// var error = $('.error-message');
	// var messageTextarea = $('textarea.message');
	// error.hide();
	// sign.hide();
	// send.hide();
	// messageTextarea.height(58);
	// messageTextarea.on('focus', function(){
	// 	send.show(500);
	// 	sign.show(500);
	// 	$(this).height(270);
	// });
});
