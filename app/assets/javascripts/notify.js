$(function() {
    var closeNotifier,
        notifier = document.getElementsByClassName('notification')[0],
        notifier_text = document.getElementsByClassName('notification__text')[0].innerHTML,
        notifier_close = document.getElementsByClassName('notification__close')[0];

    if (notifier_text) {
        closeNotifier = function() {
           notifier.classList.remove('visible');
        }
        notifier.classList.add('visible');
        notifier_close.addEventListener('click', closeNotifier);
        setTimeout(closeNotifier, 4000);
    }


});
