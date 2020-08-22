<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("login");
%>
<script type="text/javascript">
	alert('정상적으로 로그인이 완료되었습니다')
	location.href='./login.jsp'
</script>