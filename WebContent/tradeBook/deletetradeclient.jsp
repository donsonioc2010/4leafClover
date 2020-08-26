<%@page import="buyer.BuyerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8") ;%>
<%
String id = (String)session.getAttribute("login");
if(id==null){
	response.sendRedirect("./login/login.jsp");
}
String companyName = request.getParameter("companyName");
System.out.println(companyName);
BuyerDao dao = BuyerDao.getInstance();
boolean isS = dao.accountdel(id, companyName);

 if(isS){%>
	<script>
	alert("거래처가 삭제되었습니다");
	location.href='./tradeBooks.jsp'
	</script>
<%}else{%><script>
	alert("삭제 되지 않았습니다 다시 눌러주세요 ");
	location.href='./tradeBooks.jsp'
	</script>
<%}%>
