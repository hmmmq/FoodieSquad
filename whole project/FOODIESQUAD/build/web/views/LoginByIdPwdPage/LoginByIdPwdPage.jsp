<%-- 
    Document   : LoginByIdPwdPage
    Created on : 2019-12-17, 13:38:55
    Author     : hmqhmq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<link rel="stylesheet" type="text/css" href="cssForLoginByIdPwdPage.css" />
</head>
<body>
<!--容器-->
<div class="container">
<!--顶部页面属性与后退-->
<div class="headingBox"><img src="backbutton.svg" id="backbtn" class="backButtonSize"/>
</div>
<!--logo图片-->
<div class="logoBox">
<img src="logo.svg" id="logoimg" class="logoSize"/>
</div>
<form>
<!--输入学号密码-->
<div class="inputBox">
<input type="text" id="studentnumber" class="inputShape inputText" placeholder="学号" type="tel" pattern="^(19[6-9]|20[0|1|2])\d{11}$"/><br/><!--学号14位年份-->
<input type="password" id="studentpassword" class="inputShape inputText" placeholder="输入密码" type="tel" pattern="^[a-zA-Z]\w{5,17}$"/><!--字母开头，长度在6~18之间，只能包含字母、数字和下划线-->
<!--登录按钮-->
<div class="loginButtonBox">
<input type="submit" id="loginbutton" class="loginButtonShape loginButtonText" value="登录"/>
</div>
</div>
</form>
<!--附加提醒-->
<div class="addtionBox">
<p class="additionText">登录即代表阅读并同意<b>服务协议</b></p>
</div>
</div>
</body>
</html>