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
    <c:set value="${pageContext.request.contextPath}/image/loginByIdPwdPage/" var="imgpth" scope="page"/>
    <c:set value="${pageContext.request.contextPath}/css/" var="csspth" scope="page"/>
    <c:set value="${pageContext.request.contextPath}/view/" var="jsppth" scope="page"/>
    <link rel="stylesheet" type="text/css" href="${csspth}cssForLoginByIdPwdPage.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script>
       /*  function call() {
            $.post({
                url: "${pageContext.request.contextPath}/login/verifyStuNumAndPwd.do",
                data: {"stuNum": $("#studentnumber").val(), "password": $("#studentpassword").val()},
                success: function (data) {
                    if (data === 'error') {
                        $("#userInfo").css("color", "red");
                        $("#userInfo").html("用户名或密码错误");
                    }else{
                        window.location.href="${pageContext.request.contextPath}/login/verifyStuInfo.do"
                      }
                }
            })
        } */
      </script>
</head>
<body>
<!--容器-->
<div class="container">
    <!--顶部页面属性与后退-->
    <div class="headingBox"><img src="${imgpth}backbutton.SVG" id="backbtn" class="backButtonSize" onclick="window.location.href='${pageContext.request.contextPath}/index/test.do'"/>
    </div>
    <!--logo图片-->
    <div class="logoBox">
        <img src="${imgpth}logo.svg" id="logoimg" class="logoSize"/>
    </div>
    <form action="${pageContext.request.contextPath}/login" method="POST" name="f" id="f">
        <!--输入学号密码-->
        <div class="inputBox">
            <input   type="text"  name="username"  class="inputShape inputText" value/><br/><!--学号14位年份-->
            <input type="password"  name="password"   class="inputShape inputText" />
<%--                   pattern="^[a-zA-Z]\w{5,17}$"/><!--字母开头，长度在6~18之间，只能包含字母、数字和下划线-->--%>
            <div style="margin-left: 94px" ><span id="userInfo"></span></div>
           
    		
             
            <!--登录按钮-->
            <div class="loginButtonBox">
          
                <input type="submit" name="submit" class="loginButtonShape loginButtonText" value="登录"/>
                 
            </div>
            <p class="additionText" style="    margin-top: 9px;
    margin-right: 39px;"> <input type="checkbox" name="remember-me" value="true" form="f">记住我</p>

        </div>
    </form>
    <!--附加提醒-->
    <div class="addtionBox">
        <p class="additionText">登录即代表阅读并同意<b>服务协议</b></p>
    </div>
</div>
</body>
</html>