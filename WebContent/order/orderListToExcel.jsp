<%@page import="order.excelDao"%>
<%@page import="order.excelDto"%>
<%@page import="java.util.List"%>
<%@page import="order.orderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";
	if(session.getAttribute("login")==null){
		response.sendRedirect("../login/login.jsp");
	}else{
		id = (String)session.getAttribute("login");
	}
	request.setCharacterEncoding("utf-8");
	String buyerSeq = "66";//request.getParameter("buyerSeq");
	String orderDate = "20200824";//request.getParameter("orderDate");
	
	
	orderDao dao = orderDao.getInstance();
	List<excelDto> list =  dao.getExcelData(buyerSeq, orderDate);
	excelDao excel = new excelDao();
	excel.writeToExcel(list, buyerSeq, id);
	
%>