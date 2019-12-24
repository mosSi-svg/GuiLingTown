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
                    用户名：<input type="text" name="name" class="form-control" >
                    密码：<input type="password" name="name" class="form-control">
                    <div id="reText" style="height: 30px">

                    </div>
                </div>
                <div class="modal-footer">
                    <button  class="btn btn-default" type="button">注册</button>
                    <button class="btn btn-primary" type="button">登录</button>

                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>



<div id="category" align="center">
    <span>特色小镇类别一览</span>
    <table >
        <c:forEach items="${cs}" var="c">
            <tr > <td width="178px">
                <a href="listTown?cid=${c.id}">

                            ${c.name}

                </a>
            </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div id="rightPane">
    <h1 style="margin-left: 70px">桂林</h1>
    桂林，简称桂，是世界著名风景游览城市、万年智慧圣地，是国务院批复确定的中国对外开放国际旅游城市、
    国家可持续发展议程创新示范区、全国旅游创新发展先行区、中国建成世界级旅游目的地的示范区 、
    是“一带一路”和黔粤湘桂交界重要联接点。联合国世界旅游组织/亚太旅游协会旅游趋势与展望国际论坛
    永久举办地、中央军委桂林联勤保障中心驻地。
    桂林地处中国华南，西南连柳州，东邻贺州，
    属山地丘陵地区及典型喀斯特岩溶地貌，遍布全市的石灰岩经亿万年风化浸蚀，
    形成千峰环立，一水抱城，洞奇石美独特景观。截至2019年，全市下辖6个区、10个县、
    代管1个县级市、总面积2.78万平方公里，建成区面积162平方千米，常住人口530余万。
</div>
<div id="main">
    <div id="main-head">
        <span><button class="btn btn-success">民宿推荐</button></span> <span><button class="btn btn-success">地图导航</button></span>
        <span id="search">
            <form action="/listBySearch" method="post">
        <input  type="text" id="ss"  name="search"> <input id="bb" type="submit" value="搜索小镇">
                </form>
    </span>
    </div>


    <c:forEach items="${ts}" var="t">
        <a href="show?tid=${t.id}">
            <span class="list1">
                <table>
                    <tr>
                       <td><img src="/Img/detail/${t.image.id}.jpg"/></td><td><h2>${t.name}</h2>
                       ${t.simText}
                    </td>
                    </tr>
                </table>
            </span>
        </a>

    </c:forEach>

</div>

</body>
</html>