<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Jquery._default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.4.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <script type="text/javascript">
  var xml='  <?xml version="1.0" encoding="UTF-8"?><stulist> <student  mailto:1@1.com" target=_blank>1@1.com">   <name>zhangsan</name>    <id>1</id>  </student>  <student  mailto:2@2.com" target=_blank>2@2.com"> <name>lisi</name>   <id>2</id> </student></stulist>'
   function A(xml){
        $(xml).find("student").each(function(i){
            var id=$(this).children("id");   //取对象
            var id_value=$(this).children("id").text();  //取文本 或者 $("id" , xml).text();
            alert(id_value);//这里就是ID的值了。
        
          })
          }
A(xml);
        </script>
    </div>
    </form>
</body>
</html>
