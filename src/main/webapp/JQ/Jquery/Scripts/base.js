function switchSkin(skinName) {
    $("#" + skinName).addClass("selected").siblings().removeClass("selected");
    $("#cssfile").attr("href", "styles/skin/" + skinName + ".css");
    $.cookie("myCssSkin", skinName, { path: "/", expires: 10 });
}
$(function () {
    var cookie_skin = $.cookie("myCssSkin");
    if (cookie_skin) {
        switchSkin(cookie_skin);
    }
    $("#skin li").click(function () {
        switchSkin(this.id);
    });

    $("navigation ul li:has('ul')").hover(function () {
        $(this).children("ul").stop(true, true).slideDown(400);

    }, function () {
        $(this).children("ul").stop(true, true).slideUp(400);
    });
});