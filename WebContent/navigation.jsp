<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
	header .top .top_bar a {text-decoration: none;}
	#header .category :hover{
		color: white;
	}
	header .category{
		border: none;
		outline: none;
	}
	header .top a .logo{
		padding-left:10px;
		width:100px;
		height:30px;
	}
</style>
</head>
<body>
<header>
	<nav>
	<div class="top">
		<a href='/ProductManagementSystem/index.jsp'>
			<img src="/ProductManagementSystem/image/logo.png"class='logo'>
		</a>
		<ul class="top_bar">
			<li class="top_menu"><a href="/ProductManagementSystem/login/logout.jsp"><span>로그아웃</span></a></li>
			<li class="top_menu"><a href="/ProductManagementSystem/myPage/myPage.jsp"><span>마이페이지</span></a></li>
			<li class="top_menu"><a href="/ProductManagementSystem/total/total.jsp"><span>총매출</span></a></li>
		</ul>
	</div>
	
	<div align="center" id="header" style="width: 100%;">
		<div style="width: 100%; height: 35px;background-color: gray ">
			<table cellpadding="3" style="position: absolute;margin-left: 35px">
				<tbody><tr>
					<td><input onclick="movePage(1);" type="button" class="category" style="border: 0;background-color: gray;" value="거래처"></td>
					<td>|</td>
					<td><input onclick="movePage(2);" type="button" class="category" style="border: 0;background-color: gray" value="품목 관리"></td>
					<td>|</td>
					<td><input onclick="movePage(3);" type="button" class="category" style="border: 0;background-color: gray" value="거래 원장"></td>
					<td>|</td>
					<td><input onclick="movePage(4);" type="button" class="category" style="border: 0;background-color: gray" value="거래 전표"></td>
				</tr>
			</tbody>
			</table>
		</div>
	</div>
	</nav>
</header>
<div>
</div>
<script type="text/javascript">
function movePage(Num){
	if(Num==1){
		location.href = 'http://'+location.host + '/ProductManagementSystem/account/account.jsp'
	}else if(Num==2){
		location.href = 'http://'+location.host + '/ProductManagementSystem/product/product.jsp'
	}else if(Num==3){
		location.href = 'http://'+location.host+'/ProductManagementSystem/tradeBook/tradeBooks.jsp'
	}else{
		location.href = 'http://'+location.host + '/ProductManagementSystem/order/MainOrder.jsp'
	}
}
</script>


</body>
</html>
