<%@page import="buyer.BuyerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8") ;%>
<%
String id = null;
if(session.getAttribute("login")==null){
	response.sendRedirect("./login/login.jsp");
}else{
	id = (String)session.getAttribute("login");
}
String companyName = request.getParameter("company");

BuyerDao dao = BuyerDao.getInstance();
boolean isS = dao.accountdel(id, companyName);

 if(isS){
%>
	<script>
		alert("거래처가 삭제되었습니다");
	</script>
<%}else{%><script>
	alert("삭제 되지 않았습니다 다시 눌러주세요 ");
	</script>
<%}%>

<%if (isS){ %>
	<script>
	  parent.ifun();
	</script>
<%}%>
