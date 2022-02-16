// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//Hauteur du jumbotron
var hauterJumbotron = $('.jumbotron').outerHeight();
//Fonction appelée au scroll de la souris
function parallax()
{
//On calcule la distance de scroll, puis on réduit la taille du container du jumbotron en fonction de cette distance.
var scrolled = $(window).scrollTop();
$('.fond').css('height', (hauterJumbotron-scrolled) + 'px');
}
//Ajout de la fonction à l'événement scroll
$(window).scroll(function(e){
parallax();
});
