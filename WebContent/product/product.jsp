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
	List<productDto> productList = dao.getAllProductList();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>productManageMent</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href = "../init.css" />	
		<link rel="stylesheet" href = "./productCss.css" />
	</head>
	
	<body>
	<%if(id!=null){ %>
		<jsp:include page="../navigation.jsp"></jsp:include>
	<%} %>
	<div class='productWrap2'>
	<div class="shadow">
		<div class='productWrap1'>
			<form action='' id='productForm'>
			   <table id='productTotalTable'>
					<tr>
						<td id='searchBar'>
				            <select id='searchType'>
				               <option value='productName'>품목명</option>	
				               <option value='productSort'>종류</option>
				            </select>
							검색 : <input type='text'id='searchWord'>		<!-- 검색하는 텍스트 박스 -->
				            <input type='button'id='searchBtn'value='검색'>
		  					<button type='button'id="addProductbtn">상품추가</button>
				   		</td>
				   </tr>
				   <tr>
				      <td>
				         <table id="productListTable">
				         	<col width='50px'><col width='400px'><col width='150px'>
				               <thead>
				                  	<tr>
				                  		<th>상품번호</th>
				                  		<th>품목명</th>
				                  		<th>종류</th>
				                  	</tr>	
				               </thead>
				               
				               <tbody>
				               		<%
									for(int i = 0; i <productList.size(); i++){
									%>
							            <tr >
							            	<td ><%=productList.get(i).getProductSeq() %></td>
							        		<td><%=productList.get(i).getProductName() %></td>
							        		<td><%=productList.get(i).getProductSort() %></td>
						              	</tr>
					              	<%
									}
					              	%>
				               </tbody>
				         </table>
				      </td> 
				   </tr>
			   </table>
			</form>
		</div>
	</div>	
	</div>
		<script src="./product.js"></script>
	</body>
</html>