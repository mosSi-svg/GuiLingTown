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
    $( function () {
        $(".TValue").keyup(function(){
            var pid = $(this).attr("pid");
            var name = $(".TValue[mid="+pid+"]").val();
            var simText = $(".TValue[sid="+pid+"]").val();
            var detText = $(".TValue[did="+pid+"]").val();
            var cid = $(".TValue[cid="+pid+"]").val();
            var parentSpan = $(this).parent("span");
            parentSpan.css("border","1px solid yellow");
            var page = "town_update";

            $.post(
                page,
                {"id":pid,"name":name,"simText":simText,"detText":detText,"cid":cid},
                function(result){
                    if("success"==result)
                        parentSpan.css("border","1px solid green");
                    else
                        parentSpan.css("border","1px solid red");
                }
            );
        });

    })
</script>
<body>


<div class="workingArea">
    <br>
    <br>
    <br>
    <h1 class="label label-info" >小镇管理</h1>
    <br>
    <br>
    <div class="listDataTableDiv" >
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success" style="width: 500px">
                <th>ID</th>
                <th>小镇名称</th>
                <th>小镇简介</th>
                <th>小镇详情</th>
                <th>图片管理</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ts}" var="t">
           <tr>
               <td>${t.id} </td><td>
               <span class="TValue">
               <input class="TValue" type="text" pid="${t.id}"  mid="${t.id}" value="${t.name}"></span>
               <input class="TValue" type="hidden" pid="${t.id}"  cid="${t.id}" value="${t.cid}">
           </td>

               <td> <span class="TValue"><textarea class="TValue" style="width: 400px"  pid="${t.id}"   sid="${t.id}">${t.simText}</textarea></span></td>

               <td><span class="TValue"><textarea class="TValue" style="width: 400px"   pid="${t.id}"  did="${t.id}">${t.detText}</textarea></span></td>

               <td><a href="townImage_list?id=${t.id}"><span class="glyphicon glyphicon-picture"></span></a> </td>

               <td><a deleteLink="true" href="town_delete?id=${t.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
           </tr>

            </c:forEach>
            </tbody>
        </table>

</div>
    <div class="pageDiv" align="center">
        <%@include file="include/adminPage.jsp"%>
    </div>

    <div class="listDataTableDiv" >
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success" style="width: 500px">
                <th>小镇名称</th>
                <th>小镇简介</th>
                <th>小镇详情</th>
                <th>小镇分类</th>
                <th>添加</th>
            </tr>
            </thead>
            <tbody>
             <form action="town_add" method="post">
                 <tr>
                     <td><input type="text" name="name"></td>
                     <td><textarea name="simText" style="width: 400px"></textarea></td>
                     <td><textarea name="detText" style="width: 400px"></textarea></td>
                     <td>
                         <c:if test="${cid  < 0 }">
                          <select name="cid">
                              <c:forEach items="${cs}" varStatus="vs" var="c">
                                <option value="${c.id}" >${c.name}</option>
                              </c:forEach>
                          </select>

                         </c:if>
                         <c:if test="${cid  >0 }">
                         <input type="hidden" name="cid" value="${cid}">
                             ${category.name}
                         </c:if>
                     </td>
                     <td><input type="submit" value="添加小镇信息" class="btn-success"></td>
                 </tr>
             </form>
            </tbody>
        </table>
    </div>



</div>
</body>
</html>