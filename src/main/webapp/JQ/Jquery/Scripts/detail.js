$(function () {
    $(".jqzoom").jqueryzoom({ xzoom: 400, yzoom: 400, offset: 10, position: "right", prload: 1 });

    $(".imgList>li>img").livequery("click", function (e) {
        var imgsrc = $(this).attr("src");
        var i = imgsrc.lastIndexOf(".");
        var unit = imgsrc.substring(i);
        imgsrc = imgsrc.substring(0, i);
        var imgsmall = imgsrc + "_small" + unit;
        var imgbig = imgsrc + "_big" + unit;
        $("#bigImg").attr({ "src": imgsmall, "jqimg": imgbig });
        $("#thickImg").attr("href", imgbig);
    });

    var lis = $(".tab_menu>ul>li");
    lis.click(function (e) {
        $(this).addClass("selected").siblings().removeClass("selected");
        var index = lis.index(this);
        $(".tab_box>div").eq(index).show().siblings().hide();
    }).hover(function () {
        $(this).addClass("hover");
    }, function () {
        $(this).removeClass("hover");
    });

    $(".color_change>ul>li>img").click(function () {
        var imgsrc = $(this).attr("src");
        var i = imgsrc.lastIndexOf(".");
        var unit = imgsrc.substring(i);
        imgsrc = imgsrc.substring(0, i);
        var imgsmall = imgsrc + "_one_small" + unit;
        var imgbig = imgsrc + "_one_big" + unit;
        $("#bigImg").attr({ "src": imgsmall, "jqimg": imgbig });
        $("#thickImg").attr("href", imgbig);
        var alt = $(this).attr("alt");
        $(".color_change strong").text(alt);
        var url = imgsrc + ".html"
        $(".pro_detail_left ul.imgList").empty().load(url);
    });


    $(".pro_size ul li span").click(function () {
        $(this).parents("ul").siblings("strong").text($(this).text());
    });

    $("#num_sort").change(function () {
        var price = $(".pro_price>span").text();
        $(".pro_price>span").text(price * $(this).val());
    }).change();

    $("ul.rating>li>a").click(function () {
        var title = $(this).attr("title");
        alert("您给的评分是：" + title);
        var cl = $(this).parent().attr("class");
        $(this).parents("ul").removeClass().addClass("rating " + cl + "star");
        $(this).blur();
        return false;
    });

    $("#cart>a").click(function () {
        var product = $(".pro_detail_right");
        var proName = product.find("h4:first").text();
        var proSize = product.find(".pro_size strong").text();
        var proColor = product.find(".color_change strong").text();
        var proNum = product.find("#num_sort").val();
        var proPrice = product.find(".pro_price span").text();
        var dialog = "感谢您购买.\n您购买的产品是:" + proName + "\n尺寸是:" + proPrice
                + "\n颜色是:" + proColor + "\n数量是:" + proNum + "\n总价是:" + proPrice + "元";
        if (confirm(dialog)) {
            alert("您已经下单");
        }
        return false;
    });
});