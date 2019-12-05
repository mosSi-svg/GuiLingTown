<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/adminHeader.jsp"%>
<%@include file="include/adminNavigator.jsp"
%>
<html>
<head>
    <title>小镇管理</title>
</head>
<script>
</script>
<body>
<div class="workingArea">
    <br>
    <br>
    <br>
    <h1 class="label label-info" >${t.name}的图片管理</h1>
    <br>
    <br>
    <div class="listDataTableDiv" >
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success" style="width: 500px">
                <th>ID</th>

                <th>图片</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ts}" var="image">
                <tr>
                <td>${image.id}</td>
                <td>
                    <img width="100px" height="100px" src="img/detail/${image.id}.jpg">
                </td>
                <td><a deleteLink="true" href="towImage_delete?id=${image.id}"><span class="glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv" align="center">
        <%@include file="include/adminPage.jsp"%>
    </div>

    <div   class="panel panel-warning addDiv" style="width: 300px;margin-left: 600px" >

        <div class="panel-heading">
            新增图片
        </div>
        <div class="panel-heading">
            <form method="post" id="addForm" action="townImage_add"  enctype="multipart/form-data">

                <table class="addTable">

                    <tr>
                        <td colspan="2" align="center">
                            <input type="file" accept="image/*"  name="image">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" name="tid" value="${t.id}">
                            <input type="submit" class="btn btn-success" value="添加图片">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>

</body>
</html>

