<%@page import="myPageSeller.sellerDto"%>
<%@page import="java.util.List"%>
<%@page import="myPageSeller.sellerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%-
Object ologin = session.getAttribute("login");
sellerDto seller = null;
if(ologin == null){
	%>
	<script type="text/javascript">
	alert("로그인 해 주십시오");
	location.href = "login.jsp";
	</script>	
	<%
}
seller = (sellerDto)ologin;
%> --%>
<%

String id = (String)session.getAttribute("login");
if(id==null){
	response.sendRedirect("../login/login.jsp");
}

String companyName = request.getParameter("companyName");
String companyNumber = request.getParameter("companyNumber");
String businessCondition = request.getParameter("businessCondition");
String businessKind = request.getParameter("businessKind");
String ceo = request.getParameter("ceo");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String address3 = request.getParameter("address3");
String tel = request.getParameter("tel");
String phone = request.getParameter("phone");
String email = request.getParameter("email");

sellerDao dao = sellerDao.getInstance();
boolean dto = dao.updateSeller(new sellerDto(companyName,ceo, companyNumber, businessCondition, businessKind, address1, address2, address3, tel, phone, email), id);

if(dto == true){
	%>
	<script type="text/javascript">
	alert("수정 성공");
	location.href="./myPage.jsp";
	</script>	
<%}else{%>
	<script type="text/javascript">
	alert("수정 실패");
	location.href="./myPage.jsp";
	</script>
<%}%>

