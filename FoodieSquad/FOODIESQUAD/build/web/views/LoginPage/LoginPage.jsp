<%-- 
    Document   : LoginPage
    Created on : 2019-12-17, 13:28:37
    Author     : hmqhmq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<link rel="stylesheet" type="text/css" href="cssForLoginPage.css" />
</head>
<body>
<!--容器-->
<div class="container">
<!--顶部页面属性与后退-->
<div class="headingBox"><img src="closebutton.svg" id="closebtn" class="closeButtonSize"/><label for="closebtn" class="headingText">手机登录/注册</label>
</div>
<!--logo图片-->
<div class="logoBox">
<img src="logo.svg" id="logoimg" class="logoSize"/>
</div>
<form>
<!--电话号码-->
<div class="inputBox">
<input type="text" id="cellphonenumber" class="inputShape inputText" placeholder="请输入您的手机号" />
</div>
</form>
<!--附加提醒-->
<div class="addtionBox">
    <p class="additionText">用<b onclick="call()">手机号</b>登录<br/>登录/注册即代表同意<b>服务协议</b></p>
</div>
</div>
  <script type="text/javascript">
    function call(){
    var cellnum=document.getElementById("cellphonenumber").value;
  
    window.location.href="/FOODIESQUAD/LoginServlet?cellnum="+cellnum;
    }
/*
//跳转到loginservlet：/Users/hmqhmq/Downloads/FOODIESQUAD/src/java/foodiesquad/servlet/loginServlet.java */
//当前：/Users/hmqhmq/Downloads/FOODIESQUAD/web/views/LoginPage/LoginPage.jsp
  </script>
</body>
</html>