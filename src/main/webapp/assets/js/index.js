var swiper = new Swiper(".mySwiper", {
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
        delay: 2500,
        disableOnInteraction: false,
    },
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
});

var swiper1 = new Swiper(".mySwiper1", {
    slidesPerView: 4,
    spaceBetween: 0,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
});

var move_top=document.querySelector(".move_icon");

//move top
document.addEventListener("scroll", function(){
    if (window.scrollY>400)
        move_top.classList.add("move_up");
    else
        move_top.classList.remove("move_up");
})
move_top.addEventListener("click", function(){
    window.scrollTo({
        top:0,
        behavior: "smooth"
    })
})