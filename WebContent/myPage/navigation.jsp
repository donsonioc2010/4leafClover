<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation</title>
<style type="text/css">
body {
	 margin:0px;
	 padding: 0px;
	 background-color: #E6E6E6;
}
header table,
header table tr,
header table td{
	border:0;
}
header .top{
	background-color: ghostwhite;
	position: relative;
	left: 0;
	padding: 0;
	width: 100%;
	height: 30px;
	padding-top: 4px;
}
header .top span{
	font-size: 16px;
	line-height: 20px;
	color: blue;
}
header .top span:hover{
	color: red;
}
header .top_bar{
	display: inline;
}
header .top_bar li{
	display: inline-block;
}
header .top_bar li{
	float: right;
	padding-right: 20px;
}
header a {text-decoration: none;}
header .category:hover{
	color: white;
}
header .category{
	border: none;
	outline: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<header>
	<nav>
	<div class="top">
		<ul class="top_bar">
			<li class="top_menu"><a href="/ProductManagementSystem/myPage/myPage.jsp"><span>마이페이지</span></a></li>
			<li class="top_menu"><a href="#"><span>총매출</span></a></li>
		</ul>
	</div>
	
	<div align="center" id="header" style="width: 100%;">
		<div style="width: 100%; height: 35px;background-color: gray ">
			<table cellpadding='3' style="position: absolute;margin-left: 35px">
				<tr>
					<td><input onclick='movePage(1);'type="button"class="category"style="border: 0;background-color: gray;"value="거래처"></td>
					<td>|</td>
					<td><input onclick='movePage(2);'type="button"class="category"style="border: 0;background-color: gray"value="품목 관리"></td>
					<td>|</td>
					<td><input onclick='movePage(3);'type="button"class="category"style="border: 0;background-color: gray"value="거래 원장"></td>
					<td>|</td>
					<td><input onclick='movePage(4);'type="button"class="category"style="border: 0;background-color: gray"value="거래 전표"></td>
				</tr>
			</table>
		</div>
	</div>
	</nav>
</header>
<script type="text/javascript">
function movePage(Num){
	if(Num==1){//buyerSeq
		location.href='http://'+location.host+'/ProductManagementSystem/account/account.jsp'
	}else if(Num==2){//Product
		location.href='http://'+location.host+'/ProductManagementSystem/product/product.jsp'
	}else if(Num==3){//거래원장(Mr 성보)
		location.href='http://'+location.host+'/ProductManagementSystem/#'		
	}else{//Order_List
		location.href='http://'+location.host+'/ProductManagementSystem/order/MainOrder.jsp'
	}
}
</script>
</body>
</html>
