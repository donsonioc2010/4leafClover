<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
List<BuyerDto> clientList = dao.getBuyerList("test1");//동작을 학인 하고자 테스트ID 를사용하였다.

//거래처의 거래내역들을 조회한다.
clienthistoryDto clientdto = null;
clienthistoryDao clientInfodao = clienthistoryDao.getInstance();

//서치
List<clienthistoryDto> clientInfoList = clientInfodao.getClientHistory("test1", 0, "");

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

} //검색어에 해당하는 거래처정보를 가져온다
List<BuyerDto> list = clientInfodao.getSearchClient(choice, searchWord, id);//ID세션변경예정 
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css">
<link rel="stylesheet" href="./css/bootstrap.css" />
<meta charset="UTF-8">
<title>거래 원장</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
</head>


<body>
	<%if(id!=null){ %>
		<jsp:include page="../navigation.jsp"></jsp:include>
	<%} %>
	<!-- 특정한 시퀀스를 담아두기위해 히든을 사용함   --> 
	<div>
		<input type="hidden" id="frm" value="#" />
		
	</div>


	
		<div class="bg-white box-shadow py-5 px-4 px-sm-5">
			<div class="panel-default">
				<!--거래처정보를 얻어오기위해 텍스트input 생성 -->
				<div id="jb-content">
				<label>거래처정보</label> <input type="text" placeholder="거래처입력란"class="searchword" value="<%=searchWord%>">
				<button onclick="searchbooks()">검색</button> <!--클릭시검색함수로이동하여 처리한다. -->
				<!--검색옵션을 주어 해당하는 개별검색할수있게 함 -->
				<select class="choice">
					<option value="allselect">전체</option>
					<option value="seller">거래처명</option>
					<option value="ceo">대표자</option>
					<option value="number">사업자 번호</option>
				</select>
					<!--거래처 모달형태 신규거래처를 추가적으로 기입하고 DB에 INSERT함--> 
				<button class="btn btn-default" data-target="#layerpop1" data-toggle="modal">거래처추가</button>
				<!-- 미정  -->
				<button id="popbutton"class="btn btn-secondary">명세서출력</button>
				<!-- 미정  -->
				<button class="btn btn-primary">전표입력</button>
				<!-- 미정  -->
				<button class="btn btn-default1" data-target="" data-toggle="modal">거래처삭제</button>
			</div>

			

			
					<!-- 스타일 뭉칠예정 -->  
				 <div style="width: 100%; height: 300px;  padding-top: 1px; position: relative">
				 <div class="tb_box">
    		<table class="table table-condensed">
    		 <thead>
