$(document).on('turbolinks:load', function() {
  $( window ).scroll(function() {
    var scrollPos = $(document).scrollTop();
    var $navbar = $('#fancy_header .navbar').first();
    
    if(scrollPos > 0) {
      $navbar.removeClass('initial').addClass('bg-dark');
    } else {
      $navbar.addClass('initial').removeClass('bg-dark');
    }
  });

  $("#consultant_profile_photo").fileinput({
    theme: 'fa'
  });
});
