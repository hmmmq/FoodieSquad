<%-- 
    Document   : MyOrderPage
    Created on : 2019-12-18, 20:02:46
    Author     : hmqhmq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="c_rt" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<!doctype html>
<html>
	<head>
             <c_rt:set value="${pageContext.request.contextPath}/views/MyOrderPage/" var="pth" scope="page"></c_rt:set>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
		<link rel="stylesheet" type="text/css" href="${pth}cssForMyOrderPage.css" />
             <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	</head>
	<body>
            <script>
         $(document).ready(
    function(){
        var menu="${sessionScope.menu}";
        var price="${sessionScope.totalPrice}";
        var verifyCode="${sessionScope.verifyCode}";
        $("#verifyCode").html(verifyCode);
    });
         </script>
		<!--容器-->
		<div class="container">
			<!--顶部页面标题*我的订单*与后退svg-->
			<div class="headingBox">
				<img src="${pth}returnbutton.svg" id="returnbtn" class="returnButtonSize"
                      onclick="window.location.href='/FOODIESQUAD/UserServlet'"
                                     />
				<label class=" headingText">我的订单</label>
			</div>
			<!--正在进行的订单-->
			<div class="ModuleTitleBox">
				<p class="ModuleTitleText"><b>正在进行的订单</b></p>
			</div>
			<!--取餐号-->
			<div class="Takingfoodpanel">
				<br>
				<p class="Takingfoodnumber"id="verifyCode" ><b >A0001</b></p>
				<p class="Takingfoodtext" >取餐号</p>
				<p class="Takingfoodaddtion">请凭借取餐号到对应窗口取餐</p>
				<br>
			</div>
			<!--历史订单-->
			<div class="ModuleTitleBox">
				<p class="ModuleTitleText"><b>历史订单</b></p>
			</div>
			<!--订单详情-->
			<!--部分数据应通过服务器调用-->
			<div class="OrderHistorypanel">
				<div class="OrderHistoryBox">
					<div>
						<br>
						<label class="OrderHistoryText"><b>订单详情</b></label>
						<label class="OrderHistorydateplace">2019年12月18日 第五食堂</label>
						<div class="clear"></div>
					</div>
					<hr>


					<img src="${pth}1.jpg" id="img1" class="OrderHistoryimg" alt="">
					<label class="OrderHistoryfoodname">&nbsp;&nbsp;<b>麻婆豆腐</b></label>
					<label class="OrderHistoryamount1">&nbsp;&nbsp;<b> ￥</b><b>3.00</b></label>
					<br><br>
					<label class="OrderHistoryText">&nbsp;&nbsp;&nbsp;&nbsp;*<b>10</b></label>
					<label class="OrderHistoryamount1"><b> ￥</b><b>30.00</b></label>
					<br><br><div class="clear"></div>


					<img src="${pth}1.jpg" id="img1" class="OrderHistoryimg" alt="">
					<label class="OrderHistoryfoodname">&nbsp;&nbsp;<b>麻婆豆腐</b></label>
					<label class="OrderHistoryamount1">&nbsp;&nbsp;<b> ￥</b><b>5.00</b></label>
					<br><br>
					<label class="OrderHistoryText">&nbsp;&nbsp;&nbsp;&nbsp;*<b>1</b></label>
					<label class="OrderHistoryamount1"><b> ￥</b><b>5.00</b></label>
					<br><br><div class="clear"></div>


					<hr>
					<label class="OrderHistorynumber">订单编号：201912180001</label>
					<label class="OrderHistoryamount2"><b>&nbsp;&nbsp;35.00</b></label>
					<label class="OrderHistoryamount1"><b>小计 ￥</b></label>
					<br>
				</div>
			</div>
		</div>
	</body>
</html>

