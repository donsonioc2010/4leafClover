<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tradeBook.clienthistoryDto"%>
<%@page import="java.util.List"%>
<%@page import="tradeBook.clienthistoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	String searchWord = request.getParameter("search");
	clienthistoryDao dao = clienthistoryDao.getInstance();	
	List<clienthistoryDto> list = new ArrayList<clienthistoryDto>();
	list = dao.getclienttradeSearch("test1",seq,searchWord);
	Gson Jobj = new Gson();
	
	out.print(Jobj.toJson(list));
%>