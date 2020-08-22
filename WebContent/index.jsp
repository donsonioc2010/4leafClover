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
		<title>Main</title>
		<link rel="stylesheet" href="./init.css" />
        <style>
        .extendHeight{
            height:90%;
        }
        .quickMenu{
            position:absolute;
            left:15%;
            top : 80px;
            width:70%;
            background-color:white;
            border-radius: 10%;
            border:3px;
            padding:20px;
        }
        .quickMenu table{
            width:100%;
            height:70%;
            border:0;
        }
        .quickMenu table th{
         	height:0;
         }
        .quickMenu table th .extendHeight{
            height: 90%;
            width:100%;
        }
        .quickMenu table th img{
        	height:100%;
        	width:100%;
        }
        .quickMenu table th a{
        	text-decoration: none;
        }
        .quickMenu table th span{
            height:10%;
        }  
        </style>
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
                        <a href='#'>
                            <div class='extendHeight'>
                                <img alt="" src="./image/quickMenu/addProductIcon.svg">
                            </div>
                            <span class='menuExp'>상품 추가</span>
                        </a>
                    </th>
                    <th>
                        <a href='#'>
                            <div class='extendHeight'>
                                <img alt="" src="./image/quickMenu/sorryIcon.svg">
                            </div>
                            <span class='menuExp'>준비중 </span>
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
        </div> 
	</body>
</html>