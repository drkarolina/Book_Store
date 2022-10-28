$(document).on('turbolinks:load', function() {
  let link = $('.read-more');
  let description_short = $('#description_short');
  let description_long = $('#description_long');

  $(document).on('click', '.read-more', function (event) {
    event.preventDefault();
    if (link.text() == 'Hide') {
      description_short.show();
      description_long.hide();
      link.text('Read More');
    } else {
      description_short.hide();
      description_long.show();
      link.text('Hide');
    }

  });
});