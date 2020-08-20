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
   	totalDao dao = totalDao.getInstance();
  	List<totalYYYYDto> list_year = dao.getYearTotalAvg("test1");
  	List<totalMMDto> list_month = dao.getMonthTotalAvg("test1");
  	totalYYYYDto dto_year = null;
  	totalMMDto dto_month = null;

   for(int i = 0; i< list_month.size(); i++){
   	dto_month = list_month.get(i);
   } 

   for(int i = 0; i< list_year.size(); i++){
   	dto_year = list_year.get(i);
   }
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>총 매출 조회</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="../init.css" />
</head>
<body>

<center class="container">
<form class="totalClass">
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

		<td><%=dto_year.getYear_total_avg() %></td>
		<td><%=dto_year.getYear_collect_money_avg() %></td>
		<td><%=dto_year.getYear_not_conllect_money_avg() %></td>
	</tr>
	<tr>
	<td colspan="3"></td>
	</tr>
	<tr>
		<th class="word">금월 매출</th>
		<th class="word">금월 수금</th>
		<th class="word">금월 미수금</th>
	<tr>	
		<td><%=dto_month.getMonth_total_avg() %></td>
		<td><%=dto_month.getMonth_collect_money_avg() %></td>
		<td><%=dto_month.getMonth_not_conllect_money_avg() %></td>
	</tr>

	</table>
	</div>
</div>
</form>
</center>
<script src="total.js"></script>
</body>
</html>