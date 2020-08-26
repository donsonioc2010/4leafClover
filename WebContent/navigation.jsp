<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	header{
		width:100%;
	}
	header #header #nav_UnderBar table{
		position: absolute;
		margin-left: 35px;
	}
	header #header #nav_UnderBar table,
	header #header #nav_UnderBar table tr,
	header #header #nav_UnderBar table td{
		border:0;
	}
	header #header #nav_UnderBar table td{
		padding:8px;
		padding-bottom:0px;
	}
	header #header #nav_UnderBar table td input{
		background-color: white;
	}
	header .top{
  		background-color: white;  
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
		color: black;
	}
	header .top span:hover{
		color: lightgray;
	}
	header .top_bar{
		display: inline;
	}
	header .top_bar li{
		display: inline-block;
		float: right;
		padding-right: 20px;
	}
	header .top .top_bar a {text-decoration: none;}
	header #header .category:hover{
		color: lightgray;
	}
	header #header .category{
		border: none;
		outline: none;
		font-size: 16px;
	}
	 a .logo{
		padding-left:10px;
		width:100px;
		height:40px;
	}
	header #header{
		width: 100%;
	}
	header #header #nav_UnderBar{
		width: 100%; 
		height: 65px;
		background-color: white;
		border-top: 2px solid darkgray;
		border-bottom: 2px solid darkgray;
	}

	
</style>
</head>
	<body>
		<header>
			<nav>
			<div class="top">	
				<ul class="top_bar">
					<li class="top_menu"><a href="/ProductManagementSystem/login/logout.jsp"><span>로그아웃</span></a></li>
					<li class="top_menu"><a href="/ProductManagementSystem/myPage/myPage.jsp"><span>마이페이지</span></a></li>
					<li class="top_menu"><a href="/ProductManagementSystem/total/total.jsp"><span>총매출</span></a></li>
				</ul>
			</div>
			
			<div align="center" id="header" >
				<div id='nav_UnderBar'>
					<table >
						<tbody>
							<tr>
								<td>
								<a href='/ProductManagementSystem/index.jsp'>
								<img src="/ProductManagementSystem/image/logo.png"class='logo'>
								</a></td>
								<td><input onclick="movePage(1);" type="button" class="category" value="거래처"></td>
								<td>|</td>
								<td><input onclick="movePage(2);" type="button" class="category" value="품목 관리"></td>
								<td>|</td>
								<td><input onclick="movePage(3);" type="button" class="category" value="거래 원장"></td>
								<td>|</td>
								<td><input onclick="movePage(4);" type="button" class="category" value="거래 전표"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</nav>
		</header>
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
