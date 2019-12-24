
$(function () {

    $("#bb").click(function () {

        var ss = $("#ss").val();
        if( ss.length ==0){
            return;
        }

    })

    $("#login").click(function () {
        var id= $("#id").val();
        var password =$("#password").val();
        var page="login";
        $.post(
            page,
            {"name":id,"password":password},
            function(data){
                var re = JSON.parse(data);
                if( re.result.result =="false"){
                    $("#reText").html("<h4 style='color:red'> 用户不存在或密码错误</h4>" );
                }
                else {
                    location.reload();
                }
            }
        )
    })

    $("#register").click(function () {
        alert("!!!1");
        var name= $("#id").val();
        var password =$("#password").val();
        var page="register";
        $.post(
            page,
            {"password":password,"name":name},
            function(data){

                var re = JSON.parse(data);
                if( re.result.result =="true" ){


                    $("#reText").html("<h4 style='color:red'> 用户名已经存在!</h4>" );
                }
                else {
                    $("#reText").html("<h4 style='color:green'> 注册成功！</h4>" );
                }
            }
        )
    })
    $("#clear").click(
        function () {
            var page="clear";
            $.post(
                page,
                {},
                function(){
                    Page.reload();
                }
            )
        }
    )

    $("#hotel").click(function () {
       Page.load("hotel");
    })
})