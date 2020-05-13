<%-- 
    Document   : Successpaid
    Created on : 2019-12-18, 20:04:02
    Author     : hmqhmq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="c_rt" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<!-- saved from url=(0078)file:///Users/hmqhmq/Desktop/foodie%20squad/SubmitOrdering/SubmitOrdering.html -->
<html>
<head>  
        <c_rt:set value="${pageContext.request.contextPath}/views/Successpaid/" var="pth" scope="page"></c_rt:set>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
        <link rel="stylesheet" type="text/css" href="${pth}cssForSO.css">
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
    <script>
        $(document).ready(
    function(){
        var menu="${sessionScope.menu}";
        var price="${sessionScope.totalPrice}";
        var verifyCode="${sessionScope.verifyCode}";
        $("#d2_p1").html(verifyCode);
        $("#d3_sp5").html(price);
        var arr = menu.split(',');
var ul = document.getElementById("ordermenu");
for(var i=0;i<arr.length;i++)
{
    var li = document.createElement("li");
  var t = document.createTextNode(arr[i]);
  li.appendChild(t);
 var span = document.createElement("SPAN");
 var txt = document.createTextNode("×"+arr[i+1]);
 span.className="menuspan";
  span.appendChild(txt);
  li.appendChild(span);
  ul.appendChild(li);
  i++;
}
$("#back").click(function(){
    window.location.href="/FOODIESQUAD/SuccesspaidServlet?menu="+menu+"&totalPrice="+price+"&verifyCode="+verifyCode;
});
    });
        
        </script>
       <div class="mycontainer">    

    <!-- 标题组头部 -->
    <div id="d1">
        <!-- 返回符号.svg-->
        <img src="${pth}return.svg" id="back">
        <!--选择餐厅label-->
        <label style="">提交订单</label>
     </div>
<div id="d1_5">
    <!--p2 海南大学第五食堂-->
     <div id="d2">
        <p id="d2_p1">A1067</p>
        <p id="d2_p2">取餐号</p>
        <p id="d2_p3">订单编号：201927642187923749</p>
     </div>
     <!--p3产品详情-->
     <div id="d3">
        <p>餐品详情</p>
        <br>
        <ul class="menu" id="ordermenu" style="list-style: none">
	</ul>
        <span id="d3_sp4">小计：¥</span>
        <span id="d3_sp5"></span>
    </div>
  
    <!--p6联系方式-->
     <div id="d6">
        <span id="d6_s1">联系方式</span>
        <span id="d6_s2">1323334998</span>
     </div>
    

   
        

       </div>


</body></html>