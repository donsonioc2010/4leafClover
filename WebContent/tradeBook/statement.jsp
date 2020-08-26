<%@page import="java.text.DecimalFormat"%>
<%@page import="orderlistbills.orderlistbillsDto"%>
<%@page import="orderlistbills.companyInform"%>
<%@page import="java.util.List"%>
<%@page import="orderlistbills.orderlistbillsDao"%>
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
orderlistbillsDto dto= null;
companyInform cDto = null;
request.setCharacterEncoding("utf-8");
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
System.out.println(year+""+month+""+day);
String rdate = year + UtilEx.two(month) + UtilEx.two(day);
int seq = Integer.parseInt(request.getParameter("seq"));
System.out.println(seq);
orderlistbillsDao dao = orderlistbillsDao.getInstance();
List<companyInform> infomList = dao.getBillsInform(rdate,seq);

String spageNumber = request.getParameter("pageNumber");

int pageNumber = 0;
if(spageNumber != null && !spageNumber.equals("")){
	pageNumber = Integer.parseInt(spageNumber);
}
List<orderlistbillsDto> list = dao.getBillsList(pageNumber, seq, rdate);		// pageNum, buyer_seq, orderDate


int len = dao.getAllList(seq, rdate);

int listPage = len/10;
if(len % 10 > 0){
	listPage++;
}

for(int i = 0; i< list.size(); i++){
	System.out.println("list"+list.get(i).toString());
	dto = list.get(i);
}

// dto에 값이 없을 경우 되돌아 감
if(dto.getOrder_total() == 0){
	response.sendRedirect("../order/MainOrder.jsp");
}
DecimalFormat df = new DecimalFormat("###,###");
int total = dto.getOrder_total();


for(int i = 0; i< infomList.size(); i++){
	cDto = infomList.get(i);
}


String standard =null;
if(dto.getProduct_standard() == null){
	standard = "";
}else{
	standard = dto.getProduct_standard();
}
%>

<link rel="stylesheet" href="./orderlistbills.css" />

