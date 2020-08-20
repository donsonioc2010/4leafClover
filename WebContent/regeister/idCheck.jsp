
<%@page import="com.google.gson.JsonObject"%>
<%@page import="Seller.sellerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	sellerDao dao = sellerDao.getInstance();
	boolean confirm = dao.confirmId(id);
	
	JsonObject jobj = new JsonObject();
	jobj.addProperty("result", confirm);
	response.setContentType("application/json");
	out.print(jobj.toString());
 %>