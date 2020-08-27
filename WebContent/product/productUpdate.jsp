<%@page import="product.productDto"%>
<%@page import="product.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
productDao dao = productDao.getInstance();

request.setCharacterEncoding("utf-8");

productDto dto = new productDto();
dto.setProductSeq(Integer.parseInt(request.getParameter("productNum")));
dto.setProductName(request.getParameter("productName"));
dto.setProductSort(request.getParameter("saveSelectSort"));//String
dto.setProductUnit(request.getParameter("productUnit"));//String
dto.setProductTradePrice(Integer.parseInt(request.getParameter("productTradePrice")));//int
dto.setProductPieceBox(Integer.parseInt(request.getParameter("productPieceBox")));//int
dto.setProductStandard(request.getParameter("productStandard"));//string

boolean confirm = dao.updateProduct(dto);
if(confirm){%>
	<script type="text/javascript">
	alert('수정 성공');
	</script>
<%}else{%>
	<script type="text/javascript">
	alert('수정 실패')
	</script>
<%}%>
<script>
	window.self.close()
	opener.location.reload()
</script>