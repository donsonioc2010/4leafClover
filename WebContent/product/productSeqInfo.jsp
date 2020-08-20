<%@page import="product.productDto"%>
<%@page import="java.util.List"%>
<%@page import="product.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("login");
	if(id==null){
		response.sendRedirect("../login/login.jsp");
	}
	String strSeq = request.getParameter("productSeq");
	productDao dao = productDao.getInstance();
	List<String> unitList = dao.getProductUnitType();
	List<String> sortList = dao.getProductSortType();
	int standard = 0;
	productDto dto = dao.getProductInfoBySeq(Integer.parseInt(strSeq));
	String strStandard = dto.getProductStandard();
	
	if(strStandard==null||strStandard.equals("")||strStandard.equals("ml")){
		
	}else{
		strStandard = strStandard.substring(0,strStandard.length()-2);
		standard = Integer.parseInt(strStandard);
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>popProductInfo</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href="../init.css" />
		<link rel="stylesheet" href = "./productCss.css" />
	</head>
	<body>
		<form action='./productUpdate.jsp'method='POST'>
		<table id="InfoTable">
				<col width='200px'>
				<col width='400px'>
				<thead>
					<tr>
						<th colspan='2'>
							물품 수정 / 삭제
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>상품번호</th>
						<td><input type='text'class='no-write'id='productNum'name='productNum'value='<%=dto.getProductSeq() %>'readonly></td>
					</tr>
					<tr>
						<th>품목명</th>
						<td><input type='text'id='productName'value='<%=dto.getProductName()%>'name='productName'></td>
					</tr>
					<tr>
						<th>상품종류</th>
						<td>
							<select id="saveSelectSort"name='saveSelectSort'>
				   			<%for(int i = 0; i < sortList.size(); i++){
				   				if(sortList.get(i).equals(dto.getProductSort())){%>
				   					<option value='<%=sortList.get(i) %>'selected><%=sortList.get(i) %></option>
				   				<%}else{ %>
				   					<option value='<%=sortList.get(i) %>'><%=sortList.get(i) %></option>
								<%}
							}%>
			      			</select>
						</td>
					</tr>
					<tr>
						<th>단위</th>
						<td>
							<select id="productUnit"name='productUnit'style='text-align-last:center'>
							<%for(int i =0; i<unitList.size(); i++){ 
								if(unitList.get(i).equals(dto.getProductUnit())){%>
									<option value='<%=unitList.get(i)%>'selected><%=unitList.get(i)%></option>
								<%}else{ %>
									<option value='<%=unitList.get(i)%>'><%=unitList.get(i)%></option>
								<%}
							}%>
							</select>
						</td>
					</tr>
					<tr>
						<th>도매가</th>
						<td><input type='number'id='productTradePrice'value='<%=dto.getProductTradePrice() %>'name='productTradePrice'min='0'step='10'></td>
					</tr>
					<tr>
						<th>박스당 낱개</th>
						<td><input type='number'id='productPieceBox'value='<%=dto.getProductPieceBox() %>'name='productPieceBox'min='0'step='1'></td>
					</tr>
					<tr>
						<th>상품규격</th>
						<td><input type='number'id='productStandard'value='<%=standard%>'name='productStandard'min='0'step='1'style="width:90%">ml</td>
					</tr>
				</tbody>
				<tr >
					<td colspan='2' style='padding:0;'>
						<table>
							<col width='300px'><col width='300px'>
							<tr>
								<td><button type='button'id="ProductUpdateBtn"style="width:100%">수정</button></td>
			      				<td><button type='button'id="deleteBtn"style="width:100%">삭제</button></td>
							</tr>
							<tr>
								<th colspan='2'>
									<button type='button'id="popExitBtn"style="width:100%">삭제</button>
								</th>
							</tr>
						</table>
					</td>
				</tr>
		   </table>
		   </form>
			<script src="product.js"></script>
	</body>
</html>