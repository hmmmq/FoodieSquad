<%-- 
    Document   : PersonalCenterPage
    Created on : 2019-12-17, 13:30:04
    Author     : hmqhmq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<link rel="stylesheet" type="text/css" href="cssForPersonalCenterPage.css" />
</head>
<body>
<!--容器-->
<div class="container">
<!--顶部页面属性与后退-->
<div class="headingBox">
<div class="backButtonBox" onclick="window.location.href='/FOODIESQUAD/views/HomePage/homePage.jsp'">
<img src="backbutton.SVG" id="backbtn" class="backButtonSize"
     />
</div>
<!--头像图片-->
<div class="logoBox">
<img src="logo.svg" id="logoimg" class="logoSize"/>
</div>
<div class="personalPanelBox">
<!--用户名-->
<div class="personalPanelTextBox">
<p class="personalPanelText">${sessionScope.u.uName}</p>
</div>
<!--大妈号-->
<div class="addtionBox">
<p class="additionText"></p>
</div>
</div>
</div>
<div class="pageDispatcherBox">
<div class="myOrderListBox">
<img src="myorderlist.svg" id="myorderlistbtn" class="myOrderListImg" onclick="window.location.href='/FOODIESQUAD/views/MyOrderPage/MyOrderPage.jsp'"/>
<br/>
<!--附加信息-->
<label for="myorderlistbtn" class="additionText" style="text-align:left;">我的订单</label>
</div>
</div>
<!--版权信息-->
<div class="addtionBox">
<p class="additionText" style="margin-top:100px;">©️Foodie squad 大妈手不抖</p>
</div>
</div>
</body>
</html>