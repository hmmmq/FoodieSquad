
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
<c:set value="${pageContext.request.contextPath}/image/historyOrderPage/" var="imgpth" scope="page"/>
<c:set value="${pageContext.request.contextPath}/css/" var="csspth" scope="page"/>
<c:set value="${pageContext.request.contextPath}/view/" var="jsppth" scope="page"/>
<link rel="stylesheet" type="text/css" href="${csspth}cssForHistoryOrderPage.css"/>
</head>
	<body>
            <script>
         $(document).ready(
    function(){
    	
    	//点击itemBox
    	$(".itemBox").click(function (){
    	//获取订单编号
    	var orderId=$(this).find(".orderId").attr("name");

    	//转跳
    	window.location.href="${pageContext.request.contextPath}/myOrder/go_to_order_detail.do/orderId/"+orderId+"/userId/"+${userId}+".do";	
    	});
    	
    	$("#goToHome").click(function(){
    		
    		
    		window.location.href="${pageContext.request.contextPath}/home/test.do";	
    		
    		
    	})
    	
    	

    });
         
         
         </script>
<!--容器-->
<div class="container">
<!--顶部页面属性与后退-->
 <!-- 标题组头部 -->
    <div id="d1">
        <!-- 返回符号.svg-->
        <img src="${imgpth}return.svg" id="goToHome">
        <!--label-->
        <label style="">历史订单</label>
     </div>
     
<div class="externalBox">
	<p class="externalBox_title">尚未取餐的订单</p>    
	<div class="orderlist"> 
     <c:forEach items="${orderUtilList}" var="orderUtil">
     
     <c:if test="${orderUtil.order.orderStatus==0}">
     	<div class="itemBox">
        <p class="p1">${orderUtil.order.orderCode}</p>
        <p class="p2">取餐号</p>
        <p class="p3">请凭借取餐号到对应窗口取餐</p>
<div class="cash">
<table>
<tr height="30%" style="padding:5px auto">
<td rowspan="3" width="35%">
<img src="${imgpth}dishpic.svg" class="cashimg"/>
</td>
<td  style="height:25px;align:left;float:left"><p  class="windowName">${orderUtil.canteenName} - ${orderUtil.windowName}</p></td>
<td  style="height:25px;align:right;float:right"><p  class="orderStatus">未取餐</p></td>
</tr>
<tr height="30%">
<td style="margin-top:1px;align:left;float:left"><p  class="orderStatus">${orderUtil.order.orderStartTime}</p></td>

</tr>
<tr height="30%">
<td style="align:left;float:left"><p  class="dishList">${orderUtil.firstDishName} 等${orderUtil.dishCount}件</p></td>

</tr>
</table>  
</div>
<hr style=" height:1px;border:none;border-top:solid 1px #efeff4;" />
<div style="height:40px">
<span class="orderId" name="${orderUtil.order.orderId}">订单编号 ${orderUtil.order.orderId} </span>
<span class="totalPrice">小计<span class="bigPrice">¥ ${orderUtil.order.orderPrice}</span></span>
</div>

   </div>
     
     </c:if>
     
     
     </c:forEach>
     </div>
</div>     
     
<div class="externalBox">
	<p class="externalBox_title">历史订单</p>    
	<div class="orderlist">  
	<c:forEach items="${orderUtilList}" var="orderUtil">
     
     <c:if test="${orderUtil.order.orderStatus==1}">
     	<div class="itemBox">
<div class="cash">
<table>
<tr height="30%" style="padding:5px auto">
<td rowspan="3" width="35%">
<img src="${imgpth}dishpic.svg" class="cashimg"/>
</td>
<td  style="height:25px;align:left;float:left"><p  class="windowName">${orderUtil.canteenName} - ${orderUtil.windowName}</p></td>
<td  style="height:25px;align:right;float:right"><p  class="orderStatus">已取餐</p></td>
</tr>
<tr height="30%">
<td style="margin-top:1px;align:left;float:left"><p  class="orderStatus">${orderUtil.order.orderStartTime}</p></td>

</tr>
<tr height="30%">
<td style="align:left;float:left"><p  class="dishList">${orderUtil.firstDishName} 等${orderUtil.dishCount}件</p></td>

</tr>
</table>  
</div>
<hr style=" height:1px;border:none;border-top:solid 1px #efeff4;" />
<div style="height:40px">
<span class="orderId" name="${orderUtil.order.orderId}">订单编号 ${orderUtil.order.orderId} </span>
<span class="totalPrice">小计<span class="bigPrice">¥ ${orderUtil.order.orderPrice}</span></span>
</div>

   </div>
     
     </c:if>
     
     
     </c:forEach>
</div>
</div>
     
</div>

	</body>
</html>

