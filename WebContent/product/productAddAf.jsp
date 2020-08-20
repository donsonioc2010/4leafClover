<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="product.productDto"%>
<%@page import="product.productDao"%>

 <!-- 상품추가~ -->
<%
	productDao dao = productDao.getInstance();
	
	request.setCharacterEncoding("utf-8");
	productDto dto = new productDto();
	dto.setProductName(request.getParameter("productName"));
	dto.setProductSort(request.getParameter("saveSelectSort"));//String
	dto.setProductUnit(request.getParameter("productUnit"));//String
	dto.setProductTradePrice(Integer.parseInt(request.getParameter("productTradePrice")));//int
	dto.setProductPieceBox(Integer.parseInt(request.getParameter("productPieceBox")));//int
	dto.setProductStandard(request.getParameter("productStandard"));//string
	
	boolean confirm = dao.addproduct(dto);
	//true 성공 false 실패
	if(confirm){
		%>
		<script type="text/javascript">
		alert('상품등록 성공');
		window.self.close()
		opener.location.reload()
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert('등록된데이터가 있습니다. 등록에 실패했습니다')
		window.self.close()
		opener.location.reload()
		</script>
		<%
	}
 %>