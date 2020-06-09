
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,user-scalable=no">

<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<c:set value="${pageContext.request.contextPath}/image/submitOrderPage/"
	var="imgpth" scope="page" />
<c:set value="${pageContext.request.contextPath}/css/" var="csspth"
	scope="page" />
<c:set value="${pageContext.request.contextPath}/view/" var="jsppth"
	scope="page" />
<link rel="stylesheet" type="text/css"
	href="${csspth}cssForSubmitOrderPage.css">
</head>
<body>
	<script>
		$(document).ready(function() {

			//支付方式重写
			$("#d5_d1").click(

			function() {
				$("#d5_d1").css("background", "rgba(61,126,255,0.28)");
				$("#d5_d2").css("background", "#FFFFFF");
				$("#orderPayType").val("微信");
			});

			$("#d5_d2").click(function() {
				$("#d5_d2").css("background", "rgba(61,126,255,0.28)");
				$("#d5_d1").css("background", "#FFFFFF");
				$("#orderPayType").val("微信");

			});

			//就餐方式重写
			//点击食堂就餐
			var show_item = 1;
			$("#d4_d1").click(function() {
				show_item = 1;
				$("#telelist").show();
				$("#addresslist").hide();
				$("#address").show();

				$("#im1").attr("src", "${imgpth}homeb.svg");
				$("#im2").attr("src", "${imgpth}homeblack.svg");
				$("#d4_d1").css("background", "rgba(61,126,255,0.28)");
				$("#d4_d1").css("color", "#3D7EFF");
				$("#d4_d2").css("color", "#C7C7CC");
				$("#d4_d2").css("background", "#FFFFFF");
				$("[name='orderType']").val("堂食");

			});
			//弹出联系方式和取餐地址

			//点击打包带走
			$("#d4_d2").click(function() {

				show_item = 2;
				$("#telelist").show();
				$("#address").hide();
				$("#addresslist").show();

				$("#d4_d2").css("background", "rgba(61,126,255,0.28)");
				$("#d4_d1").css("background", "#FFFFFF");
				$("#d4_d1").css("color", "#C7C7CC");
				$("#d4_d2").css("color", "#3D7EFF");
				$("[name='orderType']").val("外卖");
				$("#im2").attr("src", "${imgpth}homeb.svg");
				$("#im1").attr("src", "${imgpth}homeblack.svg");

			});
			
			
			//弹出联系方式：后台获取tele表单

			//常用地址：后台获取address地址
			
		$("#d7").click(function() {
		if (show_item == 1) {
			$("[name='orderAddress']").val($("#address").text());
		
			$("[name='orderUserTele']").val($("#user_tele").val());
		} else {
			$("[name='orderAddress']").val($("#user_address").val()) ;
		
			$("[name='orderUserTele']").val($("#user_tele").val()) ;
		}
		document.success.submit();

	});

		});
	</script>
	<div class="mycontainer">

		<!-- 标题组头部 -->
		<div id="d1">
			<!-- 返回符号.svg-->
			<img src="${imgpth}return.svg" onclick="javascript:history.back(-1);">
			<!--选择餐厅label-->
			<label style="">提交订单</label>
		</div>
		<div id="d1_5">
			<!--p2 海南大学第五食堂-->
			<div id="d2">
				<p id="d2_p1">${canteenName}</p>
				<p id="d2_p2">麻辣香锅店</p>
				<p id="d2_p3">订单编号：201927642187923749</p>
			</div>
			<!--p3产品详情-->
			<div id="d3">
				<p>餐品详情</p>
				<br>
				<ul class="menu" id="ordermenu"
					style="list-style: none; width: 300px; height: 100px; overflow-y: auto;">
					<c:forEach items="${cartItemList}" var="cartItem">
						<li>${cartItem.dishId.dishName}<span class="menuspan">
								¥ ${cartItem.dishId.dishPrice} × ${cartItem.dishCount}</span></li>
					</c:forEach>
				</ul>
				<span id="d3_sp4">小计：</span> <span id="d3_sp5">¥
					${orderPrice}</span>
			</div>
			<!--p4就餐方式-->
 <div id="d4">
        <label id="d4_l">就餐方式</label>
        <br>
        <div id="d4_d1"><img id="im1"src="${imgpth}homeblack.svg">食堂就餐</div>
        <div id="d4_d2"><img id="im2"src="${imgpth}homeblack.svg">打包带走</div>
    </div>
			<!--p5支付方式-->
			<div id="d5">
				<label id="d5_l1">支付方式</label>
				<div id="d5_d1">
					<img src="${imgpth}wx.svg">
				</div>
				<div id="d5_d2">
					<img src="${imgpth}zfb.svg">
				</div>
			</div>

			<!--p6联系方式-->

			<div id="telelist" hidden="true">
			<span style="align:left;float:left">联系方式:</span>
				<input  style="align:right;float:right;font-size: 3px;color: #8E8E93;letter-spacing: 0;text-align: center;" type="text" class="" id="user_tele"
					placeholder="${telelist[0].userTele}" list="telelist2"><!-- value="${telelist[0].userTele} -->
				<datalist id="telelist2">
					<c:forEach items="${telelist}" var="tele">
						<option value="${tele.userTele}">${tele.userTele}</option>
					</c:forEach>

				</datalist>

			</div>
			<!-- 取餐地址 -->
             
             <div id="address" hidden="true" value="${canteen}"><span style="align:left;float:left">取餐地址:</span><span style="align:right;float:right">${canteen}</span></div>
             <div id="addresslist" hidden="true">
             <span style="align:left;float:left">常用地址：</span>
				<input style="align:right;float:right;font-size: 3px;color: #8E8E93;letter-spacing: 0;text-align: center;" type="text" class="" id="user_address"
					placeholder="${addresslist[0].userAddress}" list="addresslist2" ><!-- value="${addresslist[0].userAddress}" -->
				<datalist id="addresslist2">
					<c:forEach items="${addresslist}" var="address">
						<option value="${address.userAddress}">${address.userAddress}</option>
					</c:forEach>
				</datalist>


			</div>


			<!-- form表单 -->
			<form action="../successPaid/test.do" method="post" id="new_order"
				name="success" style="top:700px;position:absolute;z-index:3;height:10px;">
				<input type="hidden" name="orderAddress"> 
				<input id="orderPayType"
					type="hidden" name="orderPayType"> 
					<input type="hidden"
					name="orderPrice" value="${orderPrice}">
					 <input type="hidden" name="orderType"> <input type="hidden"
					name="orderUserTele"> <input type="hidden" name="userId"
					value="${userId}">
				<!--p7支付bar-->
				<div id="d7" >
					<img id="d7_i1" src="${imgpth}money.svg"> <span id="d7_s1">¥
						<span id="d7_s3">${orderPrice}</span>
					</span> <span id="d7_s2">去结算</span> <img id="d7_i2"
						src="${imgpth}moveon.svg">
				</div>
			</form>
		</div>
	</div>


</body>

</html>
