<%@page import="product.productDto"%>
<%@page import="java.util.List"%>
<%@page import="product.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("login")==null){
	response.sendRedirect("../login/login.jsp");
}

String searchWord = request.getParameter("searchWord");

productDao dao = productDao.getInstance();
List<productDto> list = dao.searchProductList(searchWord);
%>    
    
    
	<%
		if(list == null || list.size() == 0){
	%>
		<tr>
			<td colspan="4" align="center">거래처목록이 없습니다</td>
		</tr>
	<%
		}else{
			for(int i = 0; i < list.size(); i++){
				productDto dto = list.get(i);
	%>
			<tr>
				<th><input type="radio" name="chkBox"  value="<%=dto.getProductSeq() %>"></th>
				<td><span name="productName"> <%=dto.getProductName() %> </span></td>
				<!-- <td><span name="<%=dto.getProductSeq()%>"> <%=dto.getProductUnit()%></span></td>  -->
				<td><span name="productSupply"> <%=dto.getProductTradePrice() %></span></td>
				<td>
					<span name="productStandard"> <%=dto.getProductStandard() %></span>
				</td>
			</tr>
	<% 
			}
		}
	%>