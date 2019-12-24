<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>小镇简介</title>
    <script src="JQ/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="JQ/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="JQ/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="JQ/show.css" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.7.9/jquery.fullPage.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-beta1/jquery.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.7.9/vendors/jquery.easings.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.7.9/jquery.fullPage.js"></script>
    <script src="JQ/login.js"></script>
</head>
<script>
    $(document).ready(function(){
        $('#fullpage').fullpage({
            anchors:['firstPage', 'secondPage', 'thirdPage','fourthPage'],
            menu: '#myMenu',

        });

        $("#button").click( function () {

            $(".modal-dialog").toggle();
        })
        $("#close").click( function () {

            $(".modal-dialog").toggle();
        })
            $("#bb").click(function () {

                var ss = $("#ss").val();
                if( ss.length ==0){
                    return;
                }

            })}
    );

</script>

<body>
<nav class=" navbar-fixed-top">

    <div class="head">
        <jsp:include page="include/header.jsp"></jsp:include>
    </div>
</nav>
<div class="head">
    <span class="head-s1"> 欢迎来到桂林特色小镇</span><span class="head-s2"><a href="index.html">主页</a> <a href="index.html">请登录</a> <a href="index.html">我的</a> <a href="index.html">注销</a></span>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 500px">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">登录</h4>
            </div>
            <form>


                <div class="modal-body">
                    <p>输入你的登录或注册信息</p>
                    用户名：<input type="text" id="id" class="form-control" >
                    密码：<input type="password" id="password" class="form-control">
                    <div id="reText" style="height: 30px">

                    </div>
                </div>
                <div class="modal-footer">
                    <button  class="btn btn-default" type="button" id="register">注册</button>
                    <button class="btn btn-primary" type="button" id="login">登录</button>

                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>


<div id="fullpage">
    <div class="section">

        <div class="jumbotron" style='background-image: url("/Img/detail/${sm1.id}.jpg")' >
            <div id="link">
                <a role="button" href="#secondPage" class="btn btn-primary ">特色介绍</a>
                <a role="button" href="#thirdPage" class="btn btn-info">风光欣赏</a>
                <a role="button" href="#fourthPage" class="btn btn-warning">大众评价</a>
            </div>

            <div class="container" align="center" >

                <h2 class="text-info" style="font-family:宋体;font-weight:bold;font-size:100px;color: white">${t.name}</h2>
                <br>
                <div class="text-muted">
                </div>
                <br>
                <br>
                <p><a role="button" href="#secondPage" class="btn btn-success">DISCOVER</a></p>


            </div>
        </div>

    </div>
    <div class="section" id="detail">
        <div id="BD" >
            <table>
                <tr >
                    <td style="background-color: whitesmoke ;height: 50px">
                        <h1>
                            ${t.name}
                        </h1>
                    </td>
                    <td rowspan="2" width="400px">
                        <img src="/Img/detail/${sm2.id}.jpg" >
                    </td>
                </tr >
                <tr >
                    <td>
                        <h3>
                           ${t.simText}
                        </h3>
                    </td>

                </tr>
                <tr >
                    <td style="background-color: whitesmoke ;height: 50px"><h1>特色详情</h1></td>
                    <td rowspan="2" width="400px">
                        <iframe src="show_map?tid=${t.id}" width="600px" height="400px">
                        </iframe>
                    </td>
                </tr>
                <tr >
                    <td>
                        <h4>
                            ${t.detText}
                        </h4>
                    </td>
                </tr>
            </table>
        </div>
    </div>


    <div class="section">
        <c:forEach items="${ms}" var="m">
            <div class="slide"><img src="/Img/detail/${m.id}.jpg"> </div>
        </c:forEach>
    </div>
    <div class="section">
        <div id="comment">
            <div class="panel panel-default">
                <div class="panel-heading">大众评价<span style="margin-left: 100px"></span> <button id="button" class="btn btn-success" >我也来评</button></div>



                <div class="modal-dialog" style="display: none">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title">评价</h4>
                        </div>
                        <form  action="comment_add" method="post" enctype="multipart/form-data">


                            <div class="modal-body">
                                <p>评价描述</p>
                                <input type="text" class="form-control" name="comment"></textarea><br>
                                <input type="hidden" name="tid" value="${t.id}">
                                选择一张图片：<input type="file" accept="image/*" name="image" value="选择图片">
                            </div>
                            <div class="modal-footer">
                                <button data-dismiss="modal" class="btn btn-default" type="button" id="close">关闭</button>
                                <input class="btn btn-primary" type="submit">
                            </div>
                        </form>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->


                <div class="panel-body">

                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

                        <c:forEach items="${coms}" var="com" varStatus="vs">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="heading">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${com.id}" aria-expanded="true" aria-controls="collapse">
                                        用户  ${com.userName} 的评价：
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse${com.id}" style="width: 100%;height: 100px"  class="panel-collapse collapse " role="tabpanel" aria-labelledby="heading">
                                <div class="panel-body">
                                    ${com.comment}<div class="divcss5">

                                        <img   src="/img/comment/${com.mid}.jpg" >
                                        <div>
                                </div>
                            </div>
                        </div>

                    </div>
                            </c:forEach>


                        </div>
                            <div class="pageDiv" align="center">
                                <%@include file="include/adminPage.jsp"%>
                            </div>
            </div>
        </div>
    </div></div>
</body>
</html>