<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("login");
if(id==null){
	response.sendRedirect("./login/login.jsp");
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Main</title>
		<link rel="stylesheet" href="./init.css" />
	</head>
	<body>
		<%if(id!=null){ %>
			<jsp:include page="./navigation.jsp"></jsp:include>
		<%} %> 
	</body>
</html>