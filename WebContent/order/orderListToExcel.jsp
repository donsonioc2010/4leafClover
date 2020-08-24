
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.ss.usermodel.DataValidationConstraint"%>
<%@page import="org.apache.poi.ss.usermodel.DataValidation"%>
<%@page import="java.io.OutputStream"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="order.excelDao"%>
<%@page import="order.excelDto"%>
<%@page import="java.util.List"%>
<%@page import="order.orderDao"%>
<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8" pageEncoding="UTF-8"%>

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
	//String filePath = excel.writeToExcel(list, buyerSeq, id);

	//워크북 생성
			XSSFWorkbook workbook= new XSSFWorkbook();
			//시트생성
			XSSFSheet sheet = workbook.createSheet();
			//셀 생성
			XSSFCell cell;
			
			//헤더 정보 OrderList 작성
			//첫번째줄~
			//행생성
			XSSFRow row = sheet.createRow(0);
			cell = row.createCell(0);
			cell.setCellValue("공급가액");
			cell = row.createCell(1);
			cell.setCellValue(list.get(0).getListSupplyPrice());
			
			cell = row.createCell(2);
			
			cell = row.createCell(3);
			cell.setCellValue("판매처");
			cell = row.createCell(4);
			cell.setCellValue(list.get(0).getBuyerCompanyName());
			
			cell = row.createCell(5);
			
			cell = row.createCell(6);
			cell.setCellValue("판매일");
			cell = row.createCell(7);
			cell.setCellValue(list.get(0).getOrderDate());
			
			//두번째줄~
			row = sheet.createRow(1);
			cell = row.createCell(0);
			cell.setCellValue("총세금");
			cell = row.createCell(1);
			cell.setCellValue(list.get(0).getListTaxValue());
			
			//세번째줄
			row = sheet.createRow(2);
			cell = row.createCell(0);
			cell.setCellValue("총판매액");
			cell = row.createCell(1);
			cell.setCellValue(list.get(0).getListTotal());
			
			cell = row.createCell(2);
			
			cell = row.createCell(3);
			cell.setCellValue("판매자");
			cell = row.createCell(4);
			cell.setCellValue(list.get(0).getSellerId());
			
			cell = row.createCell(5);
			
			cell = row.createCell(6);
			cell.setCellValue("주문번호");
			cell = row.createCell(7);
			cell.setCellValue(list.get(0).getOrderNum());
			
			row = sheet.createRow(3);
			
			//다섯번쨰줄 (헤더)
			row = sheet.createRow(4);
			cell = row.createCell(0);
			cell.setCellValue("상품번호");
			cell = row.createCell(1);
			cell.setCellValue("상품명");
			cell = row.createCell(2);
			cell.setCellValue("상품종류");
			cell = row.createCell(3);
			cell.setCellValue("구매수량");
			cell = row.createCell(4);
			cell.setCellValue("공급가");
			cell = row.createCell(5);
			cell.setCellValue("세금");
			cell = row.createCell(6);
			cell.setCellValue("물품총금액");
			for(int i =0; i<list.size();i++) {
				excelDto dto = list.get(i);
				
				row = sheet.createRow(i+5);
				
				cell = row.createCell(0);
				cell.setCellValue(dto.getProductSeq());
				cell = row.createCell(1);
				cell.setCellValue(dto.getProductName());
				cell = row.createCell(2);
				cell.setCellValue(dto.getProductUnit());
				cell = row.createCell(3);
				cell.setCellValue(dto.getDetailCount());
				cell = row.createCell(4);
				cell.setCellValue(dto.getDetailPrice());
				cell = row.createCell(5);
				cell.setCellValue(dto.getDetailPriceTax());
				cell = row.createCell(6);
				cell.setCellValue(dto.getDetailPriceSum());
			}
			String fileName = id + "_" + list.get(0).getOrderDate()+ "_" + buyerSeq;
			File file = new File(fileName);
			OutputStream fos = null;
			
			response.setContentType("Application/Msexcel");
			response.setHeader("Content-Disposition", "Filename="+URLEncoder.encode(fileName,"UTF-8")+".xls");
			OutputStream fileOut = null;
			fileOut = response.getOutputStream();
			out.clear();
			out = pageContext.pushBody();
			workbook.write(fileOut);
			workbook.close();
			fileOut.close();

	
%>