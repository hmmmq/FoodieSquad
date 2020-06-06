<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
</head>
<body>

searchBar :<input type="text" oninput="testRestful()" id="searchstr" placeholder="搜索菜名/窗口名/食堂名" list="canteensForChoose" />
		<datalist id="canteensForChoose"></datalist>
	<button onclick="testRestful2()">搜索</button>		
result: <p id="result"></p>


<!--食堂-->
<div   style="overflow-y: scroll; height: 200px; ">

<c:if test="${dishlist!=null}">   
dishlist!=null
<div><c:forEach items="${dishlist}" var="dish"><div><label>dish.dishName：${dish.dishName}</label> </div></c:forEach></div>
</c:if>   
  
 <c:if test="${windowlist!=null}"> 
 windowlist!=null
 <div><!--标签：附近--><c:forEach items="${windowlist}" var="window"><div>window.windowName：${window.windowName}</div></c:forEach></div>
</c:if>  
 <c:if test="${canteenlist!=null}"> 
 canteenlist!=null
 <div><!--标签：附近--><c:forEach items="${canteenlist}" var="canteen">
 <div>${canteen.canteenName} ${canteen.canteenName} ${canteen.canteenId}</div></c:forEach></div>
</c:if>
</div>



</body>



<script type="text/javascript">


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
                		 $("#result").empty();
                     	console.log(data);
                     for (var i = 0; i <data.length; i++) {
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

            



</script>
</html>