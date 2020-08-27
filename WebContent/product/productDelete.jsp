<%@page import="product.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String strSeq =	request.getParameter("productSeq");
	productDao dao = productDao.getInstance();
	
	//true = 성공 false = 실패
	boolean confirm = dao.deleteProduct(Integer.parseInt(strSeq));
	if(confirm){
		%>
		<script type="text/javascript">
		alert('삭제성공')
		window.self.close()
		opener.location.reload()
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert('문제 발생으로 삭제 실패')
		window.self.close()
		opener.location.reload()
		</script>
		<%
	}
%>