$(document).on('turbolinks:load', function() {
  if ($('.books_row').length > 2) {
    $(window).scrollTop($('.view_more_btn').position().top);
  }
});