
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
<c:set value="${pageContext.request.contextPath}/image/orderDetail2Page/" var="imgpth" scope="page"/>
<c:set value="${pageContext.request.contextPath}/css/" var="csspth" scope="page"/>
<c:set value="${pageContext.request.contextPath}/view/" var="jsppth" scope="page"/>
<link rel="stylesheet" type="text/css" href="${csspth}cssForOrderDetail2Page.css"/>
</head>
	<body>
            <script>
         $(document).ready(
    function(){
    });
         </script>
         
        
<!--容器-->
<div class="container">
<div id="overlay" class="mask"></div>    
<div id="model">  
<div id="content">
<div style="text-align: center;"><img alt="logo" src="${imgpth}logo2.svg"></div>
<p id="item_value">是否确定取消订单</p>
<div>
<div><div class="row" style="margin-top:10px;" >

<div class="col-md-2">
<button name="cancel" id="cancel" onclick=" javascript: $('#model').slideUp();$('#overlay').hide(); ">取消</button>
</div>
<div class="col-md-8" style="margin: 57px;"></div>

<div class="col-md-2">
<button name="yes" id="yes" onclick="yes()">确定</button></div></div></div>
</div>
</div>
</div>
<!--顶部页面属性与后退-->
 <!-- 标题组头部 -->
    <div id="d1">
        <!-- 返回符号.svg-->
        <img src="${imgpth}return.svg" onclick="window.location.href='../myOrder/test.do'">
        <!--label-->
        <label style="">订单详情</label>
     </div>
	<div class="externalBox">
	<p class="externalBox_title">送餐骑手</p>
	<div class="itemBox" >
        <div class="cash" style="padding-bottom:15px">
<table>
<tr height="30%" style="padding:5px auto">
<td rowspan="2" width="35%">
<img src="${imgpth}logo.svg" class="cashimg"/>
</td>
<td  style="height:25px;align:left;float:left"><p  class="windowName">${deliver.userName}</p></td>

</tr>
<tr height="30%">
<td style="margin-top:1px;align:left;float:left"><p  class="orderStatus">大妈骑手号：${deliver.userId}</p></td>
</tr>
<tr height="30%">
<td style="align:left;float:left;margin-left:10px"><p  class="dishList">预计 38分钟 后送达</p></td>
</tr>
</table>  
</div>
<hr style="height:1px;border:none;border-top:solid 1px #efeff4;" />
<div style="height:40px">
<span class="orderId" style="margin-left:30px;width: 79px;height: 31px;border-radius: 18px;background: #ffe3ac;text-align:center;line-height: 31px;letter-spacing:1px; padding-right: 8px;">联系卖家</span>
<span class="totalPrice" style="margin-right:30px;width: 79px;height: 31px;border-radius: 18px;background: #ffe3ac;text-align:center;line-height: 31px;color: #494949;
  font-size: 12px;
  font-weight: 400;
  line-height: 31px;
  text-align: center;letter-spacing:1px;
  padding-left: 8px;
  " >联系骑手</span>
</div>
	</div>
	<p class="externalBox_title">餐品详情</p>
	<div class="itemBox">
	<div class="cashlist" >
	 <c:forEach items="${orderUtil.historyItemlist}" var="historyItem">
<div class="cash">
<table>
<tr height="30%" style="padding:5px auto">
<td rowspan="3" width="35%">
<img src="${imgpth}dishpic.svg" class="cashimg"/>
</td>
<td  style="height:25px;align:left;float:left"><p  class="windowName">${historyItem.dishId.dishName}</p></td>

</tr>
<tr height="30%">
<td style="margin-top:1px;align:left;float:left"><p  class="orderStatus">× ${historyItem.dishCount}</p></td>

</tr>
<tr height="30%">
<td style="align:left;float:right"><p  class="dishList">¥ ${historyItem.dishId.dishPrice * historyItem.dishCount}</p></td>

</tr>
</tr>
</table>  
</div>
</c:forEach>

</div>
<hr style=" height:1px;border:none;border-top:solid 1px #efeff4;" />
<div style="height:40px">
<span class="orderId">${orderUtil.order.orderId}</span>
<span class="totalPrice">小计<span class="bigPrice">¥ ${orderUtil.order.orderPrice}</span></span>
</div>
   </div>
	</div>

<div class="infoBox">
<div>
        <span class="left">支付方式</span>
        <c:choose> 
     <c:when test="${orderUtil.order.orderPayType eq '微信'}">   
	 <span class="right"><img src="${imgpth}weixin.svg" class="payMethod"></img></span>
 </c:when>      
     <c:otherwise> 
 <span class="right"><img src="${imgpth}alipay.svg" class="payMethod"></img></span>
  </c:otherwise> 
</c:choose>
       
</div>
</div>	
	
<div class="infoBox" style="height:73px">
<div class="innerBox" style="margin-top:5px">
        <span class="left">联系方式</span>
        <span class="right">${orderUtil.order.orderUserTele}</span>
</div>
<div class="innerBox" style="margin-top:5px">
        <span class="left">取餐地址</span>
        <span class="right">${orderUtil.order.orderAddress}</span>
</div>
</div>	

<div class="cancelBox" style="">
<button class="cancelButton" onclick="chooseFood()">取消订单</button>
</div>
</div>
	</body>
</html>
<script type="text/javascript">
function chooseFood(){

	$("#overlay").show();
	$("#model").slideDown();

	$("#overlay").click(function() {
		$("#model").slideUp();
		$("#overlay").hide();
	});


	
	
}

function yes(){
	//alert("yes!");
	window.location.href="${pageContext.request.contextPath}/myOrder/deleteOrder.do/orderId/"+${orderUtil.order.orderId}+"/userId/"+${orderUtil.order.userId}+".do";
	
}


$("[name=collection_item]").swipe({
    left: function(){
    	$("[name='collection']").css('display','inline');
   //alert("left");
    },
    right: function(){
    	$("[name='collection']").hide();
 //alert("right");
    }
});

function collection_item_do(){


	$("[name=collection_item]").swipe({
	    left: function(){
	    	$("[name='collection']").css('display','inline');
	  // alert("left");
	    },
	    right: function(){
	    	$("[name='collection']").hide();
	// alert("right");
	    }
	});
}


function canel_collection_item_do(){
	
	
	//取消区域
	$("[name=canel_collection_item]" ).swipe({
	    left: function(){
	    	$("[name='canel_collection']").css('display','inline');
	  
	    },
	    right: function(){
	    	$("[name='canel_collection']").hide();
	  
	    }
	});
	
	
	
	
}



//取消区域
$("[name=canel_collection_item]" ).swipe({
    left: function(){
    	$("[name='canel_collection']").css('display','inline');
  
    },
    right: function(){
    	$("[name='canel_collection']").hide();
  
    }
});

</script>
