<%@page import="myPageSeller.sellerDao"%>
<%@page import="myPageSeller.sellerDto"%>
<%@page import="java.util.List"%>
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
	response.sendRedirect("./login/login.jsp");
}


sellerDao dao = sellerDao.getInstance();
List<sellerDto> list = dao.getSellerInform("test2");

sellerDto dto = null;
int count =0;
int trade_price = 0;
for(int i = 0; i< list.size(); i++){
	dto = list.get(i);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회/수정</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="./init.css" /> -->
<link rel="stylesheet" href="./myPageCss.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Epilogue:ital,wght@1,900&family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<body String id = (String)session.getAttribute("login");
if(id==null){
	response.sendRedirect("./login/login.jsp");
}
>
<!-- 
form으로 감싸기
가장 상위 div class="input-group input-group-sm mb-3"  id="mypageTable"
table class="table table-sm"
 -->
<%if(id!=null){ %>
		<jsp:include page="./navigation.jsp"></jsp:include>
<%} %>
<div class="container" align="center">
<form action="myPage_save.jsp" class="myPageClass">
<div class="input-group input-group-sm mb-3" id="mypageTable">
	<p align="center">My Page</p>
	<div class="input-group-prepend">
	<table class="table table-sm">
	<tr>
		<td scope="col">상호</td>
		<td scope="row"><input type="text" class="input" name="companyName" value="<%=dto.getCompanyName()%>"></td>
	</tr>
	<tr>
		<td scope="col">사업자 번호</td>
		<td scope="row"><input type="text" class="input" name="companyNumber" value="<%=dto.getCompanyNumber()%>"></td>
	</tr>
	<tr>
		<td scope="col">업태</td>
		<td scope="row"><input type="text" class="input" name="businessCondition" value="<%=dto.getBusinessCondition()%>"></td>
	</tr>
	<tr>
		<td scope="col">종목</td>
		<td scope="row"><input type="text" class="input" name="businessKind" value="<%=dto.getBusinessKind()%>"></td>
	</tr>
	<tr>
		<td scope="col">대표자</td>
		<td scope="row"><input type="text" class="input" name="ceo" value="<%=dto.getCeo()%>"></td>
	</tr>
	<tr>
		<td scope="col">우편번호</td>
		<td scope="row"><input type="text" class="input" name="address1" id="address1" value="<%=dto.getAddress1()%>"readonly>
		<input type="button" value="우편번호" class="btn btn-outline-dark" id="postBtn" onclick="getPostNum();">
		</td>
		
	</tr>
	<tr>
		<td scope="col">사업장 주소</td>
		<td scope="row"><input type="text" class="input" name="address2" value="<%=dto.getAddress2()%>" readonly></td>
	</tr>
	<tr>
		<td scope="col"></td>
		<td scope="row"><input type="text" class="input" name="address3" value="<%=dto.getAddress3()%>"></td>
	</tr>
	<tr>
		<td scope="col">전화</td>
		<td scope="row"><input type="text" class="input" name="tel" value="<%=dto.getTel()%>"></td>
	</tr>
	<tr>
		<td scope="col">휴대전화</td>
		<td scope="row"><input type="text" class="input" name="phone" value="<%=dto.getPhone()%>"></td>
	</tr>
	<tr>
		<td scope="col">이메일</td>
		<td scope="row"><input type="text" class="input" name="email" value="<%=dto.getEmail()%>"></td>
	</tr>
	<tr>
		<td scope="col" colspan="2"><center>
			<input type="submit" id="saveBtn" value="저장" class="btn btn-primary">
			<input type="reset" id="cancelBtn" class="btn btn-secondary" value="취소">
		</center></td>
	</tr>
	</table>
	</div>
</div>
</form>
</div>
<script src="./myPage.js"></script>


</body>
</html>











