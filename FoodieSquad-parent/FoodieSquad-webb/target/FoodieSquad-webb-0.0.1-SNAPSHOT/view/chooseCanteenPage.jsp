<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=WdZj6DVeDlyURhe04tFbtZ5aODeDIt05&s=1"></script> 
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script> 
<script src="${pageContext.request.contextPath}/js/EventUtil.js"></script>
<c:set
	value="${pageContext.request.contextPath}/image/chooseCanteenPage/"
	var="imgpth" scope="page" />
<c:set value="${pageContext.request.contextPath}/css/" var="csspth"
	scope="session" />
<c:set value="${pageContext.request.contextPath}/view/" var="jsppth"
	scope="session" />
<link rel="stylesheet" type="text/css" href="${csspth}cssForCCP.css">
<%-- <link rel="stylesheet" type="text/css" href="${csspth}normalize.css" /> --%>
<%-- 	<link rel="stylesheet" type="text/css" href="${csspth}simple-grid.min.css"> --%>

</head>
<body>
<div class="mycontainer" >
<div id="overlay" class="mask"></div>    
<div id="model">  
<div id="content">
<div style="text-align: center;"><img alt="logo" src="${imgpth}logo.svg"></div>
<p id="item_value"></p>
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

<!-- 标题组头部 -->
<div class="bg_1 text_title "><!-- 返回符号.svg--><img id="img1" src="${imgpth}return.svg" onclick="javascript:history.back(-1);"><!--选择餐厅label--><label id="xzct" >选择餐厅</label></div>

<!-- 搜索区 -->
<div class="searchBar">
		<!--搜索框 搜索bar/下拉菜单-->
		<div class="search">
			<!-- xx大学 徽章-->
			<label class="text_HNU">xx大学<img src="${imgpth}path.svg"></label>
			
      <input type="text" class="text_label"  oninput="testRestful()" id="searchstr" placeholder="搜索菜名/窗口名/食堂名" list="canteensForChoose" name="searchtext"/>
		<datalist id="canteensForChoose"></datalist>
		<span onclick="testRestful2()"> <img src="${imgpth}searchicon.svg">
		 </span>
		 </div>
		 </div>

<div style="padding:0px 10px;">
<!--xx食堂title-->
<div class="text_canteen"><!--标签：xx食堂--><label>x大食堂</label><!--tab--><hr class="tab"></hr></div>

<!--标签：附近-->
<label class="text_nearby">附近</label>
<!--食堂-->
<div id="fujin" class="fujinBox"  style="overflow-y: scroll; height: 100px; box-sizing: border-box;">


<c:if test="${dishlist!=null}">


<div name="collection_item" style="height: 33.6px; margin: 12px 0px; left: 47px; top: 256px;">

<c:forEach items="${dishlist}" var="dish">


<p  onclick="chooseFood(${dish.type},${dish.dishId})"  class="text_recommand" style="color: #535151;font-size: 12px; display: inline;">${dish.dishName} ${dish.dishDiscription}
<div name="collection" onclick="collection(${dish.type},${dish.dishId})" >加入收藏
</div>
</p>
<%-- <span id="Id" hidden="true">${dish.dishId}</span>
<span id="Type" hidden="true">${dish.type}</span> --%>


</c:forEach>
</div>

</c:if>   
  
<c:if test="${windowlist!=null}">
 <div name="collection_item"  style="height:33.6px;margin:12px 0px;">

<c:forEach items="${windowlist}" var="window">

<p class="text_recommand" style="color: #535151;font-size: 12px; display: inline;" onclick="chooseFood(${window.type},${window.windowId})"> 
${window.windowName} ${window.windowDescription}
<div name="collection" onclick="collection(${window.type},${window.windowId})" >加入收藏
</div>
</p>
</c:forEach>
</div></c:if> 

<c:if test="${canteenlist!=null}"> 
<div name="collection_item" style="height:33.6px;margin:12px 0px;"><c:forEach items="${canteenlist}" var="canteen">

