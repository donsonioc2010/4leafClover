<%@page import="java.util.List"%>
<%@page import="product.productDto"%>
<%@page import="product.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String id = (String)session.getAttribute("login");
if(id==null){
	response.sendRedirect("../login/login.jsp");
}
productDao dao = productDao.getInstance();
productDto dto = new productDto();
List<String> sortList = dao.getProductSortType();
List<String> unitList = dao.getProductUnitType();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>AddProduct</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="../init.css" />
	<link rel="stylesheet" href = "./productCss.css" />
</head>
<body>
	<form action="productAddAf.jsp" method="post">
	<!-- 이쁘게꾸며주세요bb -->
	<div class="PlasePrettyCss">
		<table id='addProductTable'>
			<thead>
				<tr>
					<th colspan='2'>
						물품 추가
					</th>
				</tr>
			</thead>
			<tbody>
				<col width='200px'>
				<col width='300px'>
				<tr>
					<th>품목명</th>
					<td><input type='text'id='productName'name='productName'></td>
				</tr>
				<tr>
					<th>상품종류</th>
					<td>
						<select id="saveSelectSort"name='saveSelectSort'>
			   			<%for(int i = 0; i < sortList.size(); i++){%>
			   	      		<option value='<%=sortList.get(i) %>'><%=sortList.get(i) %></option>
						<%}%>
		      			</select>
					</td>
				</tr>
				<tr>
					<th>단위</th>
					<td>
						<select id="productUnit"name='productUnit'style='text-align-last:center'>
						<%for(int i =0; i<unitList.size(); i++){ %>
							<option value='<%=unitList.get(i)%>'><%=unitList.get(i)%></option>
						<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th>도매가</th>
					<td><input type='number'id='productTradePrice'name='productTradePrice'min='0'step='10'></td>
				</tr>
				<tr>
					<th>박스당 낱개</th>
					<td><input type='number'id='productPieceBox'name='productPieceBox'min='0'step='1'> 개</td>
				</tr>
				<tr>
					<th>상품규격</th>
					<td><input type='number'id='productStandard'name='productStandard'min='0'step='1'> ml</td>
				</tr>
			</tbody>
			<tr>
				<table id="buttonTable">
				<col width='250px'>
				<col width='250px'>
					<tr>
						<td >
							<input type='button'id='insertProduct'value='등록'style='width:100%'>
						</td>
						<td >
							<input type='button'id='popExitBtn'value='종료'style='width:100%'>
						</td>
					</tr>
				</table>
			</tr>
		</table>
	</div>
	</form>
	<script src="./product.js"></script>
</body>
</html>