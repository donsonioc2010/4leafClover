<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id = (String)session.getAttribute("login");
if(id==null){
	response.sendRedirect("./login/login.jsp");
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>거래처 추가</title>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 			<%--우편찾기  --%>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	<%--bootstrap 아이콘추가 --%>
	    <link rel="stylesheet" href="../init.css"/>
    	<link rel="stylesheet" href="./account.css" />
		<script src='./getPostNum.js'></script>
		</head>
		
	<body>
	<%if(id!=null){ %>
		<jsp:include page="../navigation.jsp"></jsp:include>
	<%} %>
	<center>
	<div class="addclass" id="accountdiv">
		<form action="accountAf.jsp" method="post">
		  <table>
		  	<tr>
		  		<th colspan='4'>
		  			<h3>거래처 추가</h3>
		  		</th>
		  	</tr>
			<tr>
				<td>거래처명:</td>
				<td><input type="text" name="companyname" class="add"></td>
				<td>대표자:</td>
				<td><input type="text" name="ceoname" class="add"></td>
			</tr>
			<tr>
				<td>업태:</td>
				<td><input type="text" name="condition" class="add"></td>
				<td>종목:</td>
				<td><input type="text" name="kinds" size="10" class="add"></td>
			</tr>
			<tr>
				<td>사업자등록번호:</td>
				<td><input type="text" name="companynum" class="add"></td>
				<td>우편번호:</td>
				<td><input type="text" id="address1" name="address1" class="add" readonly="readonly"> 
				<button type="button"onClick="postNum()"id="addressbtn"class="glyphicon glyphicon-search" >찾기</button></td>
			</tr>
			<tr>
				<td>기본주소:</td>
				<td><input type="text" size="50" id="address2" name="address2"  class="add" readonly="readonly"></td>
				<td>하위주소:</td>
				<td><input type="text" size="50" id="address3" name="address3"  class="add" size=></td>
			</tr>
			<tr>
				<td>담당자:</td>
				<td><input type="text" name="admin" size="10" class="add"></td>
				<td>이메일:</td>
				<td><input type="text" name="email" class="add"></td>
			</tr>
			<tr>
				<td>전화:</td>
				<td><input type="text" name="telnum" class="add"></td>
			</tr>
			<tr>
				<td>홈페이지:</td>
				<td><input type="text" name="homepage" class="add"></td>
				<td>메모:</td>
				<td colspan="4">
					<textarea rows="5" cols="100" name="memo" class="add" style="resize: none; border: 1"></textarea>
				</td>
			</tr>
		</table>
			<div align="center">
			<button type="submit" class="btn btn-primary" id="btn" >저장</button>
			</div>
		</form>
	</div>
	</center>
</body>
</html>