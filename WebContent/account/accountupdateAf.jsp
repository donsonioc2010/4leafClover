<%@page import="buyer.BuyerDto"%>
<%@page import="buyer.BuyerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int buyerSeq = Integer.parseInt(request.getParameter("updateBuyerSeq"));
	String companyname = request.getParameter("companyname");
	String ceoname = request.getParameter("ceoname");
	String condition = request.getParameter("condition");
	String kinds = request.getParameter("kinds");
	String companynum = request.getParameter("companynum");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String admin = request.getParameter("admin");
	String email = request.getParameter("email");
	String telnum = request.getParameter("telnum");
	String memo = request.getParameter("memo");
	String homepage = request.getParameter("homepage");
	
	BuyerDao dao = BuyerDao.getInstance();
	boolean confirm = dao.updateaccount(
			new BuyerDto(
					companyname,ceoname,condition,
					kinds,companynum,address1,address2,address3,admin,email,telnum,
					memo,homepage),buyerSeq
			);  
	
	
	if(confirm){
%>
		<script type="text/javascript">
			alert("수정 성공");
			location.href = "./account.jsp";
		</script>	
	<%}else{%>
		<script type="text/javascript">
		alert("수정 실패");
		location.href = "./account.jsp";
		</script>
	<%}%>