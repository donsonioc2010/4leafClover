<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";
	if(session.getAttribute("login")==null){
		response.sendRedirect("../login/login.jsp");
	}else{
		id = (String)session.getAttribute("login");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../init.css"/>
<link rel="stylesheet" href="./introduction.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(id!=null){ %>
		<jsp:include page="../navigation.jsp"></jsp:include>
	<%} %>
<div id="intro">
	<img src="../image/introduction.jpg">
</div>

</body>
</html>