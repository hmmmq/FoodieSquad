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
<c:set value="${pageContext.request.contextPath}/image/personalCenterPage/" var="imgpth" scope="page"/>
<c:set value="${pageContext.request.contextPath}/css/" var="csspth" scope="page"/>
<c:set value="${pageContext.request.contextPath}/view/" var="jsppth" scope="page"/>
<!--  <link rel="stylesheet" type="text/css" href="${csspth}cssForPersonalCenterPage.css"/>-->

<style>
body {
	margin:0 auto;
}

@media screen and (min-width: 1000px) {
	body {
		width:980px;
	}
}
.container{
	margin: 0 auto;
	z-index: 4;
	width: 375px;
	height: 812px;
	background: #ffffff;
	border:0.5px solid;
	border-color: rgba(151, 151, 151, 0.3);
}
.topBox{
	width: 375px;
	height: 286px;
	background: #3d7eff;
}
.headingBox{
	margin-left: 10px;
	padding-top:52px;
}
.backButtonSize{
	width: 8px;
	height: 15px;
}
.nameBox{
	margin-left: 28px;
	/*margin-top: 30px;*/
	/*padding-top: -10px;*/
	/*padding-bottom: 40px;*/
	width: 122px;
	height: 140px;
}
.profileBox{
	margin-bottom: 55px;
	margin-bottom: 10px;
	/*margin-left: 147.5px;*/
	opacity: 0.9;
	width: 80px;
	height: 80px;
	background: #ffffff;
	box-shadow: 0px 0px 10px 2px rgba(61,126,255,0.29);
	-moz-border-radius: 60px;
	-webkit-border-radius: 60px;
	border-radius: 40px;
}

.logoImg{
	margin-left: 16px;
	margin-top: 15px;
}
.nameText{
	width: 113px;
	height: 34px;
	color: #ffffff;
	font-family: "PingFangSC-Semibold";
	font-size: 29px;
	font-weight: 400;
	line-height: 34px;
}
.idText{
	margin-top: 5px;
	width: 122px;
	height: 34px;
	color: #ffffff;
	font-family: "PingFangSC-Regular";
	font-size: 14px;
	font-weight: 400;
	line-height: 34px;
}
.backgroundLogo{
	margin-left: 207.4px;
	margin-top: -230px;
}

.editBtn{
	margin-left: 265px;
	margin-top: -140px;
	width: 90px;
	height: 36px;
	background-color: #3d7eff;
	color: #ffffff;
	border-radius: 8px;
	border: solid 1px #ffffff;
	font-family: "PingFangSC-Regular";
	font-size: 14px;
	font-weight: 400;
	line-height: 34px;
	text-align: center;
}
.bottomBox{
	/*margin-top: -16px;*/
	width: 375px;
	height: 526px;
	/*border-radius: 20px;*/
	background: #f9f9f9;
	box-shadow: 0px 2px 6px #efeff4;
}

.addressInfoBox{
	margin-top: 10px;
	margin-left: 8px;
	width: 357px;
	height: 142px;
	border-radius: 20px;
	background: #ffffff;
	box-shadow: 0px 2px 6px #efeff4;
	position: relative;
}
.addressHead{
	padding-left: 10px;
	/*margin-top: 15px;*/
	/*padding-top: 5px;*/
	width: 357px;
	height: 30px;
	color: #494949;
	font-family: "PingFangSC-Semibold";
	font-size: 17px;
	font-weight: 400;
	line-height: 20px;
	/*text-align: center;*/
}

.addressInfoHead{
	padding-left: 6px;
	width: 40px;
	height: 30px;
	color: #494949;
	font-family: "PingFangSC-Semibold";
	font-size: 18px;
	font-weight: 400;
	line-height: 20px;
	/*text-align: left;*/
	position: relative;
}
.addressInfoTable{
	padding-top: 10px;
	padding-left: 8px;
	width: 375px;
}
.column1{
	padding-left: 10px;
	width: 100px;
	height: 18px;
	color: #494949;
	font-family: "PingFangSC-Semibold";
	font-size: 14px;
	font-weight: 400;
	line-height: 18px;
}
.column2{
	margin-left: 150.8px;
	width: 100px;
	height: 15px;
	color: #8e8e93;
	font-family: "PingFangSC-Regular";
	font-size: 12px;
	font-weight: 400;
	line-height: 15px;
	text-align: center;
}
.editImg{
	padding-left: 220px;
	padding-top: 6px;
	width: 22px;
	height: 28px;
	position: relative;
}
.separateLine{
	margin-top: 20px;
	margin-left: -1px;
	width: 357px;
	height: 0.2px;
	border: solid 1px #d9d9dc;
}
.additionBox{
	margin-left: 175px;
	margin-top: 20px;
	width: 25px;
	height: 25px;
	background: #3d7eff;

}
</style>
</head>
<body>
<!--容器-->
<div class="container" style="background-repeat:no-repeat; background-size:100% auto;-moz-background-size:100% auto;">
     <!--顶部页面属性与后退-->
     <div class="topBox">
          <div class="headingBox"><img src="${imgpth}backBtn.png" id="backbtn" class="backButtonSize" onclick="javascript:history.back(-1);">
          </div>
          <div class="nameBox">
               <div class="profileBox">
                    <img src="${imgpth}logo.png" class="logoImg">
               </div>
               <span class="nameText">${user.userName}</span>
               <div class="idText">大妈号：<span name="userId" id="userId">${user.userId}</span></div>
          </div>
          <img src="${imgpth}backgroundLogo.png" class="backgroundLogo">
          <button class="editBtn" onclick="window.location.href='modifyInfo.do'">编辑资料</button>
     </div>
     <!--页面底部-->
     <div class="bottomBox">

          
               <c:forEach items="${userUtilList}" var="userUtil" varStatus="status">
          <div class="addressInfoBox">
          <div class="addressHead">
               <span class="addressInfoHead">常用地址<span>${status.count}</span></span>
               <img src="${imgpth}edit.png" class="editImg" onclick="window.location.href='editUserAddress.do?teleId=${userUtil.userTele.userTeleId}&addressId=${userUtil.userAddress.userAddressId}'">
          </div>
          <div class="separateLine"></div>
          <div class="addressInfoTable">
               <span class="column1">联系昵称</span>
               <input type="text" class="column2" value="${userUtil.user.userName}">
				<br/>
               <span class="column1">手机号码</span>
               <input type="text" value="${userUtil.userTele.userTele}" class="column2">
				<br/>
               <span class="column1">送餐地址</span>
               <input type="text" value="${userUtil.userAddress.userAddress}" class="column2">
          </div>
          </div>

               </c:forEach>
       
          <img src="${imgpth}additionBtn.png" class="additionBox" onclick="window.location.href='addUserAddress.do'">
     </div>

</div>
<script>
   
</script>
</body>
</html>