<div class="modal-dialog">
	<div class="modal-content">
	   	<!-- header -->
		<div class="modal-header">
		<!-- header title -->
			<h4 class="modal-title">거래처 명세서출력</h4>
			<!-- 닫기(x) 버튼 -->
			<button type="button" class="close" onclick="modelheaderline()" data-dismiss="modal">×</button>
		</div>
		<!-- body -->
		<div class="modal-body">
		<!--부트스트랩을 사용하여 위 태그들은 초기태그들 입니다  -->
		<!--분리완료후 정렬예정  -->					
	  <div align='center' id="printer">
			<div id="command_bar">
			  A4용지를 준비하고 인쇄버튼을 클릭하세요. &nbsp; <input type="button" value="인쇄하기" onclick="printNow()" /> <input type="button" value="뒤로" onclick="window.close()" />
			</div>
			<input type="hidden" id="seq" value="<%=seq%>">
			<input type="hidden"id='dtoPageNum'value='<%=pageNumber%>'>
			<input type="hidden"id='dtoOrderDate'value='<%=dto.getOrder_date()%>'>
			
		    <table border="0" cellpadding="0" cellspacing="0" id="sheet0" class="sheet0 gridlines">
		      <col class="col0" /><col class="col1" /><col class="col2" /><col class="col3" /><col class="col4" />
		      <col class="col5" /><col class="col6" /><col class="col7" /><col class="col8" /><col class="col9" />
		      <col class="col10" />
		      <tbody>
		        <tr class="row0">
		          <td class="column0 style47 s style38" colspan="5">
			          <span style="color: #000000; font-family: '맑은 고딕'; font-size: 20pt;">거래명세서</span>
			          <span style="color: #000000; font-family: '맑은 고딕'; font-size: 11pt;">
			              (공급자용)
			          </span>
		          </td>
		          <td class="column5 style38 s style38">거래일</td>
		          <td class="column6 style38 null style38" colspan="3"><%=dto.getOrder_date() %></td>
		          <td class="column9 style38 s style38">페이지</td>
		          <td class="column10 style39 null style39"><%=pageNumber +1 %></td>
		        </tr>
		        
		        <tr class="row2">
		          <td class="column0 style49 s style51" colspan="5">공급받는자</td>
		          <td class="column5 style49 s style52" colspan="6">공급자</td>
		        </tr>
		        
		        <tr class="row3">
		          <td class="column0 style3 s">상호</td>
		          <td class="column1 style33 null style44" colspan="4"><%=cDto.getBuyer_company_name() %></td>
		          <td class="column5 style3 s">상호</td>
		          <td class="column6 style33 null style33" colspan="2"><%=cDto.getSeller_company_name() %></td>
		          <td class="column8 style1 s">번호</td>
		          <td class="column9 style33 null style34" colspan="2"><%=cDto.getSeller_tel() %></td>
		        </tr>
		        
		        <tr class="row4">
		          <td class="column0 style3 s" rowspan="2">주소</td>
		          <td class="column1 style33 null style44" colspan="4" rowspan="2"><%=cDto.getBuyer_address() %></td>
		          <td class="column5 style3 s">이름</td>
		          <td class="column6 style33 null style33" colspan="2"><%=cDto.getSeller_ceo() %></td>
		          <td class="column8 style1 s">전화</td>
		          <td class="column9 style33 null style34" colspan="2"><%=cDto.getSeller_phone() %></td>
		        </tr>
		        
		        <tr class="row5">
		          <td class="column5 style40 s style40">주소</td>
		          <td class="column6 style33 null style34" colspan="5"><%=cDto.getAddress() %></td>
		        </tr>
		        
		        
		        <tr class="row8">
		          <td class="column0 style42 s style43" colspan="3">품명</td>
		          <td class="column3 style43 s style43" colspan="2">규격</td>
		          <td class="column5 style8 s">단위</td>
		          <td class="column6 style43 s style43" colspan="2">수량</td>
		          <td class="column8 style43 s style43" colspan="2">단가</td>
		          <td class="column10 style9 s">금액</td>
		        </tr>
		
		
	            <tr class="row9">
		          <td class="column0 style40 null style33" colspan="3"><span name = "productName"></span></td>
		          <td class="column3 style33 null style33" colspan="2"><span name = "productUnit"></span></td>
		          <td class="column5 style2 null"><span name = "productStandard"></span></td>
		          <td class="column6 style2 null"><span ></span></td>
		          <td class="column7 style2 null"><span name = "productCount"></span></td>
		          <td class="column8 style2 null"><span ></span></td>
		          <td class="column9 style2 null"><span name="producTrPrice"></span></td>
		          <td class="column10 style4 null"><span name="productPrice"></span></td>
		        </tr>
		        
		        <tr class="row10">
		          <td class="column0 style40 null style33" colspan="3"><span name = "productName"></span></td>
		          <td class="column3 style33 null style33" colspan="2"><span name = "productUnit"></span></td>
		          <td class="column5 style2 null"><span name = "productStandard"></span></td>
		          <td class="column6 style2 null"><span ></span></td>
		          <td class="column7 style2 null"><span name = "productCount"></span></td>
		          <td class="column8 style2 null"><span "></span></td>
		          <td class="column9 style2 null"><span name="producTrPrice"></span></td>
		          <td class="column10 style4 null"><span name="productPrice"></span></td>
		        </tr>
		        
		        <tr class="row11">
		          <td class="column0 style40 null style33" colspan="3"><span name = "productName"></span></td>
		          <td class="column3 style33 null style33" colspan="2"><span name = "productUnit"></span></td>
		          <td class="column5 style2 null"><span name = "productStandard"></span></td>
		          <td class="column6 style2 null"> </td>
		          <td class="column7 style2 null"><span name = "productCount"></span></td>
		          <td class="column8 style2 null"> </td>
		          <td class="column9 style2 null"><span name="producTrPrice"></span></td>
		          <td class="column10 style4 null"><span name="productPrice"></span></td>
		        </tr>
		        <tr class="row12">
		          <td class="column0 style40 null style33" colspan="3"><span name = "productName"></span></td>
		          <td class="column3 style33 null style33" colspan="2"><span name = "productUnit"></span></td>
		          <td class="column5 style2 null"><span name = "productStandard"></span></td>
		          <td class="column6 style2 null"><span id="row4"></span></td>
		          <td class="column7 style2 null"><span name = "productCount"></span></td>
		          <td class="column8 style2 null"><span id="row4"></span></td>
		          <td class="column9 style2 null"><span name="producTrPrice"></span></td>
		          <td class="column10 style4 null"><span name="productPrice"></span></td>
		        </tr>
		        
		        <tr class="row13">
		          <td class="column0 style40 null style33" colspan="3"><span name = "productName"></span></td>
		          <td class="column3 style33 null style33" colspan="2"><span name = "productUnit"></span></td>
		          <td class="column5 style2 null"><span name = "productStandard"></span></td>
		          <td class="column6 style2 null"><span id="row5"></span></td>
		          <td class="column7 style2 null"><span name = "productCount"></span></td>
		          <td class="column8 style2 null"><span id="row5"></span></td>
		          <td class="column9 style2 null"><span name="producTrPrice"></span></td>
		          <td class="column10 style4 null"><span name="productPrice"></span></td>
		        </tr>
		        
		        <tr class="row14">
		          <td class="column0 style40 null style33" colspan="3"><span name = "productName"></span></td>
		          <td class="column3 style33 null style33" colspan="2"><span name = "productUnit"></span></td>
		          <td class="column5 style2 null"><span name = "productStandard"></span></td>
		          <td class="column6 style2 null"><span id="row6"></span></td>
		          <td class="column7 style2 null"><span name = "productCount"></span></td>
		          <td class="column8 style2 null"><span id="row6"></span></td>
		          <td class="column9 style2 null"><span name="producTrPrice"></span></td>
		          <td class="column10 style4 null"><span name="productPrice"></span></td>
		        </tr>
		        
		        <tr class="row15">
		          <td class="column0 style40 null style33" colspan="3"><span name = "productName"></span></td>
		          <td class="column3 style33 null style33" colspan="2"><span name = "productUnit"></span></td>
		          <td class="column5 style2 null"><span name = "productStandard"></span></td>
		          <td class="column6 style2 null"><span id="row6"></span></td>
		          <td class="column7 style2 null"><span name = "productCount"></span></td>
		          <td class="column8 style2 null"><span id="row6"></span></td>
		          <td class="column9 style2 null"><span name="producTrPrice"></span></td>
		          <td class="column10 style4 null"><span name="productPrice"></span></td>
		        </tr>
		        
		        <tr class="row16">
		          <td class="column0 style40 null style33" colspan="3"><span name = "productName"></span></td>
		          <td class="column3 style33 null style33" colspan="2"><span name = "productUnit"></span></td>
		          <td class="column5 style2 null"><span name = "productStandard"></span></td>
		          <td class="column6 style2 null"><span id="row7"></span></td>
		          <td class="column7 style2 null"><span name = "productCount"></span></td>
		          <td class="column8 style2 null"><span id="row7"></span></td>
		          <td class="column9 style2 null"><span name="producTrPrice"></span></td>
		          <td class="column10 style4 null"><span name="productPrice"></span></td>
		        </tr>
		        
		        <tr class="row17">
		          <td class="column0 style40 null style33" colspan="3"><span name = "productName"></span></td>
		          <td class="column3 style33 null style33" colspan="2"><span name = "productUnit"></span></td>
		          <td class="column5 style2 null"><span name = "productStandard"></span></td>
		          <td class="column6 style2 null"><span id="row7"></span></td>
		          <td class="column7 style2 null"><span name = "productCount"></span></td>
		          <td class="column8 style2 null"><span id="row7"></span></td>
		          <td class="column9 style2 null"><span name="producTrPrice"></span></td>
		          <td class="column10 style4 null"><span name="productPrice"></span></td>
		        </tr>
		        
		        <tr class="row18">
		          <td class="column0 style41 null style37" colspan="3"><span name = "productName"></span></td>
		          <td class="column3 style37 null style37" colspan="2"><span name = "productUnit"></span></td>
		          <td class="column5 style10 null"><span name = "productStandard"></span></td>
		          <td class="column6 style10 null"><span id="row8"></span></td>
		          <td class="column7 style10 null"><span name = "productCount"></span></td>
		          <td class="column8 style10 null"><span id="row8"></span></td>
		          <td class="column9 style10 null"><span name="producTrPrice"></span></td>
		          <td class="column10 style11 null"><span name="productPrice"></span></td>
		        </tr>
		    
		 <!-- ==================================================================================================== -->        
		        <tr class="row19">
		          <td class="column0 style12 s">합계금액</td>
		          <td class="column1 style38 null style38" colspan="2"><%=df.format(total) %>원</td>
		          <td class="column2 style2 s">수금액</td>
		          <td class="column3 style33 null style33" colspan="2"><%=dto.getOrder_collect_money() %></td>
		          <td class="column3 style38 null style39" colspan="6"></td>
		        </tr>
		<!--         <tr class="row20">
		          <td class="column0 style5 s">이전잔액</td>
		          <td class="column1 style2 null"></td>
		          <td class="column5 style2 s">매입잔액</td>
		          <td class="column6 style33 null style33" colspan="2"></td>
		          <td class="column8 style2 s">총잔액</td>
		          <td class="column9 style33 null style34" colspan="2"></td>
		        </tr> -->
		        <tr class="row21">
		          <td class="column0 style6 s">메모</td>
		          <td class="column1 style35 null style35" colspan="7"></td>
		          <td class="column8 style7 s">인수자</td>
		          <td class="column9 style35 null style36" colspan="2"></td>
		        </tr>
		      </tbody>
		    </table>
		    
			<div>
			<%for(int i = 0; i < listPage; i++){
				if(pageNumber == i){%>
					<span style="font-size: 10pt; color: black; font-weight: bold;">
						<strong><%=i+1 %></strong>
					</span>
				<%}else{%>|
					<a href="#none" title="<%=i+1%>페이지" onclick="goPage(<%=i%>)"
						style="font-size: 10pt; color: black; font-weight: black; text-decoration: none">
						<%=i+1 %>
					</a>|
				<%}
			}%>
			</div>
		</div>
		</div>
	</div>
