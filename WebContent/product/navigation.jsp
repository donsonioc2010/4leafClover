<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
header .top{
	background-color: ghostwhite;
	position: relative;
	left: 0;
	padding: 0;
	width: 100%;
	height: 20px;
	padding-top: 7px;
}
header .top span{
	font-size: 12px;
	line-height: 20px;
	color: black;
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
header a {	text-decoration: none;}
header .category:hover{
	color: white;
}
header .category{
	border: none;
	outline: none;
}

</style>
</head>
<body>
<header>
<nav class="navbar navbar-dark bg-dark">
<div class="top">
	<ul class="top_bar">
		<li class="top_menu" id="login"><a href="login"><span >마이페이지</span></a></li>
		<li class="top_menu"><a href="cart"><span >총매출</span></a></li>
	</ul>
</div>

<div align="center" id="header" style="width: 100%;">
	<div style="width: 100%; height: 35px;background-color: gray ">
		<table cellpadding='3' style="position: absolute; margin-left: 35px">
			<tr>
				<td><input type="button" class="category" style="border: 0; background-color: gray;" value="거래처"></td>
				<td>|</td>
				<td><input type="button" class="category" style="border: 0; background-color: gray" value="품목 관리"></td>
				<td>|</td>
				<td><input type="button" class="category" style="border: 0; background-color: gray" value="거래 원장"></td>
				<td>|</td>
				<td><input type="button" class="category" style="border: 0; background-color: gray" value="거래 전표"></td>

			</tr>
		</table>
	</div>
</div>
</nav>
</header>
<div>

</div>

<script type="text/javascript">

</script>


</body>
</html>
