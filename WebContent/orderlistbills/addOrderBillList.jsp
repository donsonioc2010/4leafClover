<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="orderlistbills.orderlistbillsDto"%>
<%@page import="java.util.List"%>
<%@page import="orderlistbills.orderlistbillsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

String order_date = request.getParameter("order_date");
int pageNumber = Integer.parseInt(request.getParameter("rnum"));
int seq = Integer.parseInt(request.getParameter("seq"));

System.out.println("order_date:"+order_date);
System.out.println("pageNumber:"+pageNumber);
System.out.println("seq:"+seq);


orderlistbillsDao dao = orderlistbillsDao.getInstance();
List<orderlistbillsDto> list = dao.getBillsList(pageNumber, seq, order_date);
orderlistbillsDto dto = null;
for(int i = 0; i< list.size(); i++){
	dto = list.get(i);
}
/* 
JsonObject obj = new JsonObject();


for(int i = 1; i<6;i++){
	obj.addProperty("row" + i,dto.getProduct_name());
	obj.addProperty("row" + i,dto.getProduct_unit());
	obj.addProperty("row" + i,dto.getProduct_standard());
	obj.addProperty("row" + i,dto.getOrder_count());
	obj.addProperty("row" + i,dto.getProduct_trade_price());
	obj.addProperty("row" + i,dto.getOrder_total());
}

response.setContentType("application/json");
out.println(obj.toString());
 */

 Gson jobj = new Gson();
 response.setContentType("application/json");
 out.println(jobj.toJson(list));
%>   