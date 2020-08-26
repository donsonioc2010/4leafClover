<%@page import="buyer.BuyerDao"%>
<%@page import="buyer.BuyerDto"%>
<%@page import="order.detailDto"%>
<%@page import="orderlistbills.orderlistbillsDao"%>
<%@page import="order.orderDto"%>
<%@page import="java.util.List"%>
<%@page import="order.orderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";
	if(session.getAttribute("login")==null){
		response.sendRedirect("../login/login.jsp");
	}else{
		id = (String)session.getAttribute("login");
	}
	
	//Date가 없으면 Null
	
	request.setCharacterEncoding("utf-8");
	String buyerSeq = request.getParameter("detailSeq");
	String syear = request.getParameter("detailYear");
	String smonth = request.getParameter("detailMonth");
	String sday = request.getParameter("detailDay");
	boolean swBody = false;
	int year = 0 ,month = 0 ,day = 0,seq = 0;
	List<Object> list = null;
	
	BuyerDto buyer = null;
	//list ???
	if(buyerSeq != null && syear!=null && smonth!=null && sday!=null){
		//parameter가 한개라도 Null이면 실행안함
		swBody = true;
		seq = Integer.parseInt(buyerSeq);
		year = Integer.parseInt(syear);
		month = Integer.parseInt(smonth);
		day = Integer.parseInt(sday);
		BuyerDao dao = BuyerDao.getInstance();
		buyer = dao.getBuyerInfo(seq);
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>OrderDetail</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="../init.css?after"/>
		<link rel="stylesheet" href="./order.css?after">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	</head>
	<%if(swBody){%>
		<body onload='loadDate(<%=year%>,<%=month%>,<%=day%>,<%=seq%>);'>
	<%}else{ %>
		<body onload='createDate();'>
	<%} %>
	<%if(id!=null){ %>
		<jsp:include page="../navigation.jsp"></jsp:include>
	<%} %>
		<div align='center'>
		<!-- OrderList추가를 하거나 거래원장에 Date와 BuyerSeq를 보내기 위함 -->
		<form action='./orderSave.jsp'method='post'id='dataForm'>
			<!-- DateSelectBox -->
			<div class='dateBox'>
				거래일자 :
				<select name='year'id='year'onchange='getMonthDay();'></select> 년
				<select name='month'id='month'onchange='getMonthDay();'></select> 월
				<select name='day'id='day'></select> 일
				<input type='button'id='getSearchList'value='검색'onclick='searchList();'class="btn btn-primary">
				<!-- 
				<input type='button' value='확인'>
				 -->
				<!-- 확인버튼을 클릭시 회사명이 Null이 아니면 검색이 되게 할예정 -->
			</div>
			<hr>
			<!-- BuyerInfoBox -->
			<div class='BuyerInfoBox'>
				<table >
					<tr>
					<%if(buyer !=null){%>
						<th >거래처</th>
						<td > 
							<input type='hidden'name='buyerSeq'>
							<input type='text'value='<%=buyer.getBuyer_company_name()%>'class='no-write'name='buyerCompanyName'style="width:70%;"readonly>
							<input type='button'value='목록'onclick='popCompanyList()'style="width:20%;" class="btn btn-primary">
						</td>
						<th>대표자</th>
						<td>
							<input type='text'value='<%=buyer.getBuyer_ceo()%>'class='no-write'name='buyerCeo'readonly>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type='text'value='<%=buyer.getBuyer_tel_num()%>'class='no-write'name='buyerTelNum'size='15'readonly>
						</td>
						<th>사업자번호</th>
						<td>
							<input type='text'value='<%=buyer.getBuyer_company_num()%>'class='no-write'name='buyerCompanyNum'id='buyerCompanyNum'size='13'readonly>
						</td>
					<%}else{ %>
						<th >거래처</th>
						<td > 
							<input type='hidden'name='buyerSeq'>
							<input type='text'class='no-write'name='buyerCompanyName'style="width:70%;"readonly>
							<input type='button'value='목록'onclick='popCompanyList()'style="width:20%;" class="btn btn-primary">
						</td>
						<th>대표자</th>
						<td>
							<input type='text'class='no-write'name='buyerCeo'readonly>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type='text'class='no-write'name='buyerTelNum'size='15'readonly>
						</td>
						<th>사업자번호</th>
						<td>
							<input type='text'class='no-write'name='buyerCompanyNum'id='buyerCompanyNum'size='13'readonly>
						</td>
					<%} %>
					</tr>
					
				</table>
			</div>
			
			<hr>
			<!-- ListDetail 에 추가할  주문내역 작성Table -->
			<div class='orderDetail'>
				<table >
					<thead >
						<tr>
							<th class='cell1'>상품번호</th>
							<th class='cell2'>품목명</th>
							<th class='cell3'>규격</th>
							<th class='cell4'>수량</th>
							<th class='cell5'>개당단가</th>
							<th class='cell6'>개당세액</th>
							<th class='cell7'>주문합계</th>
						</tr>
					</thead>
					<tbody id='detailList' onchange='calculTotal();'>
						<!-- list Size가 없으면 1개 있으면 목록으로 -->
						<!-- onChangeEvent = tbody에 해보기 -->

					</tbody>
					<tfoot id='orderResult'>
						<!-- 리스트가 있을때 없을때 나누기 -->
	
							<tr>
								<th >총 합계 </th>
								<td colspan='2'>
									<input type='hidden'name='orderNum'>
									<input type='text'class='no-write'name='orderTotalPrice'readonly>
								</td>
								<td>
									<input type='button'value='추가'id='addTdBtn'onclick='addRow();' class="btn btn-primary">
								</td>
							</tr>
							<tr>
								<th class='tf1'>총 도매가</th>
								<td class='tf2'>
									<input type='text'class='no-write'name='orderSupplyPrice'readonly>
								</td>
								<th class='tf1'>총 세액</th>
								<td class='tf2'>
									<input type='text'class='no-write'name='orderTaxPrice'readonly>
								</td>
							</tr>
							<tr>
								<th class='tf1'>외상(미수금)</th>
								<td class='tf2'>
									<input type='number'name='notCollectMoney'readonly>
								</td>
								<th class='tf1'>지불금액(수금)</th>
								<td class='tf2'>
									<input type='number'name='CollectMoney'onchange='takeMoney();'disabled>
								</td>
							</tr>
						
					</tfoot>
				</table>
			</div>
			<hr>
			
			<input type='button'value='거래명세서'id='statement'onclick="tradingStatement();"class="btn btn-primary"disabled>
			<input type='button'value='저장'id='orderSaveBtn'onclick="orderSave();"class="btn btn-primary">
			<input type='button'value='수정'name='updateDetail'onclick='updateMoney();'class="btn btn-primary"disabled>
			<input type='button'value='삭제'id='deleteBtn'onclick='deleteList();'class="btn btn-primary"disabled>
			<input type='button'value='엑셀변환'id='convertExcel'onclick='translateExcel();'class='btn btn-primary'disabled>
			
		</form>
		</div>
		<script src="./order.js" type="text/javascript"></script>
	</body>
</html>