<%-- 
    Document   : SubmitOrdering
    Created on : 2019-12-18, 20:03:32
    Author     : hmqhmq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="c_rt" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<!DOCTYPE html>
<!-- saved from url=(0078)file:///Users/hmqhmq/Desktop/foodie%20squad/SubmitOrdering/SubmitOrdering.html -->
<html>
<head>  
    <c_rt:set value="${pageContext.request.contextPath}/views/SubmitOrdering/" var="pth" scope="page"></c_rt:set>
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
var price="${sessionScope.totalPrice}";
$("#d3_sp5").html(price);
$("#d7_s3").html(price);
  $("#d4_d1").click(
    function(){
        $("#im1").attr("src","${pth}homeb.svg");
        $("#im2").attr("src","${pth}homeblack.svg");
   $("#d4_d1").css(
   "background","rgba(61,126,255,0.28)" );
  $("#d4_d1").css("color","#3D7EFF" );
   $("#d4_d2").css("color","#C7C7CC" );
 $("#d4_d2").css("background", "#FFFFFF");
    }
    );

$("#d4_d2").click(
    function(){
        $("#d4_d2").css(
   "background", "rgba(61,126,255,0.28)"
            );
         $("#d4_d1").css(
   "background","#FFFFFF");
         $("#d4_d1").css("color","#C7C7CC" );
         $("#d4_d2").css("color","#3D7EFF" );

        $("#im2").attr("src","${pth}homeb.svg");
        $("#im1").attr("src","${pth}homeblack.svg");
    }
    );
$("#d7_s2").click(function(){
    window.location.href="/FOODIESQUAD/SubmitOrderingServlet?menu="+menu+"&totalPrice="+price;
});




});
</script>
       <div class="mycontainer">    

    <!-- 标题组头部 -->
    <div id="d1">
        <!-- 返回符号.svg-->
        <img src="${pth}return.svg">
        <!--选择餐厅label-->
        <label style="">提交订单</label>
     </div>
<div id="d1_5">
    <!--p2 海南大学第五食堂-->
     <div id="d2">
        <p id="d2_p1">海南大学第五食堂</p>
        <p id="d2_p2">麻辣香锅店</p>
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
    <!--p4就餐方式-->
    <div id="d4">
        <label id="d4_l">就餐方式</label>
        <br>
        <div id="d4_d1"><img id="im1"src="${pth}homeblack.svg">
                                  食堂就餐</div>
        <div id="d4_d2"><img id="im2"src="${pth}homeblack.svg">打包带走</div>
    </div>
    <!--p5支付方式-->
    <div id="d5">
        <label id="d5_l1">支付方式</label>
        <div id="d5_d1"><img src="${pth}wx.svg"></div>
        <div id="d5_d2"><img src="${pth}zfb.svg"></div>
        
    </div>
    <!--p6联系方式-->
     <div id="d6">
        <span id="d6_s1">联系方式</span>
        <input type="text" placeholder="1323334998" id="d6_s2"/>
     </div>
     <!--p7支付bar-->
     <div id="d7">
        <img id="d7_i1" src="${pth}money.svg">
        <span id="d7_s1">¥ <span id="d7_s3">26.91</span></span>
        <span id="d7_s2">去结算</span>
        <img id="d7_i2" src="${pth}moveon.svg">
     </div>
</div>
     

   
        

       </div>


</body></html>
