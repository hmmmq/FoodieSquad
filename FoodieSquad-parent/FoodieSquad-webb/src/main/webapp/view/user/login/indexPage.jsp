<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <c:set value="${pageContext.request.contextPath}/image/indexPage/" var="imgpth" scope="page"/>
    <c:set value="${pageContext.request.contextPath}/css/" var="csspth" scope="page"/>
    <c:set value="${pageContext.request.contextPath}/view/" var="jsppth" scope="page"/>
    <link rel="stylesheet" type="text/css" href="${csspth}cssForIndexPage.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    
    <script>
    function custom_close(){
    	 if(confirm("您确定要关闭本页吗？")){
    			debugger
    	        window.opener=null;
    			window.open('','_self');
    			window.location.href="about:blank";
    	        window.close();  //当断点执行到这里时会显示“Scripts may close only the windows that were opened by it.”所以要加上面“about:blank”页面才可以成功关闭
    	    }
    	    else{
    	    }
    	}
    	</script>
 
</head>
<body>
<!--容器-->
<div class="container" style="background-image:url(${imgpth}backimg.png); background-repeat:no-repeat; background-size:100% auto;-moz-background-size:100% auto;">

<div class="topBox" >
<!--顶部页面属性与后退-->
<div class="headingBox"><img src="${imgpth}closebutton.svg" id="closebtn" class="closeButtonSize" onclick="custom_close();">
</div>
<!--logo-->
<img class="logoImg" src="${imgpth}logo.png"/>
</div>
<!--登录按钮-->
<div class="clickBox">
<button class="button1" onclick="window.location.href='../login/usePhone.do'">用手机号码登录</button><br/>
<button class="button2" onclick="window.location.href='../login/useStuNumber.do'">用学号登录</button>
</div>
<!--附加提醒-->
<div class="addtionBox">
    <p class="additionText"  >登录/注册即代表同意<b>服务协议</b></p>
</div>
</div>

</body>
</html>