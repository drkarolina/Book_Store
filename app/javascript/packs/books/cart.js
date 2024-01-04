$(document).on('click', '#plus', function (event) {
  event.preventDefault();
  quantity = +$('.quantity-input').val();
  quantity = quantity + 1;
  $('.quantity-input').val(quantity);  
  newPrice(quantity);
});

$(document).on('click', '#minus', function (event) {
  event.preventDefault();
  let minQuantity = 1;

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