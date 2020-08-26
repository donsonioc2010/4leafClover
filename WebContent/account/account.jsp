<%@page import="buyer.BuyerDto"%>
<%@page import="java.util.List"%>
<%@page import="buyer.BuyerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String id = (String)session.getAttribute("login");
if(id==null){
	response.sendRedirect("../login/login.jsp");
}
BuyerDao dao = BuyerDao.getInstance();

// 검색하기 /word가 단어 category가 항목
String search = request.getParameter("word");
String choice = request.getParameter("category");
String sellerId = (String)session.getAttribute("login");
List<BuyerDto>list = null;

if(search == null){
	list = dao.getBuyerList(id);
}else if(search!=null){
	list = dao.getBuyerList(choice, search,id);
}
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
 		<link rel="stylesheet" href="../init.css?after"/>  
 		<link rel="stylesheet" href="./account.css?after"/> 
 		
 		 
 	<%--팝업창 --%>
 	<script type="text/javascript">
        function insertPopup() {
            // window.name = "부모창 이름";            
            window.name = "MemberServlet.do";
            
            // window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
            window.open("accountChild.jsp", "insert",
                    "width = 600, height = 500, resizable = no, scrollbars = no, status = no");
        }
    </script>
    
    
	</head>
	<body>
	<%if(id!=null){ %>
		<jsp:include page="../navigation.jsp"></jsp:include>
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
					<tr id="a" onclick="getInfo(<%=dto.getBuyer_seq()%>)" ondblclick="insertPopup()">
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
			
			
			
			<%--지도 추가 --%>
			<div id="map" style="width:600px;height:350px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=43b88cf3a7d7bdc297525273ce6a7468"></script>
			<script>
			var container = document.getElementById('map');
			var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
			};

			var map = new kakao.maps.Map(container, options);
			</script>
			
			
		</div>
	</div>
		<script>
		function searchBuyer() {
			//Ajax로 비동기통신으로 HTML 받아서TABLE에 적용하기
			var choice = document.getElementById("choice").value;
			var search = document.getElementById("search").value;
			if(search.trim()!=""){
			 	location.href = "./account.jsp?word=" + search + "&category=" + choice; // 내가 검색한 항목 
			}else{
				location.href = "./account.jsp"; // 검색하지 않았을 경우 원래 페이지로
			}
		}
		
		</script>
	</body>
</html>