<!-- 거래처정보를 테이블화 -->
						<tr class="fixed_top">
							<th>No</th>
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
						<tr><td></td></tr>
						<tr><td></td></tr>
						<tr><td></td></tr>
						
						<% 
							for (int i = 0; i < list.size(); i++) {
						%> <!--헤더 상단부분 거래처정보 데이터를 db를 통해 받아와서 for문으로 뿌려주는 작업  -->
						   <!-- 클릭한 태그 에 해당하는 거래처의 이름 값을 가공을 거치지않고 바로 전달 한다.  -->
						<tr class='seq1'onclick="buySeqGetBtn('<%=list.get(i).getBuyer_seq()%>')">
							<td><%=i + 1%></td>
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
<!--   END  -->


<!--거래처 내역 조회란  -->
			<div id="jb-content1">
			<!--상세정보를 조회하기위해 AJAX를 통해 데이터를 전송하기전 밑그림   -->
			<!-- 거래내역 날짜별검색 은 자바스크립트 함수로 받아오고 기간별검색만 온클릭 함수를 실행함  -->
				<!--상품명별로 개별검색 한다  -->
				<label>거래내역</label> 
				<input class="tradeselector" type="text" id='searchWordJw' placeholder="거래내역입력란"> 
				<input type="button" class='searchWordBtn' value="검색">
				<!--해당날짜별로 조회한다  -->
				<label>날짜별검색</label> 
				<input type="date" class='daydate'> 
				<input class="datesaerchBtn"type="button" value="검색">
				 <!--기간별로 조회한다  -->
				<label>기간별검색</label> 
				<input type="date"class="termdate1"> ~ 
				<input type="date" class="termdate2">
				<input class="fromselect" type="button"onClick="termdatesaerchBtn()" value="검색">
			
<!--  END  -->
			</div>
			<!--스타일 한군데 뭉칠예정  -->
				<div style="width: 100%; height: 300px; padding-top: 1px; position: relative">
				<div class="tb_box">
<!--거래처내역 상세 테이블  -->					
					<table class="table table-condensed">
						<thead><!--스코프 왜줫는지 까먹음 기억나는데로 작성함  -->
							<tr class="fixed_top">
								<th scope="col">번호</th>
								<th scope="col">거래일</th>
								<th scope="col">구분</th>
								<th scope="col">거래내역</th>
								<th scope="col">공급가</th>
								<th scope="col">세액</th>
								<th scope="col">합계금액</th>
								<th scope="col">누계잔액</th>
								<th scope="col">수금액</th>
								<th scope="col">미수금액</th>

							</tr>
						</thead><!--얘도 기억안남 시간나는데로 작성함  -->
						<tbody class="title" id='contentList'>
						<tr><td></td></tr>
						<tr><td></td></tr>
						<tr><th></th></tr>
							<%
								for (int i = 0; i < clientInfoList.size(); i++) {
							%><!-- 헤더 상단부 거래처 상세내역 전부 땡겨와서 뿌려주는 작업 리플레쉬 or뷰로 넘어 오게되면 바로확인할수있다-->
							<tr>
								<td><%=i + 1%></td>
								<td><%=clientInfoList.get(i).getLedgerdate()%></td>
								<td><%=clientInfoList.get(i).getLedgersort()%></td>
								<td><%=clientInfoList.get(i).getLedgerproductname()%></td>
								<td><%=clientInfoList.get(i).getLedgersupplyprice()%>
								<td><%=clientInfoList.get(i).getLedgertaxvalue()%></td>
								<td><%=clientInfoList.get(i).getLedgertotal()%></td>
								<td></td>
								<td><%=clientInfoList.get(i).getLedgercollectmoney()%></td>
								<td><%=clientInfoList.get(i).getLedgernotcollectmoney()%></td>
							</tr>

							<%
								}
							%>
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
				
			<input class="button-input-inline" type="button" value="매출합계" /><input class="button-input-inline" type="text" value="<%=Ledgertotal%>"readonly="readonly" /> 
			<input class="button-input-inline" type="button" value="수금합계" /><input class="button-input-inline" type="text"value="<%=Ledgercollectmoney%>" readonly="readonly" /> 
			<input class="button-input-inline" type="button" value="미수금계" /><input class="button-input-inline" type="text"value="<%=Ledgernotcollectmoney%>" readonly="readonly" />
		
		
	</div>
<!-- END -->
<!--거래처 추가 모달창(jsp 분리예정)  -->
		<div class="modal fade" id="layerpop1" >
  		<div class="modal-dialog">
    	<div class="modal-content">
      	<!-- header -->
        <div class="modal-header">
        <!-- header title -->
        <h4 class="modal-title">거래처 정보입력</h4>
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" onclick="modelheaderline()" data-dismiss="modal">×</button>
        </div>
        <!-- body -->
        <div class="modal-body">
		<!--부트스트랩을 사용하여 위 태그들은 초기태그들 입니다  -->
						<!--분리완료후 정렬예정  -->					
						<form action="accountAf.jsp" method="post">
							 거래처명:<input type="text" name="companyname">
							대표자:<input type="text" name="ceoname"> <br> 업태:<input
								type="text" name="condition"> <br> 종목:<input
								type="text" name="kinds"> <br> 사업자등록번호:<input
								type="text" name="companynum"> <br> 우편번호:<input
								type="text" id="address1" name="address1"> <input
								type="button" value="찾기" id="" name=""
								onClick="sample6_execDaumPostcode()"> <br> 기본주소:<input
								type="text" id="address2" name="address2" size="50"> <br>
							하위주소:<input type="text" id="address3" name="address3" size="50">
							<br> 담당자:<input type="text" name="admin"> 이메일:<input
								type="text" id="" name="email"> <br> 전화:<input
								type="text" name="tel"> <br> 메모<br>
							<textarea rows="10" cols="40" name="memo"></textarea>
							<br> 홈페이지:<input type="text" name="homepage"> <br>
							<div class="modal-footer">
								<button type="submit"class="btn btn-default">저장버튼</button>
								<button type="button" class="btn btn-default"
								 onclick="modelheaderline()"   data-dismiss="modal">취소버튼</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	
<div class="modal1 fade" id="layerpop1" >
  		<div class="modal-dialog">
    	<div class="modal-content">
      	<!-- header -->
        <div class="modal-header">
        <!-- header title -->
        <h4 class="modal-title">거래처 정보입력</h4>
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <!-- body -->
        <div class="modal-body">
		<!--부트스트랩을 사용하여 위 태그들은 초기태그들 입니다  -->
						<!--분리완료후 정렬예정  -->					
						
							</div>
						
					</div>
				</div>
			</div>
	








		
			<!--자바스크립트  -->
	<script src="./tradeBook.js"></script>
</body>

</html>

