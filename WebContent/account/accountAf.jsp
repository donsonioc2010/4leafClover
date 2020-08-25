<%@page import="buyer.BuyerDto"%>
<%@page import="buyer.BuyerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("login");
if(id==null){response.sendRedirect("./login/login.jsp");}

String companyname = request.getParameter("companyname"); 	// 거래처명
String ceoname = request.getParameter("ceoname"); 			// 대표자
String condition = request.getParameter("condition"); 		// 업태
String kinds = request.getParameter("kinds"); 				// 종목
String companynum = request.getParameter("companynum"); 	// 사업자번호
String address1 = request.getParameter("address1"); 		// 우편번호
String address2 = request.getParameter("address2"); 		// 주소
String address3 = request.getParameter("address3"); 		//상세주소
String admin = request.getParameter("admin"); 				// 관리자
String email = request.getParameter("email"); 				// 이메일
String tel = request.getParameter("telnum"); 					// 전화번호
String fday = request.getParameter("fday");					// 날짜
String memo = request.getParameter("memo");					// 메모
String homepage = request.getParameter("homepage"); 		// 홈페이지

BuyerDao dao = BuyerDao.getInstance();
	
boolean isS = dao.addBuyer( new BuyerDto(id , companyname, ceoname, condition, kinds, companynum
					, address1, address2, address3, admin, email, tel
					, fday, memo, homepage ));
if (isS) { %>
	<script>
		alert("거래처 추가 완료");
		location.href='./account.jsp'
	</script>
<%} else {%>
	<script>
		alert("다시 기입해주세요");
		location.href='./account.jsp'
		</script>
<%}%>
