<%-- 
    Document   : homePage
    Created on : 2019-12-17, 13:42:37
    Author     : hmqhmq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="c_rt" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
      <c_rt:set value="${pageContext.request.contextPath}/views/HomePage/" var="pth" scope="page"></c_rt:set>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content=
        "width=device-width,initial-scale=1.0,user-scalable=no">
       <link rel="stylesheet" type="text/css" href="${pth}cssForHomePage.css"/>
       <link rel="stylesheet" type="text/css" href="${pth}bootstrap.min.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="bootstrap.min.css" />


    </head>
        
    <body>
         <script>
         $(document).ready(
    function(){
        var menu="${sessionScope.menu}";
        var price="${sessionScope.totalPrice}";
        var verifyCode="${sessionScope.verifyCode}";
        $("#dealrecord").click(function(){
            window.location.href="/FOODIESQUAD/MyOrderingServlet?menu="+menu+"&totalPrice="+price+"&verifyCode="+verifyCode;
        });
    });
         </script>
        <!--首页头部时间状态栏><-->
        <div class="mycontainer">
            <br>

         <!--具体日期-->
         <div class="datetext" id="today">
             11月16日 星期六 第十二周
         </div>
        <!--首页头部宣传 中午啦！吃点好的!-->
         <div class="title-text">
            <label name="sun-moon-logo" >
           🌞<span id="abc">中午</span>吃点好的！${sessionScope.u.uName}</label>
        </div>
        <!--横线-->
        <div ><hr class="line"></div>
        <div><br></div>
        <!--轮播栏-->

        <div id="scrolling"><img src="${pth}lunbo.svg"></div>

       <!--上次吃过-->
        <div class="datetext">
         <img src="${pth}navigateicon.svg">上次吃过:${sessionScope.history};
        </div>
         <!--空格-->
         <div><br></div>
         <!--开始点餐-->
         <div  class="startordering buttonbox"onclick="window.location.href='/FOODIESQUAD/CanteenServlet'">
             开始点餐
         </div>
         <div><br></div>
         <!--点餐记录 && 个人中心-->
      
             <!--点餐记录-->
          <div class="row "> 
          <div class="myOrdering col-md-6">
          <span style="padding-top: 2px ">
          <img src="${pth}ordering.svg" id="dealrecord">
          <br>
        用餐记录
           </span>
         </div>
          <!--个人中心-->
            <div class="personalcenter col-md-6">
            <a href="${pageContext.request.contextPath}/views/PersonalCenterPage/PersonalCenterPage.jsp"><img src="${pth}logo.svg"><br>
            个人中心</a>
            </div>
             </div>
              
        

     <script>
       
       
    function getMyDay(date){
   var week;
if(date.getDay()==0) week="星期日"
if(date.getDay()==1) week="星期一"
if(date.getDay()==2) week="星期二"
if(date.getDay()==3) week="星期三"
if(date.getDay()==4) week="星期四"
if(date.getDay()==5) week="星期五"
if(date.getDay()==6) week="星期六"
return week;
}
function setdate(){
  var date=new Date();
       var t;
      var s=date.getHours(); //获取当前小时数(0-23)
     if(s>0&&s<12){
     t="上午啦！ Morning！";
      }else if(s>12&&s<13){
      t="中午啦！ Noon！";
       }else if(s>13&&s<17){
     t="下午啦！ Afternoon!";
        }else{
     t="晚上啦！ Good evening!";
      }
      $("#abc").text(t);
      $("#today").text(date.getMonth()+1+"月"+date.getDate()+"日"+" "+getMyDay(date));}
     setdate();

   </script>
   
        
      
    </body>
</html>