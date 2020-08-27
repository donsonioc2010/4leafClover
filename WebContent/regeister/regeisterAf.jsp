<%@page import="Seller.sellerDao"%>
<%@page import="Seller.sellerDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

    
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	String ceo = request.getParameter("username");
	String companyNum = request.getParameter("comNum1")+request.getParameter("comNum2")+request.getParameter("comNum3");
	String companyName = request.getParameter("companyName");
	String businessCondition = request.getParameter("business_condition");//업태
	String businessKind = request.getParameter("business_kind");//종목
	String email  = request.getParameter("useremail");//이메일
	String number = request.getParameter("tel1")+request.getParameter("tel2")+request.getParameter("tel3");//전화번호
	String phone = request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3");//핸드폰번호
	String address1 = request.getParameter("postNum");
	String address2 = request.getParameter("roadAddress");
	String address3 = request.getParameter("wAddress");
	  
	sellerDto seldto = new sellerDto(id,pw,companyName,ceo,companyNum,businessCondition,businessKind,address1,address2,address3,number,phone,email);
	sellerDao dao = sellerDao.getInstance();
	boolean b = dao.addSeller(seldto);
%>
	<%if(b){%>
		<script type="text/javascript">
			alert("성공");
			location.href="../login/login.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
		location.href="../login/login.jsp";
		alert("실패");
		</script>
	<%}%>
