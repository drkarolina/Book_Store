$(document).on('turbolinks:load', function() {
  let checkbox = $('.use-billing-address');
  let form = $('.shipping_address_form');

  $(document).on('click', '.use-billing-address', function (event) {
    if(checkbox.is(':checked'))
      form.hide();
    else
      form.show();
  });
});