<p class="text_recommand" style="color: #535151;font-size: 12px; display: inline;"   onclick="chooseFood(${canteen.type},${canteen.canteenId})"> 
${canteen.canteenAddress}   ${canteen.canteenName}
<!-- <label class="text_canteenBusy">&nbsp;&nbsp;! 餐厅密集，请注意区分。</label> -->
<div name="collection" onclick="collection(${canteen.type},${canteen.canteenId})" >加入收藏
</div>
</p> 

</c:forEach></div></c:if>

</div>

<br>
<!-- 显示当前位置 -->
<p class="text_mycollection">您当前的位置为：</p><div id="map" style="height:100px;width:300px"></div>
<!--我的收藏-->
<div class="text_mycollection" style="height:34px; box-sizing: border-box;">我的收藏</div>

<div id="collection_bar" style="overflow-y: scroll; height: 149px; box-sizing: border-box;">



<c:if test="${(empty fdl)&&(empty fwl)&&(empty fcl)}"> 
	 <div class="circle" >
     	<!--微笑.svg-->
     	<img src="${imgpth}smile.svg">
     	<!--标签-->
     	<p class="text_mylabel">左滑上方的列表可以收藏条目哦</p>
     	
     </div>
 </c:if>

<c:if test="${fdl!=null}">   
<div><c:forEach items="${fdl}" var="fdish">
<div style="height:33.6px; margin:12px 0px;" name="canel_collection_item"  >
<p class="text_recommand" style="display:inline;" onclick="chooseFood(${fdish.dishId.type},${fdish.dishId.dishId})">${fdish.dishId.dishName}</p>
<div  name="canel_collection"   onclick="canel_collection(${fdish.dishId.type},${fdish.dishId.dishId})">取消收藏</div>

</div>
</c:forEach>
</div>
</c:if>  
  
 <c:if test="${fwl!=null}"> 
<div >
<c:forEach items="${fwl}" var="fwindow" >
<div style="height:33.6px; margin:12px 0px;" name="canel_collection_item" >
<p class="text_recommand" style="display:inline;"  onclick="chooseFood(${fwindow.windowId.type},${fwindow.windowId.windowId})"> ${fwindow.windowId.windowName}</p>
<div name="canel_collection" onclick="canel_collection(${fwindow.windowId.type},${fwindow.windowId.windowId})">取消收藏
</div>
</div>

</c:forEach>
</div>
</c:if> 
 
 <c:if test="${fcl!=null}"> 
<div><c:forEach items="${fcl}" var="fcanteen" >
<div style="height:33.6px;margin:12px 0px;" name="canel_collection_item"  >
<p class="text_recommand" style="display:inline;"   onclick="chooseFood(${fcanteen.canteenId.type},${fcanteen.canteenId.canteenId})">${fcanteen.canteenId.canteenName}</p> 
<div name="canel_collection"  onclick="canel_collection(${fcanteen.canteenId.type},${fcanteen.canteenId.canteenId})">取消收藏
</div>
</div>
</c:forEach>
</div>
</c:if> 


</div>






</div>
	</div>
</body>
</html>




<script type="text/javascript">

//初始化地图 
var map = new BMap.Map("map"); 
var point = new BMap.Point(116.331398,39.897445);
map.centerAndZoom(point,12);
var geolocation=new BMap.Geolocation();
geolocation.getCurrentPosition(function(r){
	if(this.getStatus()==BMAP_STATUS_SUCCESS){
		var mk=new BMap.Marker(r.point);
		map.addOverlay(mk);
		map.panTo(r.point);
		
	}else{
		alert('failed'+this.getStatus());
	}
},{enableHighAccuracy:true})

function yes(){
	//alert("yes!");
	window.location.href="${pageContext.request.contextPath}/chooseFood/go_choose_food.do";
	
}


