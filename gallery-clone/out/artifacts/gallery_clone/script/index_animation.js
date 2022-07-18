/* 애니메이션 효과 */
jQuery(function ($) {
    $("#section").css("display", "none");
    $("#section").fadeIn(2000);
    $("a.transition").click(function (event) {
        event.preventDefault();
        linkLocation = this.href;
        $("#section").fadeOut(1000, redirectPage);
    });

    function redirectPage() {
        window.location = linkLocation;
    }
});