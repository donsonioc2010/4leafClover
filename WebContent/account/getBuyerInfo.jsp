<%@page import="com.google.gson.JsonObject"%>
<%@page import="buyer.BuyerDto"%>
<%@page import="buyer.BuyerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // 글자깨짐

	String seq = request.getParameter("seq"); 
	BuyerDao dao = BuyerDao.getInstance();
	BuyerDto dto = dao.getBuyerInfo(Integer.parseInt(seq));
	
	//System.out.println(dto.toString()); 값을 가져오는지 확인 
	
	JsonObject obj = new JsonObject(); // json파일 추가 후 사용 
	// ("별명", dto에서 가져오는값)
	obj.addProperty("buyerCompanyName", dto.getBuyer_company_name());          	// 거래처명
	obj.addProperty("buyerceoname", dto.getBuyer_ceo()); 					   	// 대표자명
	obj.addProperty("buyercondition", dto.getBuyer_business_condition());      	// 업태
	obj.addProperty("buyerkinds", dto.getBuyer_business_kinds());    		   	// 종목
	obj.addProperty("buyercompanynum", dto.getBuyer_company_num());      		// 사업자
	obj.addProperty("buyeraddress1", dto.getBuyer_address1());  				// 우편번호
	obj.addProperty("buyeraddress2", dto.getBuyer_address2());      			// 기본주소
	obj.addProperty("buyeraddress3", dto.getBuyer_address3());  				// 하위주소
	obj.addProperty("buyeradmin", dto.getBuyer_admin());      					// 담당자
	obj.addProperty("buyeremail", dto.getBuyer_email());  						// 이메일
	obj.addProperty("buyertel", dto.getBuyer_tel_num());      					// 전화
	obj.addProperty("buyerfirstday", dto.getBuyer_date());  					// 거래게시일
	obj.addProperty("buyerlastday", dto.getBuyer_date());  						// 최종거래일
	obj.addProperty("buyermemo", dto.getBuyer_memo());     						// 메모
	obj.addProperty("buyerhomepage", dto.getBuyer_homepage()); 					// 홈페이지
	/*
	[  // json 파일로 바꾸기 
	 buyerCompanyName:"" + dto.getBuyer_company_name();
	 ]
	*/
	response.setContentType("application/json"); 
	out.print(obj.toString());
	
%>