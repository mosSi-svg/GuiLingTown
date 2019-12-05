<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include/adminHeader.jsp"%>
<%@include file="include/adminNavigator.jsp"
%>
<html>
<head>
    <title>分类管理</title>
</head>
<script>
    $( function () {
        $("#button").click( function () {
            if(! checkEmpty("name","分类名称")){
                return false;
            }
        });
    })
</script>
<body>

<div class="workingArea">
    <br>
    <br>
    <br>
    <br>
    <h1 class="label label-info" >分类管理</h1>
    <br>
    <br>
    <div class="ListDataTableDiv">
    <div   class="panel panel-warning addDiv" style="width: 300px;margin-left: 600px" >

        <div class="panel-heading">
            编辑分类
        </div>
        <div class="panel-heading">
            <form method="post" id="addForm" action="category_update" >

                <table class="addTable">
                    <tr>
                        <td> 分类ID</td><td><input  type="text" readonly="readonly"  id="id" name="id" class="form-control" value="${c.id}"></td>
                    </tr>
                    <tr>
                        <td><br></td>
                    </tr>
                    <tr >
                        <td> 分类名称</td><td><input type="text" id="name" name="name" class="form-control" value="${c.name}"></td>
                    </tr>
                    <tr>
                        <td><br></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="修改分类"  class="btn-success" id="button">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    </div>
</div>
</body>