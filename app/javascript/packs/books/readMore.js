$(document).on('turbolinks:load', function() {
  let Description = $('.description');
  let Link = $('.read-more');
  const DescriptionText = Description.text();
  const ShortDescriptionText = DescriptionText.slice(0, 247) + '...';
  if (DescriptionText.length > 250) {
    Description.text(ShortDescriptionText);
  }

  $(document).on('click', '.read-more', function (event) {
      event.preventDefault();

    if (Description.text().length > 250) {
      Description.text(ShortDescriptionText);
      Link.text('Show More');
    } else {
      Description.text(DescriptionText);
      Link.text('Hide');
    }
  });
});