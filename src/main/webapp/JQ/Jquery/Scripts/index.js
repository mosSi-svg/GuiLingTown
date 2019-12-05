function scrollNews() {
    var height = $(".scrollNews>ul>li:eq(0)").height();
    $(".scrollNews>ul").animate({ "marginTop": "-=" + height + "px" }, function () {
        $(".scrollNews>ul>li:first").appendTo($(".scrollNews>ul"));
        $(".scrollNews>ul").css("marginTop", "0px");
    })
}
function showImag(index) {
    var adheight = $(".content_right .ad").height();
    $(".slider").stop(true, false).animate({ "top": -adheight * index }, 1000);
    $(".num li").removeClass("on").eq(index).addClass("on");
}
$(function () {

    $(".module_up_down").toggle(function () {
        $(this).prev().slideToggle("slow", function () {
            $("img", this).attr("src", "images/up.gif");
        });
    }, function () {
        var btn = $(this);
        $(this).prev().slideToggle("slow", function () {
            $("img", this).attr("src", "images/down.gif");
        });
    });

    var scrollTimer = setInterval(scrollNews, 1000);
    $(".scrollNews").hover(function () {
        clearInterval(scrollTimer);
    }, function () {
        scrollTimer = setInterval(scrollNews, 1000);
    });

    var x = 10, y = 20;
    $("a.tooltip").mouseover(function (e) {
        this.myTitle = this.title;
        this.title = "";
        var tooltip = "<div id='tooltip'>" + this.myTitle + "</div>"
        $("body").append(tooltip);
        $("#tooltip").css({ "top": (e.pageY + y) + "px", "left": (e.pageX + x) + "px" }).show("fast");
    }).mouseout(function (e) {
        this.title = this.myTitle;
        $("#tooltip").remove();
    }).mousemove(function (e) {
        $("#tooltip").css({ "top": (e.pageY + y) + "px", "left": (e.pageX + x) + "px" }).show("fast");
    });

    $(".m-treeview>li>span").click(function (e) {
        if ($(this).siblings("ul").is(":visible")) {
            $(this).parents("li").attr("class", "m-collapsed");
            $(this).siblings("ul").hide();
        }
        else {
            $(this).parents("li").attr("class", "m-expanded");
            $(this).siblings("ul").show();
        }
    });

    var index = 0;
    $(".num li").mouseover(function (e) {
        index = $(".num li").index(this);
        showImag(index);
    }).eq(0).mousemove();
    var len = $(".num>li").length;
    var adTimer;
    $(".ad").hover(function (e) {
        clearInterval(adTimer);
    }, function (e) {
        adTimer = setInterval(function () {
            showImag(index)
            index++;
            if (index == len) index = 0;
        }, 3000);
    }).trigger("mouseleave");

    var width = $(".prolist").width();
    var content = $(".prolist_content");
    width = width / 4;

    $(".goLeft").click(function (e) {
        content.animate({ left: "-=" + width }, "slow", function (ex) {
            $(".prolist_content>ul>li:first").appendTo($(".prolist_content>ul"));
            content.css("left", "0px");
        });
    });
    $(".goRight").click(function (e) {
        content.animate({ left: "+=" + width }, "slow", function (ex) {
            $(".prolist_content>ul>li:last").prependTo($(".prolist_content>ul"));
            content.css("left", "0px");
        });
    });

    $(".prolist_content ul li").each(function (i, e) {
        var li_left = $(this).position().left;
        var li_top = $(this).position().top;
        var img_width = $(this).find("img").width();
        var img_height = $(this).find("img").height();
        var spanHtml = "<span style='position:absolute;top:" + li_top + "px;left:" + li_left + "px;width:" + img_width + "px;height:" + img_height + "px;cursor:point;' class='imageMask'></span>";
        $(spanHtml).hover(function () {
            $(this).addClass("imageOver");
        }, function () {
            $(this).removeClass("imageOver");
        }).appendTo($(this).find("a"));

    });
})