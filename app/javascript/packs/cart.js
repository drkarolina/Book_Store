document.addEventListener("turbolinks:load", function() {
  let minQuantity = 1;
  newPrice(1);
  
  $(document).on('click', '#plus', function (event) {
    event.preventDefault();
    let max_quantity = $('.quantity-input').data("maxQuantity");
    quantity = +$('.quantity-input').val();

    if ($('.quantity-input').val() < max_quantity) {
      quantity = quantity + 1;
      $('.quantity-input').val(quantity);  
      newPrice(quantity);
    }
  });

  $(document).on('click', '#minus', function (event) {
      event.preventDefault();

      quantity = +$('.quantity-input').val();

    if (quantity > minQuantity) {
      quantity = quantity - 1;
      $('.quantity-input').val(quantity);
      newPrice(quantity);
    }
  });

  function newPrice(quantity) {
    let price = $('.total_price').data("price") * quantity;
    price = Math.round(price * 100) / 100;
    $('.total_price').text("€" + price);
  }
});