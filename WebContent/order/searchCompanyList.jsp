<%@page import="buyer.BuyerDao"%>
<%@page import="buyer.BuyerDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";
	if(session.getAttribute("login")==null){
		response.sendRedirect("../login/login.jsp");
	}else{
		id = (String)session.getAttribute("login");
	}

	String searchWord = (String)request.getParameter("searchWord");
	String type = (String)request.getParameter("type");
	BuyerDao dao = BuyerDao.getInstance();
	List<BuyerDto> list = dao.getBuyerSearchThreeInfo(id, type, searchWord);
%>	
	<%
		if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="3" align="center">거래처목록이 없습니다</td>
	</tr>
	<%
		}else{
			for(int i = 0; i < list.size(); i++){
				BuyerDto dto = list.get(i);
	%>
	<tr>
		<th>
			<input type="radio" name="chkBox" value="<%=dto.getBuyer_seq() %>">
			<input type="hidden" name="<%=dto.getBuyer_seq() %>" value="<%=dto.getBuyer_company_num() %>">
			<input type="hidden" name="<%=dto.getBuyer_seq() %>" value="<%=dto.getBuyer_tel_num() %>">
		</th>
		<td><span name="<%=dto.getBuyer_seq() %>"><%=dto.getBuyer_company_name() %></span> </td>
		<td><span name="<%=dto.getBuyer_seq() %>">	<%=dto.getBuyer_ceo()%></span> </td>
	</tr>
	<% 
			}
		}
	%>