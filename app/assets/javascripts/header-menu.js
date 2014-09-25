$(function() {
    var btn = document.querySelector('.header__menu__icon-js'),
        menu = document.querySelector('.header__menu__inner');

    btn.addEventListener('click', function() {
        menu.classList.toggle('visible');
    });

    document.addEventListener('click', function(event) {
        event.stopPropogation();
        if (menu.classList.contains('visible')) {
           menu.classList.remove('visible');
        }
    });

    menu.addEventListener('click', function(event) {
        // event.stopPropogation();
    });
});