function testRestful(){
	//console.log("response-js");
    //$(#xxx)获取id为xxx元素的值
    var searchstr = $("#searchstr").val();
    //使用jQuery ajax携带数据发送请求
    //$.ajax返回一个XMLHttpRequest 对象
    $.ajax({    //发送地址，即目的地。
                url:"${pageContext.request.contextPath}/canteen/restful/" + searchstr+".do",
                type:"get",//发送方式
                //指定内容类型
                contentType:"application/json;charset=UTF-8",
                //数据类型
                dataType:"json",
                //请求成时执行的函数。
                //data为返回的对象
                success:function(data){
                	if(data.length!=0){
                	$("#canteensForChoose").empty();
                     	console.log(data);
                     for (var i = 0; i <5; i++) {
                              //alert(data[i]);
                              console.log(data[i]);
                            $("#canteensForChoose").append("<option>"+data[i]+"</option>");
                            }}}

            },"json");}



// 搜索

function testRestful2(){
	//console.log("response-js");
    //$(#xxx)获取id为xxx元素的值
    var searchstr = $("#searchstr").val();
    $.ajax({    //发送地址，即目的地。
        url:"${pageContext.request.contextPath}/canteen/testsearch2_ajax/" +searchstr+ ".do",
        type:"get",//发送方式
        //指定内容类型
        contentType:"application/json;charset=UTF-8",
        //数据类型
        dataType:"json",
        //请求成时执行的函数。
        //data为返回的对象
        success:function(data){
        	 $("#fujin").empty();
        	if(data.length!=0){
        		
        		
             	console.log(data);
             for (var i in data) {
            	 // console.log(data[i]);
               if(i=='dishlist'&& data[i]!=null){
            	 
            	   for(var dish in data[i]){
            		   console.log("dish",dish);
            	   var dish_div=
            		   
            		   ' <div style="height:33.6px; margin:12px 0px;" name="collection_item">'
            		   +
            	   '<p class="text_recommand" style="color: #535151;font-size: 12px;    display:inline;" onclick="chooseFood('
            			   +
            	       data[i][dish].type
            	           +
            			   ','
            			   +
            			   data[i][dish].dishId
            			   +
            			   ')">'
            	           +
            	        data[i][dish].dishName
            	           +
            	        '</p>'
            	           +
            	 '<div name="collection" onclick="collection('
            		      +
            	 data[i][dish].type
            	         +
            			','
            			 +
            			 data[i][dish].dishId
            			 +
            			 ')">加入收藏</div>'
            			 +
            	 '</div>';
            	
            	 $("#fujin").append(dish_div);
            	 console.log(dish_div);
            	 
            	collection_item_do();
            	   }
               }
               else if(i=='windowlist'&& data[i]!=null){
            
            	   
            	   
            	   for(var window in data[i]){
                	   var window_div=
                		' <div style="height:33.6px; margin:12px 0px;" name="collection_item" >'
                		   +
                	   '<p class="text_recommand" style="color: #535151;font-size: 12px;    display:inline;" onclick="chooseFood('
                			   +
                			   data[i][window].type
                			   +
                			   ','
                			   +
                			   data[i][window].windowId
                			   +
                			   ')">'
                	        +
                	        data[i][window].windowName
                	        +
                	        '</p>'
                	        +
                	 '<div  name="collection" onclick="collection('
                			 +
                			 data[i][window].type
                			 +
                			 ','
                			 +
                			 data[i][window].windowId
                			 +
                			 ')">加入收藏</div>'
                			 +
                	 '</div>';
                	 
                	 $("#fujin").append(window_div);
                	 collection_item_do();
            	    } }else if(i=='canteenlist'&& data[i]!=null){
            	    
            	    	

                 	   
                 	   for(var canteen in data[i]){
                 		 //console.log("name:",data[i][fcanteen].canteenId.canteenName)
                 
                     	   var canteen_div=
                     		 
                     		   ' <div style="height:33.6px; margin:12px 0px;" name="collection_item" >'
                     		   +
                     	   '<p class="text_recommand" style="color: #535151;font-size: 12px;  display:inline;" onclick="chooseFood('
                     			  + data[i][canteen].type +
                     			   ','
                     			   +
                     			  data[i][canteen].canteenId+
                     			   ')">'
                     	        + data[i][canteen].canteenName+'</p>'+
                     	 '<div  name="collection" onclick="collection('+
                     			 data[i][canteen].type+
                     			 ','+
                     			 data[i][canteen].canteenId
                     			 +')">加入收藏</div>'
                     			 +
                     	 '</div>';
                     	 
                     	 $("#fujin").append(canteen_div);
                     	//console.log(fcanteen_div);
                     collection_item_do();
            	     
            	    }
            	    }
            	    else{
            	    	var n=i+data[i]+"";
            	    	console.log(n);
            	    } } }
        	
         
        },//success 完成
        
        
        
        error: function (status) {}
    
   
    
    
    
    
    
    
    
    
    
    
  
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
 //收藏   
function collection(type,id){
	//console.log("response-js");
    //$(#xxx)获取id为xxx元素的值
   /*  var type=$(obj).find("#Type").text();
	var id=$(obj).find("#Id").text(); */
	console.log("type:",type,"id:",id);
	//alert("收藏成功！");
	$("[name='collection']").css('display','none');
    $.ajax({    //发送地址，即目的地。
        url:"${pageContext.request.contextPath}/canteen/collection/type/"+type+"/id/"+id+".do",
        type:"get",//发送方式
        //指定内容类型
        contentType:"application/json;charset=UTF-8",
        //数据类型
        dataType:"json",
        //请求成时执行的函数。
        //data为返回的对象
        success:function(data){
        	
        	$("#collection_bar").empty();
        	if(data.length!=0){
        		console.log(data);
             for (var i in data) {
            	 // console.log(data[i]);
               if(i=='fdl'&& data[i]!=null){
            	 	
            	   for(var fdish in data[i]){
            		   console.log("fdish",fdish);
            	   var fdish_div=
            		   
            		   ' <div style="height:33.6px; margin:12px 0px;" name="canel_collection_item">'
            		   +
            	   '<p class="text_recommand" style="display:inline;" onclick="chooseFood('
            			   +
            	       data[i][fdish].dishId.type
            	           +
            			   ','
            			   +
            			   data[i][fdish].dishId.dishId
            			   +
            			   ')">'
            	           +
            	        data[i][fdish].dishId.dishName
            	           +
            	        '</p>'
            	           +
            	 '<div name="canel_collection" onclick="canel_collection('
            		      +
            	 data[i][fdish].dishId.type
            	         +
            			','
            			 +
            			 data[i][fdish].dishId.dishId
            			 +
            			 ')">取消收藏</div>'
            			 +
            	 '</div>';
            	
            	 $("#collection_bar").append(fdish_div);
            	 console.log(fdish_div);
            	 
            	 canel_collection_item_do();
            	   }
               }
               else if(i=='fwl'&& data[i]!=null){
            	
            	
            	   for(var fwindow in data[i]){
                	   var fwindow_div=
                		' <div style="height:33.6px; margin:12px 0px;" name="canel_collection_item" >'
                		   +
                	   '<p class="text_recommand" style="display:inline;" onclick="chooseFood('
                			   +
                			   data[i][fwindow].windowId.type
                			   +
                			   ','
                			   +
                			   data[i][fwindow].windowId.windowId
                			   +
                			   ')">'
                	        +
                	        data[i][fwindow].windowId.windowName
                	        +
                	        '</p>'
                	        +
                	 '<div  name="canel_collection" onclick="canel_collection('
                			 +
                			 data[i][fwindow].windowId.type
                			 +
                			 ','
                			 +
                			 data[i][fwindow].windowId.windowId
                			 +
                			 ')">取消收藏</div>'
                			 +
                	 '</div>';
                	 
                	 $("#collection_bar").append(fwindow_div);
                	 canel_collection_item_do();
            	    } }else if(i=='fcl'&& data[i]!=null){
            	    	 for(var fcanteen in data[i]){
                 		 	
                 		 //console.log("name:",data[i][fcanteen].canteenId.canteenName)
                 
                     	   var fcanteen_div=
                     		 
                     		   ' <div style="height:33.6px; margin:12px 0px;" name="canel_collection_item" >'
                     		   +
                     	   '<p class="text_recommand" style="display:inline;" onclick="chooseFood('
                     			  + data[i][fcanteen].canteenId.type +
                     			   ','
                     			   +
                     			  data[i][fcanteen].canteenId.canteenId+
                     			   ')">'
                     	        + data[i][fcanteen].canteenId.canteenName+'</p>'+
                     	 '<div  name="canel_collection" onclick="canel_collection('+
                     			 data[i][fcanteen].canteenId.type+
                     			 ','+
                     			 data[i][fcanteen].canteenId.canteenId
                     			 +')">取消收藏</div>'
                     			 +
                     	 '</div>';
                     	 
                     	 $("#collection_bar").append(fcanteen_div);
                     	//console.log(fcanteen_div);
                     	canel_collection_item_do();
            	     
            	    }
            	    }
            	    else{
            	    
            	    	var n=
            	      '<div class="circle" ><img id="smile"><p class="text_mylabel">左滑上方的列表可以收藏条目哦</p> </div>';
            	     
            	 	 $("#collection_bar").append(n);
            	 	 var src='${imgpth}smile.svg';
            	 	 $("#smile").attr('src',src);
            	    	console.log(n);
            	    } } }
        	
         
        },//success 完成
        
        
        
        error: function (status) {}
    
   
    
    
    
    
    
    
    
    
    
    
  
    });
}
    //取消收藏
function canel_collection(type,id){
	
	
	console.log("type:",type,"id:",id);
   
	
    $.ajax({    //发送地址，即目的地。
        url:"${pageContext.request.contextPath}/canteen/cancel_collection/type/"+type+"/id/"+id+".do",
        type:"get",//发送方式
        //指定内容类型
        contentType:"application/json;charset=UTF-8",
        //数据类型
        dataType:"json",
        //请求成时执行的函数。
        //data为返回的对象
        success:function(data){
        	
        	
        	if(data.length!=0){
        		
        		 $("#collection_bar").empty();
             	console.log(data);
             for (var i in data) {
            	 // console.log(data[i]);
               if(i=='fdl'&& data[i]!=null){
            	
            	   for(var fdish in data[i]){
            		   console.log("fdish",fdish);
            	   var fdish_div=
            		   
            		   ' <div style="height:33.6px; margin:12px 0px;" name="canel_collection_item">'
            		   +
            	   '<p class="text_recommand" style="display:inline;" onclick="chooseFood('
            			   +
            	       data[i][fdish].dishId.type
            	       +
            			   ','
            			   +
            		data[i][fdish].dishId.dishId
            			   +
            			   ')">'
            	        +
            	        data[i][fdish].dishId.dishName
            	        +
            	        '</p>'
            	        +
            	 '<div  name="canel_collection" onclick="canel_collection('
            			 +
            	 data[i][fdish].dishId.type
            	          +
            			 ','
            			 +
            			 data[i][fdish].dishId.dishId
            			 +
            			 ')">取消收藏</div>'
            			 +
            	 '</div>';
            	
            	 $("#collection_bar").append(fdish_div);
            	 canel_collection_item_do();
            	   }
               }
               else if(i=='fwl'&& data[i]!=null){
            	
            	   
            	   for(var fwindow in data[i]){
                	   var fwindow_div=
                		' <div style="height:33.6px; margin:12px 0px;" name="canel_collection_item" >'
                		   +
                	   '<p class="text_recommand" style="display:inline;" onclick="chooseFood('
                			   +
                			   data[i][fwindow].windowId.type
                			   +
                			   ','
                			   +
                			   data[i][fwindow].windowId.windowId
                			   +
                			   ')">'
                	        +
                	        data[i][fwindow].windowId.windowName
                	        +
                	        '</p>'
                	        +
                	 '<div  name="canel_collection" onclick="canel_collection('
                			 +
                			 data[i][fwindow].windowId.type
                			 +
                			 ','
                			 +
                			 data[i][fwindow].windowId.windowId
                			 +
                			 ')">取消收藏</div>'
                			 +
                	 '</div>';
                	 
                	 $("#collection_bar").append(fwindow_div);
                	 canel_collection_item_do();
            	    } }else if(i=='fcl'&& data[i]!=null){
            	    	
            	
                 	   
                 	   for(var fcanteen in data[i]){
                 		 //console.log("name:",data[i][fcanteen].canteenId.canteenName)
                 
                     	   var fcanteen_div=
                     		 
                     		   ' <div style="height:33.6px; margin:12px 0px;" name="canel_collection_item" >'
                     		   +
                     	   '<p class="text_recommand" style="display:inline;" onclick="chooseFood('
                     			  + data[i][fcanteen].canteenId.type +
                     			   ','
                     			   +
                     			  data[i][fcanteen].canteenId.canteenId+
                     			   ')">'
                     	        + data[i][fcanteen].canteenId.canteenName+'</p>'+
                     	 '<div  name="canel_collection" onclick="canel_collection('+
                     			 data[i][fcanteen].canteenId.type+
                     			 ','+
                     			 data[i][fcanteen].canteenId.canteenId
                     			 +')">取消收藏</div>'
                     			 +
                     	 '</div>';
                     	 
                     	 $("#collection_bar").append(fcanteen_div);
                     	//console.log(fcanteen_div);
                     	canel_collection_item_do();
            	     
            	    }
            	    }
            	    else{
            	     	var n=
                  	      '<div class="circle" ><img id="smile"><p class="text_mylabel">左滑上方的列表可以收藏条目哦</p> </div>';
                  	     
                  	 	 $("#collection_bar").append(n);
                  	 	 var src='${imgpth}smile.svg';
                  	 	 $("#smile").attr('src',src);
                  	    	console.log(n);
            	    } } }
        	
        
        
        
        
        },//success 完成
        
         error: function (status) {} });
    
  
	
}












    
    
function chooseFood(type,id){

	$("#overlay").show();
	$("#model").slideDown();

	$("#overlay").click(function() {
		$("#model").slideUp();
		$("#overlay").hide();
	});
/* 	
	var type=$(obj).find("#Type").text();
	var id=$(obj).find("#Id").text(); */
	console.log("type:",type,"id:",id);
 //$.ajax返回一个XMLHttpRequest 对象
    $.ajax({    //发送地址，即目的地。
                url:"${pageContext.request.contextPath}/canteen/chooseFood/type/"+type+"/id/"+id+".do",
                type:"get",//发送方式
                //指定内容类型
                contentType:"application/json;charset=UTF-8",
                //数据类型
                dataType:"json",
                //请求成时执行的函数。
                //data为返回的对象
                success:function(data){
                	var str="";var	str_dish="";var	str_canteen="";var str_window="";
                	if(data.length!=0){
                		for(var i in data){
                			if(i=="choosen_dish"){
                				str_dish=" "+data[i].dishName+" "+"点餐";
                					
                			}
                			else if(i=="choosen_window"){
                				str_window=" "+data[i].windowName+" ";
                			}
                			else {
                				str_canteen="即将进入"+" "+data[i].canteenName+" ";
                			}
                			
                			str=str_canteen+str_window+str_dish;
                			$("#item_value").text(str);
                			
                		     
                		  }


                    }}

            },"json");
	
	
	
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

