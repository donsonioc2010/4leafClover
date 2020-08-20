<%@page import="java.util.List"%>
<%@page import="product.productDto"%>
<%@page import="product.productDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이 파일는 ProductSeq를 통하여 상품의 정보를 Ajax로 다시 보내주는 역할을 함
	//팝업으로 다 처리해서 사용을 안하게될듯
	productDao dao = productDao.getInstance();
	String searchType = request.getParameter("searchType");
	String searchWord = request.getParameter("searchWord");
	List<productDto> productList = dao.searchProductList(searchType, searchWord);
	for(int i = 0; i <productList.size(); i++){
	%>
       <tr >
           	<td ><%=productList.get(i).getProductSeq() %></td>
       		<td><%=productList.get(i).getProductName() %></td>
       		<td><%=productList.get(i).getProductSort() %></td>
       </tr>
    <%
	}
    %>