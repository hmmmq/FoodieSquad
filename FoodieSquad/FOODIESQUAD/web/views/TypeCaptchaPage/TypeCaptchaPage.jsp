
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String verifyCode=session.getAttribute("verifyCode").toString(); %>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<link rel="stylesheet" type="text/css" href="cssForTypeCaptchaPage.css" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
function enterVerificationcode(val){
	var list = document.getElementById("enterUL").getElementsByTagName("li");
	var len=val.length;
        
    for(var i = 0; i < list.length; i++) {
            
			if(i<len){
				list[i].classList.add("active");
				list[i].innerHTML=val.charAt(i);
			}
			else{
				list[i].classList.remove("active");
				list[i].innerHTML="";
			}

        }
        if(len==4)
        {
            if(val==<%=verifyCode%>)
            {
                alert("Success");
                
                window.location.href="/FOODIESQUAD/UserServlet";
               
            }
            else
            {
                alert("Failed");
            }
        }
		
}
</script>
</head>
<body>
<!--容器-->
<div class="container">
<!--顶部页面属性与后退-->
<div class="headingBox"><img src="backbutton.SVG" id="backbtn" class="backButtonSize"/>
</div>
<!--首部文本-->
<div class="topTextBox">
<p class="topText">输入验证码</p>
</div>
<!--附加提醒-->
<div class="addtionBox">
<p class="additionText">验证码已发送至...</p>
</div>
<form>
<!--输入验证码-->
<div class="inputBox">

  <div class="verificationCode">
   <input id="verificationcode" type="tel" maxlength="4" pattern="d*" autocomplete="off"	class="verificationCodeInput" autofocus="autofocus" onkeyup="enterVerificationcode(this.value)"/>
   <ul id="enterUL" class="verificationCodeText">
    <li class="active"><i></i></li>
    <li><i></i></li>
    <li><i></i></li>
    <li><i></i></li>
   </ul>
  </div>

</div>
</form>
<!--附加提醒-->
<div class="addtionBox">
<p class="additionText">收不到验证码？</p>
</div>
</div>

</body>
</html>