<%@page import="order.orderDao"%>
<%@page import="order.orderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	orderDto order = new orderDto();

	order.setOrderNum(request.getParameter("orderNum"));
	order.setOrderCollectMoney(Integer.parseInt(request.getParameter("CollectMoney")));
	order.setOrderNotCollectMoney(Integer.parseInt(request.getParameter("notCollectMoney")));

	orderDao dao = orderDao.getInstance();
	
	boolean confirm = dao.updateOrder(order);
%>

<%if(confirm){ %>
	<script type="text/javascript">
		alert('수정성공')
		location.href='./MainOrder.jsp'
	</script>
<%}else{%>
	<script type="text/javascript">
		alert('실패')
		location.href='./MainOrder.jsp'
	</script>
<%
}
%>