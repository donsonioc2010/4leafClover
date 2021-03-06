<%@page import="buyer.BuyerDto"%>
<%@page import="java.util.List"%>
<%@page import="buyer.BuyerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String id = null;
	
	if(session.getAttribute("login")==null){response.sendRedirect("../login/login.jsp");}
	else{id = (String)session.getAttribute("login");}
	
	BuyerDao dao = BuyerDao.getInstance();
	
	// 검색하기 /word가 단어 category가 항목
	String search = request.getParameter("word");
	String choice = request.getParameter("category");
	String sellerId = (String)session.getAttribute("login");
	List<BuyerDto>list = null;
	
	if(search == null){list = dao.getBuyerList(id);}
	else if(search!=null){list = dao.getBuyerList(choice, search,id);}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>거래처 관리</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>                <%--제이쿼리 추가 --%>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>		
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>             <%--우편추가 --%>
		<script src='./getPostNum.js'></script>
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	  
 		<link rel="stylesheet" href="../init.css"/>  
 		<link rel="stylesheet" href="./account.css"/>  
	</head>
	<body>
		<%if(id!=null){ %>
			<jsp:include page="../navigation.jsp" />
		<%} %>
		<div class='wrap1'align='center'>
			<div class="searchclass">
				<div align="center">
					찾기:<input type="text" id="search" name="searchword"> 
						<select id="choice" name="choice">
							<option value="companyname">거래처명</option>
							<option value="ceoname">대표자</option>
							<option value="companynum">사업자 번호</option>
						</select> 
					<button onclick="searchBuyer()" id="searchbtn" class="btn btn-primary">검색</button>
				</div>
			    
				<br>
				
				<%--거래처 리스트 --%>
				<div class="list" align="left" style="overflow:auto; width:500px; height:350px;"> 
					<table border="1"  class="list">
						<col width="50"><col width="150"><col width="150"><col width="150">
						<thead>
						<tr id="listhead">
							<th>번호</th>
							<th>거래처명</th>
							<th>대표자</th>
							<th>사업자번호</th>
						</tr>
						</thead>
						<%if(list == null || list.size() == 0){%>
						<tr>
							<td colspan="4" align="center">거래처목록이 없습니다</td>
						</tr>
						<%}else{
								for(int i = 0; i < list.size(); i++){
									BuyerDto dto = list.get(i);
						%>
						<tr id="a" onclick="getInfo(<%=dto.getBuyer_seq()%>)">
							<td align="center"><%=i + 1 %></td>
							<td align="center"><%=dto.getBuyer_company_name()%></td>
							<td align="center"><%=dto.getBuyer_ceo()%></td>
							<td align="center"><%=dto.getBuyer_company_num() %></td>	
						</tr>
						<% }
						}
						%>
					</table>
				</div>
				<div align="right"> <%--거래처정보 수정및정보 --%>
					<form action="accountupdateAf.jsp"method="post">
					<input type='hidden'id='updateBuyerSeq'name='updateBuyerSeq'>
					<table>
						<tr>
							<td>거래처명:</td>
							<td><input type="text"id="companyname"name="companyname"size="20"class="add"></td>
							<td>대표자:</td>
							<td><input type="text"id="ceoname"name="ceoname"size="10"class="add"></td>
						</tr>
						
						<tr>
							<td>업태:</td>
							<td><input type="text"id="condition"name="condition"size="10"class="add"></td>
							<td>종목:</td>
							<td><input type="text"id="kinds"name="kinds"size="10"class="add"></td>
						</tr>
						
						<tr>
							<td>사업자등록번호:</td>
							<td><input type="text"id="companynum"name="companynum"class="add"></td>
							<td>우편번호:</td>
							<td><input type="text"id="address1"name="address1"class="add"  readonly="readonly"> 
							<button type="button"onClick="postNum()"id="addressbtn" class="glyphicon glyphicon-search" >찾기
							</button></td>
						</tr>
						
						<tr>
							<td>기본주소:</td>
							<td><input type="text"size="50"id="address2"name="address2"class="add" readonly="readonly"></td>
							<td>하위주소:</td>
							<td><input type="text"size="50"id="address3"name="address3"class="add"></td>
						</tr>
						
						<tr>
							<td>담당자:</td>
							<td><input type="text"id="admin"name="admin"size="10"class="add"></td>
							<td>이메일:</td>
							<td><input type="text"id="email"name="email"class="add"></td>
						</tr>
						
						<tr>
							<td>전화:</td>
							<td><input type="text"id="telnum"name="telnum"class="add"></td>
							<td>거래게시일:</td>
							<td><input type="text"id="firstday"name="firstday"size="10"class="add"readonly></td>
						</tr>
						
						<tr>
							<td>홈페이지:</td>
							<td><input type="text"id="homepage"name="homepage"class="add"></td>
							<td>메모:</td>
							<td colspan="4">
							<textarea rows="5"cols="100"id="memo"name="memo"class="add"style="resize:none;border:1"></textarea></td>
						</tr>
					</table>
					<button type="button"id="addbtn"name="add" onclick='popAddBuyer()' class="btn btn-primary">거래처추가</button> 
					 <button type="submit" id="updatebtn" name="update" class="btn btn-primary">거래처수정</button> 
					 <button type="button" id="delbtn" name="del" class="btn btn-primary">거래처삭제</button> 
					</form>	
				</div>
			</div>
		</div>
		<script src='./account.js'></script>
		<script>
		$(document).ready(function () {
			 $("#addbtn").click(function () { // 추가
				location.href = "./accountadd.jsp";
			}); 
			$("#delbtn").click(function () { // 삭제
				location.href = "./accountdelete.jsp?id=" + $("#id").text()+"&companyName="+document.getElementsByName('companyname')[0].value
			});
		});
		</script>
	</body>
</html>