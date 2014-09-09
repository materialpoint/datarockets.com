function Popup (popup_window, active_btn) {
    this.active_btn = active_btn;
    this.popup_window = popup_window;
    this.popup_overlay = this.popup_window.parentNode;
    this.popup_close = this.popup_window.querySelector('.popup__close');
    this.init();
}

Popup.prototype = {};

window.Popup = Popup;

window.Popup.prototype = {
    init: function() {
        console.log(123);
        var that = this;

        this.active_btn.addEventListener('click', function(event) {
            event.preventDefault();
            that.onVisible();
            that.addHandler();
        });
    },
    onVisible: function() {
        this.popup_overlay.className += ' visible';
        this.offScroll();

    },
    offVisible: function() {
        var popup_class = this.popup_overlay.className;

            this.popup_overlay.className = popup_class.slice(0, 14);
            this.onScroll();

    },
    onScroll: function() {
        //for IE need add class on html tag
        document.querySelector('body').className = '';
    },
    offScroll: function() {
        document.querySelector('body').className = 'lock';
    },
    addHandler: function() {
        console.log('addHandler');
        //planning: chech attachEvent  prior to IE 9
        //way #1 - click to close button
        var that = this;
        this.popup_close.addEventListener('click', function (event) {
            event.preventDefault();
            that.offVisible();
            that.removeHandler();
        });

        //way #2 - click to ESC button
        document.addEventListener('keyup', function(event) {
            if (event.which == '27') {
                that.offVisible();
                that.removeHandler();
            }
        });

        //way #3 - click outside the window
        // this.popup_overlay.addEventListener('click', function() {
        //     that.offVisible();
        //     that.removeHandler();
        // })

    },
    removeHandler: function (argument) {
        console.log('remove');
    }
};

window.onload = function() {
    var
        active_btn = document.querySelector('.active-btn-js'),
        popup_window = document.querySelector('.popup__window'),
        popup = new Popup(popup_window, active_btn);
}
