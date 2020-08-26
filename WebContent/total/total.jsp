<%@page import="java.text.DecimalFormat"%>
<%@page import="total.totalYYYYDto"%>
<%@page import="java.io.Console"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="total.totalMMDto"%>
<%@page import="java.util.List"%>
<%@page import="total.totalDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%-- <%-
Object ologin = session.getAttribute("login");
sellerDto seller = null;
if(ologin == null){
	%>
	<script type="text/javascript">
	alert("로그인 해 주십시오");
	location.href = "login.jsp";
	</script>	
	<%
}
seller = (sellerDto)ologin;

%> --%>   
<%
	String id = (String)session.getAttribute("login");
	if(id==null){
		response.sendRedirect("../login/login.jsp");
	} 

   	totalDao dao = totalDao.getInstance();
  	List<totalMMDto> list_month =  dao.getMonthTotalAvg(id);
  	List<totalYYYYDto> list_year =dao.getYearTotalAvg(id);
  	List<totalMMDto> listCor = dao.getCompanyTotal(id);
  	

  	totalYYYYDto dto_year = null;
  	totalMMDto dto_month = null;

   for(int i = 0; i< list_month.size(); i++){
   	dto_month = list_month.get(i);
   } 

   for(int i = 0; i< list_year.size(); i++){
   	dto_year = list_year.get(i);
   }
   
   DecimalFormat df = new DecimalFormat("###,###");
   %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>총 매출 조회</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
		<link rel="stylesheet" href="../init.css?after" />
		<link rel="stylesheet" href="./totalCss.css?after" />
	</head>
	<body>
	
		<%if(id!=null){ %>
			<jsp:include page="../navigation.jsp"></jsp:include>
		<%} %>
		<center class="container">
			<form class="totalClass" >
				<div class="input-group input-group-sm mb-3" id="mypageTable">
				<h3>매출 현황</h3>
					<div class="input-group-prepend">
						<table class="table table-sm">
							<tr>
								<th class="word">금년 매출</th>
								<th class="word">금년 수금</th>
								<th class="word">금년 미수금</th>
							</tr>
							
							<tr>
								<td>\<%=df.format(dto_month.getMonth_total_avg()) %></td>
								<td>\<%=df.format(dto_month.getMonth_collect_money_avg()) %></td>
								<td>\<%=df.format(dto_month.getMonth_not_conllect_money_avg()) %></td>
							</tr>
							
							<tr>
								<td colspan="3"></td>
							</tr>
							
							<tr>
								<th class="word">금월 매출</th>
								<th class="word">금월 수금</th>
								<th class="word">금월 미수금</th>
							
							<tr>
								<td>\<%=df.format(dto_year.getYear_total_avg()) %></td>
								<td>\<%=df.format(dto_year.getYear_collect_money_avg()) %></td>
								<td>\<%=df.format(dto_year.getYear_not_conllect_money_avg()) %></td>
							</tr>
					
						</table>
					</div>
				</div>
							<div class="list" id="listDiv" style="overflow:auto; width:500px; height:350px;"> 
				<table border="1"  class="list">
					<col width="50"><col width="150"><col width="150"><col width="150">
					<thead>
					<tr id="listhead">
						<th>번호</th>
						<th>거래처명</th>
						<th>총 매출</th>
						<th>수금액</th>
						<th>미수금액</th>
					</tr>
					</thead>
					<%if(listCor == null || listCor.size() == 0){%>
					<tr>
						<td colspan="4" align="center">거래처목록이 없습니다</td>
					</tr>
					<%}else{
							for(int i = 0; i < listCor.size(); i++){
								totalMMDto dto_cor = listCor.get(i);
					%>
					<tr>
						<td align="center"><%=i + 1 %></td>
						<td align="center">
							<%=dto_cor.getCompanyName()%>
						</td>
						<td align="center">&#8361;<%=df.format(dto_cor.getCompanyTotal())%></td>
						<td align="center">&#8361;<%=df.format(dto_cor.getCompanyCollect())%></td>
						<td align="center">&#8361;<%=df.format(dto_cor.getCompanyNotCollect()) %></td>	
					</tr>
					<% }
					}
					%>
				</table>
			</div>
			</form>
		</center>
		<script src="total.js"></script>
	</body>
</html>