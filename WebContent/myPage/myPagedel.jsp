<%@page import="myPageSeller.sellerDto"%>
<%@page import="java.util.List"%>
<%@page import="myPageSeller.sellerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<%
	
	String id = (String)session.getAttribute("login");
	if(id==null){
		response.sendRedirect("../login/login.jsp");
	}


	sellerDao dao = sellerDao.getInstance();
	List<sellerDto> list = dao.getSellerInform(id);

	sellerDto dto = null;
	int count =0;
	int trade_price = 0;
	for(int i = 0; i< list.size(); i++){
		dto = list.get(i);
	}
	
	
	
	boolean isS = dao.delSeller(id);
	if(isS == true){
		%>
	<script type="text/javascript">
		alert("그동안 감사했습니다");
		location.href="../login/login.jsp";
</script>
	<%}else{%>
	<script type="text/javascript">
		alert("탈퇴 실패");
		location.href="./myPage.jsp";
		</script>
	<%}%>
