
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <c:set value="${pageContext.request.contextPath}/image/editUserAddressPage/" var="imgpth" scope="page"/>
    <c:set value="${pageContext.request.contextPath}/css/" var="csspth" scope="page"/>
    <c:set value="${pageContext.request.contextPath}/view/" var="jsppth" scope="page"/>
    <link rel="stylesheet" type="text/css" href="${csspth}cssForEditUserAddressPage.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
</head>
<body>
<!--容器-->
<div class="container" style="background-repeat:no-repeat; background-size:100% auto;-moz-background-size:100% auto;">
    <!--顶部页面属性与后退-->
    <div class="topBox" >
        <img class="backButtonSize" src="${imgpth}backBtn.png" id="backBtn" onclick="javascript:history.back(-1);">
        <span class="addAddressField">添加地址</span>
        <button class="finishBtn" onclick="call()">完成</button>
    </div>
    <div class="profileBox">
        <img src="${imgpth}logo.png" class="logoImg">
    </div>
    <div class="addressInfoTable">
    <form action="addAddress.do" method="post" id="ff">
        <div class="addressInfoRow">
            <span class="column1">联系昵称</span>
            <input type="text" class="column2" value="${user.userName}" id="username" name="username" readonly="readonly">
        </div>
        <div class="separateLine"></div>
        <div class="addressInfoRow">
            <span class="column1">手机号码</span>
            <input type="text" value="" class="column2" id="userphone" name="userphone">
        </div>
        <div class="separateLine"></div>
        <div class="addressInfoRow">
            <span class="column1">送餐地址</span>
            <input type="text" value="" class="column2" id="address" name="address">
        </div>
        <div class="separateLine"></div>
    </form>
    </div>

</div>
<script>
    function call() {
        if($('#username').val()=="") alert("联系昵称不能为空！");
        else if($('#userphone').val()=="") alert("联系电话不能为空！");
        else if($('#address').val()=="") alert("送餐地址不能为空！");
        else {

        	$('#ff').submit();
        }
    }
</script>

</body>
</html>