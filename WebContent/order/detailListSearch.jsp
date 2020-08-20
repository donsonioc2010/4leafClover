<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="order.detailDto"%>
<%@page import="java.util.List"%>
<%@page import="order.orderDao"%>
<%@page import="order.orderDto"%>
<%@page import="util.UtilEx"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//BuyerSeq와 날짜(YYYYMMDD)로 모든 Sequence 찾기 BuyerSeq가 비어있으면 일로 오지못한다.
	
	//1. 인코딩
	request.setCharacterEncoding("utf-8");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");	
	String searchDate = year+UtilEx.two(month)+UtilEx.two(day);
	
	orderDto dto = new orderDto();
	dto.setOrderDate(searchDate);
	dto.setBuyerSeq(Integer.parseInt(request.getParameter("buyerSeq")));
	
	orderDao dao = orderDao.getInstance();
	List<Object> list = dao.getDetailList(dto);
	
	//SendJson
	Gson jobj = new Gson();
	response.setContentType("application/json");
	out.print(jobj.toJson(list));
%>