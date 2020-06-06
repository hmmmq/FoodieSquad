
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
<c:set value="${pageContext.request.contextPath}/image/loginPage/" var="imgpth" scope="page"/>
<c:set value="${pageContext.request.contextPath}/css/" var="csspth" scope="page"/>
<c:set value="${pageContext.request.contextPath}/view/" var="jsppth" scope="page"/>
<script>
$(document).ready(function(){
$('#search').click(function(){
	$.ajax({
        url: "search.do",
        type : "get",
        data : {
        },
        success : function(data){
            $(showDiv).append("<p> 数据增加成功</p>");
        },
        dataType : "text",
        error : function(data){
            $(showDiv).append("<p>出错了</p>");
        }
    });
	
});

$('#insert').click(function(){
	 $.ajax({
         url: "insert.do",
         type : "post",
         data : {
         },
         success : function(data){
             $(showDiv).append("<p> 成功："+data.msg+"</p>");
         },
         dataType : "json",
         error : function(data){
             $(showDiv).append("<p>出错了</p>");
         }
     })

	
});

});
</script>
</head>
<body>
<button id="search">Search</button><br/>
<button id="insert">Insert</button><br/>
<div id="showDiv"></div>

</body>
</html>