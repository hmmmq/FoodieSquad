<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<!-- 引入 jQuery Mobile 样式 -->
<link rel="stylesheet" href="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<!-- 引入 jQuery Mobile 库 -->
<script src="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

<div>
<div id="xxx" style="background-color:green;">
<span>这些都不重要</span> <div id="s" style="background-color:red;display:none;" onclick="success_collect();" >左滑按钮测试</div></div>
</div>

<script type="text/javascript">
$("#xxx").on("swipeleft",function(){
	console.log("swipe left");
	show_button();
	});
$("#xxx").on("swiperight",function(){
	console.log("swipe right");
	hide_button();
	});
</script>
searchBar :<input type="text" oninput="testRestful()" id="searchstr" placeholder="搜索菜名/窗口名/食堂名" list="canteensForChoose" />
		  <datalist id="canteensForChoose"></datalist>
	     <button onclick="testRestful2()">搜索</button>		
          result: <p id="result"></p>
           <br>
你选择了:<p id="item_value"></p>

<!--食堂-->
<div   style="overflow-y: scroll; height: 200px; ">

<c:if test="${dishlist!=null}">   
<div><c:forEach items="${dishlist}" var="dish">
<div style="height:33.6px;margin:12px 0px;" onclick="chooseFood(this)" >
<p class="text_recommand" style="color:red;font-size: 12px;">${dish.dishName}</p>

<span id="Id" hidden="true">${dish.dishId}</span>
<span id="Type" hidden="true">${dish.type}</span>

<br>
</div>
<div 
onclick="collection(${dish.type},${dish.dishId})">收藏</div>
<button 
onclick="collection(${dish.type},${dish.dishId})">收藏</button>
</c:forEach></div>
</c:if>   
  
 <c:if test="${windowlist!=null}"> 
<div><c:forEach items="${windowlist}" var="window">
<div style="height:33.6px;margin:12px 0px;" onclick="chooseFood(this)">
<p class="text_recommand" style="color:red;font-size: 12px;"> ${window.windowName}</p>

</div>
<button onclick="collection(${window.type},${window.windowId})">收藏</button>
</c:forEach></div>
</c:if> 

 
 <c:if test="${canteenlist!=null}"> 

 <div><c:forEach items="${canteenlist}" var="canteen">
 <div style="height:33.6px;margin:12px 0px;"  onclick="chooseFood(this)">
  <p class="text_recommand" style="color:red;font-size: 12px;">${canteen.canteenName}</p> 
</div>
<button onclick="collection(${canteen.type},${canteen.canteenId})">收藏</button>
</c:forEach></div>
</c:if>

</div>



<!-- 收藏区域 -->
<div>

你收藏了如下东西：
<c:if test="${fdl!=null}">   
<div><c:forEach items="${fdl}" var="fdish">
<div style="height:33.6px;margin:12px 0px;" onclick="chooseFood(this)" >
<p class="text_recommand" style="color:green;font-size: 12px;">${fdish.dishId.dishName}</p>

<br>
</div>
<button onclick="canel_collection(${fdish.dishId.type},${fdish.dishId.dishId})">取消收藏</button>
</c:forEach></div>
</c:if>   
  
 <c:if test="${fwl!=null}"> 
<div><c:forEach items="${fwl}" var="fwindow">
<div style="height:33.6px;margin:12px 0px;" onclick="chooseFood(this)">
<p class="text_recommand" style="color: #red;font-size: 12px;"> ${fwindow.windowId.windowName}</p>

</div>
<button onclick="canel_collection(${fwindow.windowId.type},${fwindow.windowId.windowId})">取消收藏</button>
</c:forEach></div>
</c:if> 

 
 <c:if test="${fcl!=null}"> 

 <div><c:forEach items="${fcl}" var="fcanteen">
 <div style="height:33.6px;margin:12px 0px;"  onclick="chooseFood(this)">
  <p class="text_recommand" style="color: red;font-size: 12px;">${fcanteen.canteenId.canteenName}</p> 
</div>
<button onclick="canel_collection(${fcanteen.canteenId.type},${fcanteen.canteenId.canteenId})">取消收藏</button>
</c:forEach></div>
</c:if>






</div>

</body>



<script type="text/javascript">
function success_collect(){
	alert("收藏成功！");
	$("#s").css('display','none');
}


function hide_button(){
	console.log("hide");
	$("#s").hide();
}
function show_button(){
	console.log("show");
	//$("#s").show();
	$("#s").css('display','inline');
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
                		// $("#result").empty();
                		 $("#canteensForChoose").empty();
                     	console.log(data);
                     for (var i = 0; i<4; i++) {
                              //alert(data[i]);
                              console.log(data[i]);
                            $("#canteensForChoose").append("<option>"+data[i]+"</option>");
                            
                            }}}

            },"json");}
            
            
            


function testRestful2(){
	//console.log("response-js");
    //$(#xxx)获取id为xxx元素的值
    var searchstr = $("#searchstr").val();
    window.location.href="${pageContext.request.contextPath}/canteen/testsearch2/" +searchstr+ ".do";
 
    }
    
function collection(type,id){
	//console.log("response-js");
    //$(#xxx)获取id为xxx元素的值
   /*  var type=$(obj).find("#Type").text();
	var id=$(obj).find("#Id").text(); */
	console.log("type:",type,"id:",id);
	alert("收藏成功！");
	$("#s").css('display','none');
    window.location.href="${pageContext.request.contextPath}/canteen/collection/type/"+type+"/id/"+id+".do";
  
    }
function canel_collection(type,id){
	
	
	console.log("type:",type,"id:",id);
    window.location.href="${pageContext.request.contextPath}/canteen/cancel_collection/type/"+type+"/id/"+id+".do";
	
	
	
}
function canel_collection(type,id){
	
	
	console.log("type:",type,"id:",id);
    window.location.href="${pageContext.request.contextPath}/canteen/cancel_collection/type/"+type+"/id/"+id+".do";
	
	
	
}   
    
    
function chooseFood(obj){
	
	var type=$(obj).find("#Type").text();
	var id=$(obj).find("#Id").text();
	console.log("obj:",obj,"type:",type,"id:",id);
	
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
                	var str="";
                	if(data.length!=0){
                		for(var i in data){
                			if(i=="dish"){
                				str="dishName:"+data[i].dishName;
                			}
                			else if(i=="window"){
                				str+="windwoName:"+data[i].windowName;
                			}
                			else {
                				str+="canteenName:"+data[i].canteenName;
                			}
                			$("#item_value").text(str);
                		     
                		  }


                    }}

            },"json");
	
	
	
}

            



</script>
</html>