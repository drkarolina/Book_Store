$(document).on('mouseover', '#stars > .rate-star', function () {
    console.log('mouseover')

    let ratingValue = +$(this).data('value');
    let stars = document.getElementById("stars").querySelectorAll(".rate-star"); 
    for (let i = 0; i < stars.length; i++){
        console.log(stars[i])
        i < ratingValue ? stars[i].classList.remove('rate-empty') : stars[i].classList.add('rate-empty')
    }
});

$(document).on('mouseout', '#stars > .rate-star', function () {
    
    let ratingValue = $('#review_rating').val();
    let stars = document.getElementById("stars").querySelectorAll(".rate-star"); 
    for (let i = 0; i < stars.length; i++){
        console.log(stars[i])
        i < ratingValue ? stars[i].classList.remove('rate-empty') : stars[i].classList.add('rate-empty')
    }
});

$(document).on('click', '#stars > .rate-star', function () {
    let ratingValue = +$(this).data('value');
    let stars = document.getElementById("stars").querySelectorAll(".rate-star"); 
    for (let i = 0; i < stars.length; i++){
        console.log(stars[i])
        i < ratingValue ? stars[i].classList.remove('rate-empty') : stars[i].classList.add('rate-empty')
    }
    $('#review_rating').val(ratingValue);
});