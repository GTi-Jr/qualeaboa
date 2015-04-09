function facebook_share() {
  var win = window.open('http://www.facebook.com/sharer.php?u=qualeaboa.herokuapp.com', '_blank');
  win.focus();
}

function setDivisor() {
   var width = $( ".tabs" ).width();
   $( ".divisor_tabs" ).css("right", width/2 );
}

var resizeTimer;

//Event to handle resizing
$(window).resize(function () 
{
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(setDivisor, 20);
});