</div>
<script type="text/javascript">
		window.resizeTo (800, 570);
		window.focus();
		
		function printNow() {
		  document.getElementById('command_bar').style.display = 'none';
		  
		  window.onbeforeprint =function(){
			  document.body.innerHTML = document.getElementById('printer').innerHTML;
			    $('body').css("background", "white");
		  }
		  
		  window.print();
		}
		function goPage(pageNum) {
			location.href = "statement.jsp?buyerSeq="+<%=seq%>+"&year="+<%=year%>+"&month="+<%=month %>+"&day="+<%=day%>+"&pageNumber="+pageNum;
		}
		
		$(document).ready(function(){
			//let order_date = order_date;
			$.ajax({
				type : 'POST',
				url : '../orderlistbills/addOrderBillList.jsp',
				datatype:'json',
				data:{
					"order_date":$('#dtoOrderDate').val().trim(),
					"rnum" : $('#dtoPageNum').val().trim(),
					"seq": $('#seq').val().trim()
					},
				success:function(data){
					
					
					let indexNum = document.getElementsByName('productName').length;	//productName 몇개있는지?
					let productName = document.getElementsByName('productName');
					let productUnit = document.getElementsByName('productUnit');
					let productStandard = document.getElementsByName('productStandard');
					let productCount = document.getElementsByName('productCount');
					let producTrPrice = document.getElementsByName('producTrPrice');
					let productPrice = document.getElementsByName('productPrice');
				
					for(i = 0; i<indexNum; i++){
						if(data[i].product_standard == null){data[i].product_standard = null}
						productName[i].innerHTML = data[i].product_name 
						productUnit[i].innerHTML = data[i].product_unit 
						productStandard[i].innerHTML = data[i].product_standard
						productCount[i].innerHTML = data[i].order_count 
						producTrPrice[i].innerHTML = data[i].product_trade_price 
						productPrice[i].innerHTML = data[i].price_sum  
					
					}
				}
			});
		});
		</script>