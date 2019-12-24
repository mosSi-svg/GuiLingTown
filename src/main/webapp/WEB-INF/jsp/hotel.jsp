
<html>
<head>
    <title>民宿推荐</title>
</head>
<body>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>桂林特色小镇</title>
    <!--  <script src="resource/JQ/js/jquery/2.0.0/jquery.min.js"></script>
      <link href="resource/JQ/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
      <script src="resource/JQ/js/bootstrap/3.3.6/bootstrap.min.js"></script>
  -->

    <script src="JQ/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="JQ/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="JQ/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="JQ/style.css" />
    <script src="JQ/login.js"></script>
</head>

<body>
<nav class=" navbar-fixed-top">

    <jsp:include page="include/header.jsp"></jsp:include>
</nav>
<div class="head">
    <span class="head-s1"> 欢迎来到桂林特色小镇</span><span class="head-s2"><a href="index.html">主页</a> <a href="index.html">请登录</a> <a style="margin-left: 60px" href="index.html">我的</a> <a href="index.html">注销</a></span>
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



</body>
</html>
