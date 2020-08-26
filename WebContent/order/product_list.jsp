<%@page import="product.productDto"%>
<%@page import="product.productDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = null;
int inputNum=-1;
List<productDto> list =null;
if(session.getAttribute("login")==null){
	response.sendRedirect("../login/login.jsp");
}else{
	id = (String)session.getAttribute("login");
	productDao dao = productDao.getInstance();
	list = dao.getAllProductList(id);
	inputNum = Integer.parseInt(request.getParameter("inputNum"));
}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품목록</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href="../init.css">
		<link rel="stylesheet" href="./order.css">
	</head>
	
	<body>
		<div align="left">
			<input type="text"id="searchProductWord"onkeypress='enterSearchProduct();' > 
			<input type="button" name="product_Search"id='searchProductBtn'value="상품명검색">
			<input type="button" value="전달하기"id='sendBtn'name="sendBtn" onclick="SendProductInfo(<%=inputNum%>);">
		</div>

		<br>
		
		<div class="popup_LeftBox">
			<table >
				<tr>
					<th align="center">선택</th>
					<th align="center">품목명</th>
					<!-- <th align="center">수량</th>  -->
					<th align="center">도매가</th>
					<th align="center">규격</th>
				</tr>
				<tbody id='productList'>
				<%
					if(list == null || list.size() == 0){
				%>
					<tr>
						<td colspan="4" align="center">거래처목록이 없습니다</td>
					</tr>
				<%}else{
						for(int i = 0; i < list.size(); i++){
							productDto dto = list.get(i);%>
						<tr>
							<th><input type="radio" name="chkBox"  value="<%=dto.getProductSeq() %>"></th>
							<td><span name="productName"> <%=dto.getProductName() %> </span></td>
							<!-- <td><span name="<%=dto.getProductSeq()%>"> <%=dto.getProductUnit()%></span></td>  -->
							<td><span name="productSupply"> <%=dto.getProductTradePrice() %></span></td>
							<td><span name="productStandard"> <%=dto.getProductStandard() %></span></td>
						</tr>
				<% 		}
					}%>
				</tbody>
			</table>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="./order.js"></script>
	</body>
</html>