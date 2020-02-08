<%-- 
    Document   : chooseCanteenPage
    Created on : 2019-12-18, 20:00:01
    Author     : hmqhmq
--%>

<%@page import="foodiesquad.entity.Canteen"%>
<%@page import="foodiesquad.service.serviceimpl.CanteenServiceImpl"%>
<%@page import="foodiesquad.service.CanteenService"%>
<%@page import="foodiesquad.entity.Menu"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="c_rt" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
           <c_rt:set value="${pageContext.request.contextPath}/views/ChooseCanteenPage/" var="pth" scope="page"></c_rt:set>
         
        <link rel="stylesheet" type="text/css" href="${pth}cssForCCP.css">
<script>



 function showb(add1,add2){
  $("#overlay").show();
$("#model").slideDown();

 $("#overlay").click(function(){
  $("#model").slideUp();
    $("#overlay").hide();
});

$("#p1").text(add1);
$("#q2").text(add2);
  $("#op1").click(
    function(){
        $("#im1").attr("src","${pth}checked.svg");
        $("#im2").attr("src","${pth}unchecked.svg");
    }
    );

$("#op2").click(
    function(){
        $("#im2").attr("src","${pth}checked.svg");
        $("#im1").attr("src","${pth}unchecked.svg");
    }
    );
    }
        





</script>
</head>
<body>
 
   <div class="mycontainer" >	
     <div id="overlay" class="mask"></div>    
    <div id="model">
     <div id="content">
         
         <p ><img src="${pth}home.svg">&nbsp;&nbsp;<span id="p1">海南大学食堂</span></p>
   <p  class="text_recommand" ><span>推荐:</span>
       <span id="q2">食堂名字</span> 
    </p>
     <label class="text_canteenBusy">! 餐厅密集，请注意区分。</label>
 <form action="" method="get" > 

    <p name="xzdc" id="op1"
        onmouseover="$(this).css('color','blue');"
        onmouseout=" $(this).css('color','grey');">
    <img src="${pth}unchecked.svg" name="im" id="im1">
    现在点餐 支付成功后取餐
     <span>Now</span>
     </p> 
        <p name="xzdc" id="op2"
            onmouseover="$(this).css('color','blue');" onmouseout=" $(this).css('color','grey');">
     <img src="${pth}unchecked.svg" name="im" id="im2">&nbsp;预约点餐 到食堂后取餐<span >Later</span>
       </p> 

     <p id="jcfs">请选择就餐方式:</p>
    
        <div name="jcfs"> 
            <div id="no1"  
                 onmouseover="$(this).find('span').css('color','blue');" onmouseout=" $(this).find('span').css('color','grey');"
                >
          <img src="${pth}cloud.svg">
         <span onclick="window.location.href='${pageContext.request.contextPath}/views/ChooseFoodPage/ChooseFoodPage.jsp'"
              > 食堂就餐</span>
        <span name="sp"> Dine in</span>
        </div>
         <div id="no2"  onclick="window.location.href='${pageContext.request.contextPath}/views/ChooseFoodPage/ChooseFoodPage.jsp'"
              
                 onmouseover="$(this).find('span').css('color','blue');"onmouseout=" $(this).find('span').css('color','grey');"
              
              
              >  <img src="${pth}cloud.svg">
        <span> 打包带走</span>
         <span name=sp>Take Away </span>
   
     </div>
   </div>
</form> 

</div>
</div>	


    <!-- 标题组头部 -->
  	<div class="bg_1 text_title " >
  		<!-- 返回符号.svg-->
                <img id="img1"src="${pth}return.svg" onclick="window.location.href='${pageContext.request.contextPath}/views/HomePage/homePage.jsp'">
  		<!--选择餐厅label-->
  		<label style="padding-bottom: 4px;">选择餐厅</label>
     </div>
    <!-- 搜索区 -->
     <div class="searchBar"> 
     <!--搜索框 搜索bar/下拉菜单-->
         <div class="search"> 
     <!-- 海南大学 徽章-->
            <label class="text_HNU" >海南大学 <img src="${pth}path.svg"></label>

            <input type="text" name="search" class="text_label" placeholder="海南大学第五食堂" list="canteensForChoose" />
			<datalist id="canteensForChoose">
			<option value="海南大学第五食堂">
			<option value="海南大学第六食堂">
			<option value="海南大学第三食堂">
			</datalist>
            <img src="${pth}searchicon.svg" >
      </div></div>
     	
  <div style="padding-left: 10px;">
     <!--海大食堂title-->
     <div class="text_canteen">
     	<!--标签：海大食堂-->
     	<label>海大食堂</label>
     	<!--tab-->
     	<hr class="tab"></hr>

     </div>
     <!--食堂-->
     <div id="fujin" class="fujinBox"style="overflow-y: scroll;
 height: 100px;box-sizing: border-box;">
     	 <!--标签：附近-->
     	 <label class="text_nearby" >附近</label>
         <c_rt:set value="0.5" var="i"></c_rt:set>
               <c_rt:forEach items="${cslist}" var="canteen" >
              
              <!--canteen.cId-->
              <div onclick="showb($(this).find('.text_canteenName').text(),$(this).find('#cn').text());">
                  <label class="text_canteenName" >${canteen.cAddress} </label>
               <label class="text_distance" > ${i=i+1}公里</label>
                 <p class="text_recommand" ><span>&nbsp;&nbsp;推荐:</span>
                     <span id="cn">${canteen.cName}</span>
              </div>
               
        </c_rt:forEach>
              
       <!--label:0.15公里-->
        
     	 <!-- label:推荐-->
     	
   
     	<label class="text_canteenBusy">&nbsp;&nbsp;! 餐厅密集，请注意区分。</label>
     	 	

     </div>
     <!--我的收藏-->
     <div class="text_mycollection">我的收藏</div>
     <div class="circle" >
     	<!--微笑.svg-->
     	<img src="${pth}smile.svg">
     	<!--标签-->
     	<p class="text_mylabel">左滑上方的餐厅列表可以收藏餐厅哦</p>
     </div>

     </div>
 </div>
</body>


        
   
</html>
