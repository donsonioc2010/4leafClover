<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="Seller.sellerDto"%>
<%@page import="Seller.sellerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("userid");
	String pw = request.getParameter("password");
	sellerDao dao = sellerDao.getInstance();
	boolean loginConfirm = dao.sellerLogin(new sellerDto(id,pw));
	
	JsonObject jobj = new JsonObject();
	jobj.addProperty("result", loginConfirm);
	response.setContentType("application/json");
	out.print(jobj.toString());

%>
<%--
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if(loginConfirm){
		//로그인성공
		session.setAttribute("login", id);
		session.setMaxInactiveInterval(3600);
		%>
		 <script type="text/javascript">
			 alert("로그인성공")
			 location.href = "../index.jsp";
		 </script>
		 <%
	}else{
		 %>
		 <script type="text/javascript">
			 alert("로그인실패")
			 location.href = "./login.jsp";
		 </script>
		 <%
	 }
	 %>
</body>
</html>
 --%>