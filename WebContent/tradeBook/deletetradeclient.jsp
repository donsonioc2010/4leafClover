<%@page import="buyer.BuyerDto"%>
<%@page import="java.util.List"%>
<%@page import="buyer.BuyerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("login");
	if (id == null) {
		response.sendRedirect("../login/login.jsp");
	}
	BuyerDao dao = BuyerDao.getInstance();
	List<BuyerDto> list = null;
	list = dao.getBuyerList(id);
	BuyerDto dto = null;
%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="modal-dialog" style="margin: 10% auto;">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- header title -->
				<h4 class="modal-title">거래처 정보 삭제</h4>
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" onclick="modelheaderline()"
					data-dismiss="modal">×</button>
			</div>
			<!-- body -->
			<div class="modal-body" style="height: 500px">
				<!--부트스트랩을 사용하여 위 태그들은 초기태그들 입니다  -->
				<!--분리완료후 정렬예정  -->


				<div class="serchclass">
					<div class="panel-default">
						<div id="jb-content">
							<div class="componet">
									<form action="./deletetradeclientAf.jsp" method="get"
										target="param">
								<div class="tb_box">
										<table align="center" class="table table-condensed">
											<thead>
												<tr class="modalfixed_top" align='center'>
													<th>번호</th>
													<th>거래처명</th>
													<th>대표자</th>
													<th>사업자번호</th>
												</tr>
											</thead>
											<tbody class='modals' id='contentList'>
												<%
													if (list == null || list.size() == 0) {
												%>
												<tr>
													<td colspan="4" align="center">거래처목록이 없습니다</td>
												</tr>
												<%
													} else {
														for (int i = 0; i < list.size(); i++) {
															dto = list.get(i);
												%>
												<tr class='modals' align="center"
													onclick="companyName('<%=dto.getBuyer_company_name()%>')">
													<td><%=i + 1%></td>
													<td><%=dto.getBuyer_company_name()%></td>
													<td><%=dto.getBuyer_ceo()%></td>
													<td><%=dto.getBuyer_company_num()%></td>
												</tr>
												<%
													}
													}
												%>
												<input type='hidden' id='company' name='company' value='#'>
											</tbody>
										</table>
								</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-default">삭제</button>
											<button type="button" class="btn btn-default"
												onclick="modelheaderline();" data-dismiss="modal">취소</button>
										</div>
									</form>
							</div>
						</div>
					</div>
				</div>
				

			</div>
			<iframe id="if" name="param"></iframe>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$(".modals tr").click(function() {
				$(".modals").removeClass("mouseleave, mouseenter, selected");
				$(".modals").addClass("mouseleave");
				$(this).addClass("selected").removeClass("mouseleave");
			});
		});
		function ifun() {
			location.href = './tradeBooks.jsp';
		}

		function companyName(names) {

			document.getElementById('company').setAttribute('value', names)

		}
	</script>

</body>
</html>
