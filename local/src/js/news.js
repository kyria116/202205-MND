//@prepros-prepend template/top_menu.js

$(document).ready(function () {
    window.setTimeout(function () {
        slider_ul_list("topmenu1");
    }, 100);
    $('.list-content').hover(function () {
        $(this).find('.l8').stop().slideDown()
    }, function () {
        $(this).find('.l8').stop().slideUp()
    })
});