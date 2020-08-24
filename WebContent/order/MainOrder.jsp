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
	String strBuyerSeq = request.getParameter("buyerSeq");
	//list ???
	if(!(strBuyerSeq == null || strBuyerSeq.equals(""))){
		//getParameter가 있을경우에 list로 받아오기
		
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>OrderDetail</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="../init.css"/>
		<link rel="stylesheet" href="./order.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	</head>
	<body onload='createDate();'>
	<%if(id!=null){ %>
		<jsp:include page="../navigation.jsp"></jsp:include>
	<%} %>
		<center>
		<!-- OrderList추가를 하거나 거래원장에 Date와 BuyerSeq를 보내기 위함 -->
		<form action='./orderSave.jsp'method='post'id='dataForm'>
			<!-- DateSelectBox -->
			<div class='dateBox'>
				거래일자 :
				<select name='year' onchange='getMonthDay();'></select> 년
				<select name='month' onchange='getMonthDay();'></select> 월
				<select name='day'></select> 일
				<input type='button'value='검색'onclick='searchList();' class="btn btn-primary">
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
						<%//if(list.size()==null||list.size()==0){//데이터가없을때 %>
						
						<!-- 
						<tr>
							<td class='cell1'>
								<input type='text'name='productSeq'class='no-write'readonly>
							</td>
							<td class='cell2'>
								<input type='text'name='productName'class='no-write'style='width:94%'readonly>
								<button type='button'onclick='popProductList(this)'value='0'name='popProduct'>..</button>
							</td>
							<td class='cell3'>
								<input type='text'name='productStandard'readonly>
							</td>
							<td class='cell4'>
								<input type='number'name='orderCount'class='no-write'min="0"step="1"disabled>
							</td>
							<td class='cell5'>
								<input type='text'name='orderSupply'class='no-write'readonly>
							</td>
							<td class='cell6'>
								<input type='text'name='orderTax'class='no-write'readonly>
							</td>
							<td class='cell7'>
								<input type='text'name='orderTotal'class='no-write'readonly>
							</td>
						</tr> 
						-->
						
						<%//}else{//데이터가 있을떄 %>
						
						<%//} %>
						
						
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
								<input type='number'name='notCollectMoney'>
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
			<input type='button'value='거래명세서'onclick="tradingStatement();" class="btn btn-primary">
			<input type='button'value='저장'id='orderSaveBtn'onclick="orderSave();" class="btn btn-primary">
			<input type='button'value='수정'name='updateDetail'onclick='updateMoney();'disabled class="btn btn-primary">
			<input type='button'value='삭제'id='deleteBtn'onclick='deleteList();'disabled class="btn btn-primary">
		</form>
		<script src="./order.js" type="text/javascript"></script>
	</body>
	</center>
</html>