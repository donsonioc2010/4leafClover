<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="orderlistbills.orderlistbillsDto"%>
<%@page import="java.util.List"%>
<%@page import="orderlistbills.orderlistbillsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

String order_date = request.getParameter("order_date");
int pageNumber = Integer.parseInt(request.getParameter("rnum"));
int seq = Integer.parseInt(request.getParameter("seq"));

orderlistbillsDao dao = orderlistbillsDao.getInstance();
List<orderlistbillsDto> list = dao.getBillsList(pageNumber, seq, order_date);
orderlistbillsDto dto = null;

 Gson jobj = new Gson();
 response.setContentType("application/json");
 out.println(jobj.toJson(list));
%>   