<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	</head>
	<body>
	<!--거래처 추가 모달창(jsp 분리예정)  -->
		<div class="modal fade" id="layerpop" >
			<div class="modal-dialog">
		  		<div class="modal-content">
		    	<!-- header -->
		      		<div class="modal-header">
		      			<!-- header title -->
		      			<h4 class="modal-title">거래처 정보입력</h4>
	      				<!-- 닫기(x) 버튼 -->
	      				<button type="button" class="close" onclick="fuck()" data-dismiss="modal">×</button>
		      		</div>
		      		<!-- body -->
		        	<div class="modal-body">
					<!--부트스트랩을 사용하여 위 태그들은 초기태그들 입니다  -->
							<!--분리완료후 정렬예정  -->					
						<form action="accountAf.jsp" method="post">
							거래처명:<input type="text" name="companyname">
							대표자:<input type="text" name="ceoname"> <br> 
							업태:<input type="text" name="condition"> <br> 
							종목:<input type="text" name="kinds"> <br> 
							사업자등록번호:<input type="text" name="companynum"> <br> 
							우편번호:<input type="text" id="address1" name="address1"> 
							<input type="button" value="찾기" id="" name=""onClick="sample6_execDaumPostcode()"> <br> 
							기본주소:<input type="text" id="address2" name="address2" size="50"> <br>
							하위주소:<input type="text" id="address3" name="address3" size="50"><br> 
							담당자:<input type="text" name="admin"> 
							이메일:<input type="text" id="" name="email"> <br> 
							전화:<input type="text" name="tel"> <br> 
							메모<br><textarea rows="10" cols="40" name="memo"></textarea><br> 
							홈페이지:<input type="text" name="homepage"> <br>
							<div class="modal-footer">
								<button type="submit"class="btn btn-default">저장버튼</button>
								<button type="button" class="btn btn-default"onclick="fuck()"data-dismiss="modal">
									취소버튼<!-- 변수명 변경해주세요 -->
								</button>
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
	</body>
</html>