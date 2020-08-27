<%@page import="tradeBook.clienthistoryDao"%>
<%@page import="tradeBook.clienthistoryDto"%>
<%@page import="buyer.BuyerDao"%>
<%@page import="buyer.BuyerDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String id = (String)session.getAttribute("login");
if(id==null){
	response.sendRedirect("../login/login.jsp");
}

	//거래처정보들을 조회한다.
BuyerDto dto = null;
BuyerDao dao = BuyerDao.getInstance(); // 거래처dao의 인스턴스를불러온다
List<BuyerDto> clientList = dao.getBuyerList(id);//동작을 학인 하고자 테스트ID 를사용하였다.

//거래처의 거래내역들을 조회한다.
clienthistoryDao clientInfodao = clienthistoryDao.getInstance();

//서치
List<clienthistoryDto> clientInfoList = clientInfodao.getClientHistory(id, 0, "");

// 검색
String searchWord = request.getParameter("searchWord"); // 검색하는 텍스트값을가져온다.
String choice = request.getParameter("choice"); // 셀렉트옵션중 선택된종류의 밸류값을 가져온다.  
//선택된것이값이없거나 공백일경우.
if (choice == null || choice.equals("")) {
	choice = "sel"; // 전체옵션으로 되돌려준다.
}
// 검색어를 지정하지 않고 넘어온경우.
if (choice.equals("sel")) {
	searchWord = "";// 텍스트입력란을 공백으로 바꿔준다 
}
//검색어가 없을경우
if (searchWord == null) {
	searchWord = ""; //검색어를 지워버린다.
	choice = "sel";//셀렉옵션은 전체옵션으로 되돌려준다

}
List<BuyerDto> list = clientInfodao.getSearchClient(choice, searchWord, id);//ID세션변경예정
if(searchWord !=null){
	searchWord = "";
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>거래 원장</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<link rel="stylesheet" href="../init.css"/>  
		<link rel="stylesheet" href="./style.css" type="text/css">
		<link rel="stylesheet" href="./orderlistbills.css" />
	</head>


	<body onload='createDate();'>
		<%if(id!=null){ %>
			<jsp:include page="../navigation.jsp"></jsp:include>
		<%} %>
		<form action=''id='gotoOrderDetail'method='POST'>
			<input type='hidden'name='detailSeq'id='detailSeq'>
			<input type='hidden'name='detailYear'id='detailYear'>
			<input type='hidden'name='detailMonth'id='detailMonth'>
			<input type='hidden'name='detailDay'id='detailDay'>
		</form>
		<!-- 특정한 시퀀스를 담아두기위해 히든을 사용함   --> 
		<div>
			<input type="hidden" id="frm" value="#" />
			<input type="hidden" id="companyName" value="#" />
		</div>
	
	
		
			<!--거래처정보를 얻어오기위해 텍스트input 생성 -->
		<div class="searchclass">
			<div class="panel-default">
				<div id="jb-content">
					<label>거래처정보</label> <input type="text" placeholder="거래처입력란"class="searchword" value="<%=searchWord%>">
					<button class="glyphicon glyphicon-search"onclick="searchbooks()">검색</button> <!--클릭시검색함수로이동하여 처리한다. -->
					<!--검색옵션을 주어 해당하는 개별검색할수있게 함 -->
					<select class="choice">
						<option value="allselect">---선택---</option>
						<option value="seller">거래처명</option>
						<option value="ceo">대표자</option>
						<option value="number">사업자 번호</option>
					</select>
					<!--거래처 모달형태 신규거래처를 추가적으로 기입하고 DB에 INSERT함--> 
					<button class="btn btn-primary"id='addBuyerModalBtn'data-target="#layerpop1" data-toggle="modal">거래처추가</button>
					<button class="btn btn-primary"id="deleteBuyerModalBtn"data-target="#layerpop3" data-toggle="modal">거래처삭제</button>&nbsp;&nbsp;
					<label>거래일자</label> 
						<select name='year'id='year'onload='getMonthDay();'></select> 년		<!-- ??onload? -->
						<select name='month'id='month'onload='getMonthDay();'></select> 월	<!-- ??onload? -->
						<select name='day'id='day'></select> 일
					<button class="btn btn-primary"id="stateMentOutputModalBtn" data-target="#layerpop2" data-toggle="modal">명세서출력</button>
				</div>

				 <div class="componet">
					 <div class="tb_box">
    					<table class="table table-condensed">
    		 				<thead>
								<!-- 거래처정보를 테이블화 -->
								<tr class="fixed_top">
									<th class="col1">번호</th>
									<th>업체구분</th>
									<th>거래처명</th>
									<th>대표자명</th>
									<th>사업자번호</th>
									<th>회사전화번호</th>
									<th>담당자</th>
									<th>최종거래일</th>
									<th>메모</th>
								</tr>
							</thead><!--상단 td 태그 덮힘으로 강제 개행시켜버림  -->
					
							<tbody>
								<%for (int i = 0; i < list.size(); i++) {%> 
								<!--헤더 상단부분 거래처정보 데이터를 db를 통해 받아와서 for문으로 뿌려주는 작업 클릭한 태그 에 해당하는 거래처의 이름 값을 가공을 거치지않고 바로 전달 한다.-->
								<tr class='seq1'onclick="buySeqGetBtn('<%=list.get(i).getBuyer_seq()%>','<%=list.get(i).getBuyer_company_name()%>')">
									<td class="col1"><%=i + 1%></td>
									<td><%=list.get(i).getBuyer_business_condition()%></td>
									<td><%=list.get(i).getBuyer_company_name()%></td>
									<td><%=list.get(i).getBuyer_ceo()%></td>
									<td><%=list.get(i).getBuyer_company_num()%></td>
									<td><%=list.get(i).getBuyer_tel_num()%></td>
									<td><%=list.get(i).getBuyer_admin()%></td>
									<td><%=list.get(i).getBuyer_date()%></td>
									<td><%=list.get(i).getBuyer_memo()%></td>
								</tr>
								<%}%>
							 </tbody>
						</table>
					</div>
				</div>
			</div>
	
	
			<!--거래처 내역 조회란  -->
			<div id="jb-content1">
				<!--상세정보를 조회하기위해 AJAX를 통해 데이터를 전송하기전 밑그림   -->
				<!-- 거래내역 날짜별검색 은 자바스크립트 함수로 받아오고 기간별검색만 온클릭 함수를 실행함  -->
				<!--상품명별로 개별검색 한다  -->
				<label>거래내역</label> 
				<input class="tradeselector"type="text"id='searchWordJw'placeholder="거래내역입력란">
				<button type="button"id='searchWordBtn'>
					<span class="glyphicon glyphicon-search" aria-hidden="true">검색</span>
				</button>
				<!--해당날짜별로 조회한다  -->
				<label>날짜별검색</label> 
				<input type="date"class='daydate'> 
				<button id="datesaerchBtn"type="button">
					<span class="glyphicon glyphicon-search" aria-hidden="true">검색</span>
				</button>
				 <!--기간별로 조회한다  -->
				<label>기간별검색</label> 
				<input type="date"class="termdate1"> ~ 
				<input type="date"class="termdate2">
				<button class="fromselect"type="button"onClick="termdatesaerchBtn()">
					<span class="glyphicon glyphicon-search" aria-hidden="true">검색</span>
				</button>
			<!--  END  -->
			</div>
				
			<div class="componet">
				<div class="tb_box">				
					<table class="table table-condensed">
						<thead><!--스코프 왜줫는지 까먹음 기억나는데로 작성함  -->
							<tr class="fixed_top">
								<th class="col1">번호</th>
								<th >거래일</th>
								<th>구분</th>
								<th >거래내역</th>
								<th >공급가</th>
								<th >세액</th>
								<th >합계금액</th>
								<th >수금액</th>
								<th >미수금액</th>

							</tr>
						</thead>
						
						<tbody class="title" id='contentList'>
							<%for (int i = 0; i < clientInfoList.size(); i++) {
								clienthistoryDto cdto = clientInfoList.get(i);
							%><!-- 헤더 상단부 거래처 상세내역 전부 땡겨와서 뿌려주는 작업 리플레쉬 or뷰로 넘어 오게되면 바로확인할수있다-->
								<tr name='<%=cdto.getBuyerseq()%>'>
									<td><%=i + 1%></td>
									<td><%=cdto.getLedgerdate()%></td>
									<td><%=cdto.getLedgersort()%></td>
									<td><%=cdto.getLedgerproductname()%></td>
									<td><%=cdto.getLedgersupplyprice()%></td>
									<td><%=cdto.getLedgertaxvalue()%></td>
									<td><%=cdto.getLedgernotcollectmoney()%></td>
									<td><%=cdto.getLedgercollectmoney()%></td>
									<td><%=cdto.getLedgertotal()%></td>
								</tr>
							<%}%>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 총통계 값 출력  매출합계,수금합계,미수금계 모든 항목에 대한 총합 정보를 계산하는 로직  -->
			<%
			int Ledgertotal = 0;
			int Ledgercollectmoney = 0;
			int Ledgernotcollectmoney = 0;
			for (int i = 0; i < clientInfoList.size(); i++) {
				Ledgertotal += clientInfoList.get(i).getLedgertotal();
				Ledgercollectmoney += clientInfoList.get(i).getLedgercollectmoney();
				Ledgernotcollectmoney += clientInfoList.get(i).getLedgernotcollectmoney();
			}
			%>
			<br>
			<div align="center">	
				<input class="button-input-inline"type="button"value="매출합계" />
				<input class="button-input-inline"type="text"value="<%=Ledgertotal%>"readonly /> 
				<input class="button-input-inline"type="button"value="수금합계" />
				<input class="button-input-inline"type="text"value="<%=Ledgercollectmoney%>"readonly /> 
				<input class="button-input-inline"type="button"value="미수금계" />
				<input class="button-input-inline"type="text"value="<%=Ledgernotcollectmoney%>"readonly />
			</div>
		</div>
	
		<div class="modal fade" id="layerpop1"></div>
		<div class="modal fade" id="layerpop2"></div>
		<div class="modal fade" id="layerpop3"></div>
	
	
		<script src="./tradeBook.js"> </script>
	</body>
</html>

