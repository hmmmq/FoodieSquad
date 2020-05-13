<%-- 
    Document   : ChooesFoodPage
    Created on : 2019-12-18, 20:01:03
    Author     : hmqhmq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<link rel="stylesheet" type="text/css" href="cssForChooseFoodPage.css" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function(){
$("#canteeninfo").html("海南大学第五食堂");
$("#d7_s2").click(function(){
var i=1;
var rs=new Array();
$(".cashName").each(function(){
var num=$("#cashnum"+i).text();
num=parseInt(num);
if(num>0)
{
rs.push($(this).text());
rs.push(num);
}
i++;
});
var totalp=$("#totalPrice").text();
alert(rs+"\nTotal Price: "+$("#totalPrice").text());
var str = rs.join(',');
// $.post('/FOODIESQUAD/ChooseFoodServlet',{'menu':rs,'totalPrice':totalp});
 window.location.href="/FOODIESQUAD/ChooseFoodServlet?menu="+rs+"&totalPrice="+totalp;
});
});
</script>
</head>
<body>
<!--容器-->
<div class="container">
<!--顶部页面属性与后退-->
<div class="headingBox" >
<!--后退按钮-->
<div class="backButtonBox">
<img src="backbutton.SVG" id="backbtn" class="backButtonSize"
     onclick="window.location.href='/FOODIESQUAD/CanteenServlet'"/>
</div>
<!--食堂信息-->
<div class="canteenInfoBox">
<div class="canteenInfoTextBox">
<p id="canteeninfo" class="canteenInfoText">海南大学第五食堂</p>
<label for="canteeninfo" class="canteenTextReconmmendText">推荐：五谷鱼粉，麻辣香锅</label>
</div>
</div>
</div>

<!--吃货头条-->
<div class="foodieHeadingBox">
<img src="foodieheadingimg.png" id="foodieheading" class="foodieHeadingSize"/>
</div>
<!--点菜垂直分栏-->
<div class="orderSubfieldBox">
<!--左侧餐点栏-->
<div class="tab">
  <button  class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">麻辣香锅</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">楚香韵味</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">五味鱼粉</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">川香家常菜</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">包你满意<br/>重庆小面</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">万宁后安粉汤</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">海南风味</button>
  <button class="tablinks" onclick="openCity(event, 'Tokyo')">韩国料理</button>
</div>
<!--右侧菜品栏-->
<div id="London" class="tabcontent">
<p class="tittle">麻辣香锅</p>
<!--单个菜肴-->
<div class="cash">
<table>
<tr height="40%">
<td rowspan="2" width="35%">
<!--菜肴图片-->
<img src="dishpic.svg" class="cashimg"/>
</td>
<!--菜肴名称-->
<td colspan="2" width="50%"><p  class="cashName">澳洲肥牛【50g】</p></td>
</tr>
<tr height="60%">
<!--菜肴单价和数量-->
<td width="30%" style="align:left;"><label  class="price"><small>¥ </small><span id="price1">2.99</span></label></td>
<td width="70%"><img  src="minusbutton.svg" onclick="minus('cashnum1','price1')"/> &nbsp <label id="cashnum1" class="number">0</label> &nbsp <img onclick="plus('cashnum1','price1')" src="plusbutton.png"/></td>
</tr>
</tr>
</table>  
</div>
<!--第二个-->
<div class="cash">
<table>
<tr height="40%">
<td rowspan="2" width="35%">
<!--菜肴图片-->
<img src="dishpic.svg" class="cashimg"/>
</td>
<!--菜肴名称-->
<td colspan="2" width="50%"><p class="cashName">方便面【250g】</p></td>
</tr>
<tr height="60%">
<!--菜肴单价和数量-->
<td width="30%" style="align:left;"><label class="price"><small>¥ </small><span id="price2">2.49</span></label></td>
<td width="70%"><img src="minusbutton.svg" onclick="minus('cashnum2','price2')"/> &nbsp <label id="cashnum2" class="number">0</label> &nbsp <img onclick="plus('cashnum2','price2')" src="plusbutton.png"/></td>
</tr>
</tr>
</table>  
</div>
<!--第二个-->
<div class="cash">
<table>
<tr height="40%">
<td rowspan="2" width="35%">
<!--菜肴图片-->
<img src="dishpic.svg" class="cashimg"/>
</td>
<!--菜肴名称-->
<td colspan="2" width="50%"><p class="cashName">娃娃菜【60g】</p></td>
</tr>
<tr height="60%">
<!--菜肴单价和数量-->
<td width="30%" style="align:left;"><label class="price"><small>¥ </small><span id="price3">1.99</span></label></td>
<td width="70%"><img src="minusbutton.svg" onclick="minus('cashnum3','price3')"/> &nbsp <label id="cashnum3" class="number">0</label> &nbsp <img onclick="plus('cashnum3','price3')" src="plusbutton.png"/></td>
</tr>
</tr>
</table>  
</div>
</div>
<div id="Paris" class="tabcontent">
  <h3>Paris</h3>
  <p>Paris is the capital of France.</p> 
</div>

<div id="Tokyo" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>
</div>
<!--结算栏-->
<div class="settleAccountBox">
<div id="d7">
        <img id="d7_i1" src="money.svg">
        <span id="d7_s1">¥ <span id="totalPrice">0</span></span>
        <span id="d7_s2">去结算</span>
        <img id="d7_i2" src="moveon.svg">
</div>
</div>
</div>
<script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
function plus(name,price){
	var lab=document.getElementById(name);
	var num=parseInt(lab.innerHTML);
	num+=1;
	lab.innerHTML=""+num;
	var total=document.getElementById("totalPrice").innerHTML;
	var addprice=document.getElementById(price).innerHTML;
	var newTotal=eval(total+"+"+addprice);
	newTotal = newTotal.toFixed(2);
	document.getElementById("totalPrice").innerHTML=newTotal;
}
function minus(name,price){
	var lab=document.getElementById(name);
	var num=parseInt(lab.innerHTML);
	num-=1;
	lab.innerHTML=""+num;
		var total=document.getElementById("totalPrice").innerHTML;
	var addprice=document.getElementById(price).innerHTML;
	var newTotal=eval(total+"-"+addprice);
	newTotal = newTotal.toFixed(2);
	document.getElementById("totalPrice").innerHTML=newTotal;
}
// 触发 id="defaultOpen" click 事件
document.getElementById("defaultOpen").click();
</script>
</body>
</html>