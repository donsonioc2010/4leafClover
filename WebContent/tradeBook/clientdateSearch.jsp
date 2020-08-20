<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tradeBook.clienthistoryDto"%>
<%@page import="java.util.List"%>
<%@page import="tradeBook.clienthistoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int seq = Integer.parseInt(request.getParameter("seq"));
	String date = request.getParameter("date");
	String date1 = request.getParameter("date1");
	String date2 = request.getParameter("date2");
	String term = request.getParameter("term");
	
	clienthistoryDao dao = clienthistoryDao.getInstance();
	List<clienthistoryDto> list =new ArrayList<clienthistoryDto>();
	
	if(term.equals("true")){
	list = dao.getclienttradedateSearch("test1",seq,false,date1,date2);
	}else{
	list = dao.getclienttradedateSearch("test1",seq,true,date,"");
	}
	
	Gson Jobj=new Gson();
	out.print(Jobj.toJson(list));
%>