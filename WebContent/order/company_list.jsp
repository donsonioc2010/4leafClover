<%@page import="buyer.BuyerDto"%>
<%@page import="java.util.List"%>
<%@page import="buyer.BuyerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";
	if(session.getAttribute("login")==null){
		response.sendRedirect("../login/login.jsp");
	}else{
		id = (String)session.getAttribute("login");
	}
	
	BuyerDao dao = BuyerDao.getInstance();
	List<BuyerDto>list = dao.getBuyerListThreeInfo(id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>companyList</title>
	<link rel="stylesheet" href="../init.css">
	<link rel="stylesheet" href="./order.css">
</head>

<body>
	<!-- 검색기능 미구현 -->
	<select>
			<option value="">전체</option>
			<option value="">거래처명</option>
			<option value="">대표자</option>
			<option value="">사업자 번호</option>
			<option value="">전화번호</option>
	</select> 
	<input type="text" name="" onkeypress="enterKey();" > 
	<input type="button" value="검색" onclick="SearchCompany();">
	
	
	<input type="button" value="완료" id="CompanySendBtn" name="sendBtn" onclick="SendCompanyInfo();">

	<br><br>

	<div class="popup_LeftBox">
		<table>
			<col width="50">
			<col width="300">
			<col width="150">
			<tr>
				<th align="center">선택</th>
				<th align="center">거래처명</th>
				<th align="center">대표자</th>
			</tr>
			<%
				if(list == null || list.size() == 0){
			%>
			<tr>
				<td colspan="3" align="center">거래처목록이 없습니다</td>
			</tr>
			<%
				}else{
					for(int i = 0; i < list.size(); i++){
						BuyerDto dto = list.get(i);
			%>
			<tr>
				<th>
					<input type="radio" name="chkBox" value="<%=dto.getBuyer_seq() %>">
					<input type="hidden" name="<%=dto.getBuyer_seq() %>" value="<%=dto.getBuyer_company_num() %>">
					<input type="hidden" name="<%=dto.getBuyer_seq() %>" value="<%=dto.getBuyer_tel_num() %>">
				</th>
				<td><span name="<%=dto.getBuyer_seq() %>"><%=dto.getBuyer_company_name() %></span> </td>
				<td><span name="<%=dto.getBuyer_seq() %>">	<%=dto.getBuyer_ceo()%></span> </td>
			</tr>
			<% 
					}
				}
			%>
		</table>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="./order.js"></script>
</body>
</html>




