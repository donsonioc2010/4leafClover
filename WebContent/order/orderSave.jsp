<%@page import="order.orderDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.detailDto"%>
<%@page import="java.util.List"%>
<%@page import="order.orderDto"%>
<%@page import="util.UtilEx"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";
	if(session.getAttribute("login")==null){
		response.sendRedirect("../login/login.jsp");
	}else{
		id = (String)session.getAttribute("login");
	}

	//1. 회사정보가 없는채로 넘어오지는 않는다.
	request.setCharacterEncoding("utf-8");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");	
	
	//2.Order_List 넣을 Dto
	orderDto order = new orderDto();
	
	order.setBuyerSeq( Integer.parseInt(request.getParameter("buyerSeq"))) ;
	order.setOrderSort(1);
	order.setOrderDate(year+UtilEx.two(month)+UtilEx.two(day));
	order.setOrderSupplyValue(Integer.parseInt(request.getParameter("orderSupplyPrice")));
	order.setOrderTaxValue(Integer.parseInt(request.getParameter("orderTaxPrice")));
	order.setOrderCollectMoney(Integer.parseInt(request.getParameter("CollectMoney")));
	order.setOrderNotCollectMoney(Integer.parseInt(request.getParameter("notCollectMoney")));
	order.setOrderTotal(Integer.parseInt(request.getParameter("orderTotalPrice")));
	
	
	//3.Order_detail에 넣을 정보넣기
	List<detailDto> detailList = new ArrayList<detailDto>();
	String productSeq[] = request.getParameterValues("productSeq");
	String productName[] = request.getParameterValues("productName");
	String productStandard[] = request.getParameterValues("productStandard");
	String orderCount[] = request.getParameterValues("orderCount");
	String orderSupply[] = request.getParameterValues("orderSupply");
	String orderTax[] = request.getParameterValues("orderTax");
	String detailTotal[] = request.getParameterValues("orderTotal");
	
	for(int i = 0; i<productSeq.length; i++){
		if(productName[i].trim().equals("")||productName[i].trim().equals(null)||orderCount[i].trim().equals("0")){
			System.out.println("InsertDetailNullValue");
		}else{
			detailDto dto = new detailDto();
			
			dto.setProductSeq(Integer.parseInt(productSeq[i]));
			dto.setProductName(productName[i]);
			dto.setOrderCount(Integer.parseInt(orderCount[i]));
			dto.setOrderPrice(Integer.parseInt(orderSupply[i])*dto.getOrderCount());
			dto.setPriceTax(Integer.parseInt(orderTax[i])*dto.getOrderCount());
			dto.setPriceSum(Integer.parseInt(detailTotal[i]));
			
			detailList.add(dto);
		}
	} 
	orderDao dao = orderDao.getInstance();
	//true 가오면 실패
	boolean confirm = dao.insertOrder(order, detailList);
%>

<%if(confirm){ %>
	<script type="text/javascript">
		alert('실패')
		location.href='./MainOrder.jsp'
	</script>
<%}else{%>
	<script type="text/javascript">
		alert('입력완료')
		location.href='./MainOrder.jsp'
	</script>
<%
}
%>