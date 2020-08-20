<%@page import="order.orderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	request.setCharacterEncoding("utf-8");
 	String orderNum = request.getParameter("orderNum");
 	
 	orderDao dao = orderDao.getInstance();
 	boolean confirm = dao.deleteList(orderNum);
 %>
 <%if(confirm){ %>
	<script type="text/javascript">
		alert('삭제성공')
		location.href='./MainOrder.jsp'
	</script>
<%}else{%>
	<script type="text/javascript">
		alert('삭제실패')
		location.href='./MainOrder.jsp'
	</script>
<%
}
%>