<%@page import="com.google.gson.JsonObject"%>
<%@page import="orderlistbills.orderlistbillsDao"%>
<%@page import="order.orderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String ordernum = request.getParameter("orderNum");
	int seq = Integer.parseInt(request.getParameter("seq"));
	orderlistbillsDao dao = orderlistbillsDao.getInstance();
	boolean confirm = dao.confirmId(ordernum, seq);
	
	System.out.println("confirm" + confirm);
	
	JsonObject jobj = new JsonObject();
	jobj.addProperty("result", confirm);
	response.setContentType("application/json");
	out.print(jobj.toString());
	
%>