<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<div class="head">
    <span id="head-s1"> 桂林特色小镇</span><span id="head-s2"><a href="index.html">主页</a>

    <c:if test="${empty user}">
    <a data-toggle="modal" data-target="#myModal">请登录</a> </c:if>


         欢迎你，${user.name} <a  style="margin-left: 30px" href="" id="clear">注销</a>
     </span>



</div>