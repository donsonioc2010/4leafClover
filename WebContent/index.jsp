<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = null;
if(session.getAttribute("login")==null){
	response.sendRedirect("./login/login.jsp");
}else{
	id = (String)session.getAttribute("login");
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Main</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./init.css" />
		<link rel="stylesheet" href="./index.css" />
	</head>
	<body>
		<%if(id!=null){ %>
			<jsp:include page="./navigation.jsp"></jsp:include>
		<%} %> 
        <div class='quickMenu'>
            <table>
                <col width='25%'><col width='25%'><col width='25%'><col width='25%'>
                <tr>
                    <th>
                        <a href='/ProductManagementSystem/account/account.jsp'>
                            <div class='extendHeight'>
                                <img alt="" src="./image/quickMenu/buyerIcon.svg">
                            </div>    
                            <span class='menuExp'>거래처 관리</span>
                        </a>
                    </th>
                    <th>
                        <a href='/ProductManagementSystem/product/product.jsp'>
                            <div class='extendHeight'>
                                <img alt="" src="./image/quickMenu/productIcon.svg">
                            </div>
                            <span class='menuExp'>품목 관리</span>
                        </a>
                    </th>
                    <th>
                        <a href='/ProductManagementSystem/tradeBook/tradeBooks.jsp'>
                            <div class='extendHeight'>
                                <img alt="" src="./image/quickMenu/listIcon.svg">
                            </div>
                            <span class='menuExp'>거래 원장</span>
                        </a>
                    </th>
                    <th>
                        <a href='/ProductManagementSystem/order/MainOrder.jsp'>
                            <div class='extendHeight'>
                                <img alt="" src="./image/quickMenu/orderIcon.svg">
                            </div>
                            <span class='menuExp'>전표 관리</span>
                        </a>
                    </th>
                </tr>
                <tr>
                <tr>
                    <th>
                        <a href='/ProductManagementSystem/account/accountadd.jsp'>
                            <div class='extendHeight'>
                                <img alt="" src="./image/quickMenu/addBuyerIcon.svg">
                            </div>    
                            <span class='menuExp'>거래처 추가</span>
                        </a>
                    </th>
                    <th>
                        <div id='addProductbtn'>
                            <div class='extendHeight'>
                                <img alt="" src="./image/quickMenu/addProductIcon.svg">
                            </div>
                            <span class='menuExp'>상품 추가</span>
                        </div>
                    </th>
                    <th>
                        <a href='/ProductManagementSystem/Introduction/introduction.jsp'>
                            <div class='extendHeight'>
                                <img alt="" src="./image/quickMenu/home.png">
                            </div>
                            <span class='menuExp'>회사 소개 </span>
                        </a>
                    </th>
                    <th>
                        <a href='#'>
                            <div class='extendHeight'>
                                <img alt="" src="./image/quickMenu/sorryIcon.svg">
                            </div>
                            <span class='menuExp'>준비중</span>
                        </a>
                    </th>
                </tr>
            </table>
            <script src='./product/product.js'type='application/javascript'></script>
        </div> 
	</body>
</html>