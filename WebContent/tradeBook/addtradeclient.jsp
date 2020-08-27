<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="style.css" type="text/css">
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
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
					<form action="./addtradeclientAf.jsp" method="get" target="param">
						<div class="clientAdd">거래처명:</div><input class="add" type="text" name="companyname">
						대표자:<input class="add"type="text" name="ceoname"> <br> 
						<div class="clientAdd">업태:</div><input class="add"type="text" name="condition"> 
						이메일:<input class="add"type="text" id="" name="email"> <br> 
						<div class="clientAdd">종목:</div><input class="add"type="text" name="kinds"> <br>
						<div class="clientAdd">사업자등록번호:</div><input class="add"type="text" name="companynum"> <br> 
						<div class="clientAdd">우편번호:</div><input class="add"type="text" id="address1" name="address1" readonly="readonly"> 
						<button type="button"  id="" name=""onClick="postNum()"><span class="glyphicon glyphicon-search" aria-hidden="true">찾기</span></button> <br>
						<div class="clientAdd">기본주소:</div><input class="add"type="text" id="address2" name="address2" size="50"readonly="readonly"> <br>
						<div class="clientAdd">하위주소:</div><input class="add"type="text" id="address3" name="address3" size="50"><br>
						<div class="clientAdd">담당자:</div><input class="add"type="text" name="admin"><br> 
						<div class="clientAdd">전화:</div><input class="add"type="text" name="tel"> <br> 
						<div class="clientAdd">메모:</div><br><textarea rows="10" cols="40" name="memo"></textarea><br>
						홈페이지:<input class="add"type="text" name="homepage"> <br>
						
						<div class="modal-footer">
							<button type="submit"class="btn btn-default">저장</button>
							<button type="button"class="btn btn-default"onclick="modelheaderline();"data-dismiss="modal">취소</button>
						</div>
					</form>
					<iframe id="if" name="param"></iframe>
				</div>
			</div>
		</div>
	</body>
</html>
