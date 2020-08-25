package util;

import java.util.List;

public class UtilEx {
	

	// 날짜를 클릭하면, 그날의 일정이 모두 볼수 있는 callist.jsp로 이동하는 함수
	public static String callist(int year, int month, int day) {
		String str = "";
		
		str += String.format("&nbsp;<a href='%s?year=%d&month=%d&day=%d'>", 
									"./callist.jsp", year, month, day);		
		str += String.format("%2d", day);	
		str += "</a>";
		
			// <a href='%s?year=2020&mont=07&day=05'>_5</a>
		return str;		
	}
	
	// 일정을 기입하기 위해서 pen이미지를 클릭하면, calwrite.jsp로 이동하는 함수 
	public static String showPen(int year, int month, int day) {
		String str = "";
		
		String image = "<img src='../image/pen2.png' width='18px' height='18px'>";
		str = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>", 
							"./calwrite.jsp", year, month, day, image);
		
		/*
		  <a href='%s?year=%d&month=%d&day=%d'>
		  	<img src='../image/pen2.png' width='18px' height='18px'>
		  </a>		    
		 */
		return str;		
	}
	
	// 1 -> 01	20/07/03
	public static String two(String msg) {
		return msg.trim().length()<2?"0"+msg.trim():msg.trim();
	}
	
	// 일정 제목이 길 때 ...으로 처리하는 함수
	public static String dot3(String msg) {
		String str = "";
		if(msg.length() >= 10) {
			str = msg.substring(0, 10);	// 0 ~ 5
			str += "...";
		}
		else {
			str = msg.trim();			
		}
		return str;
	}
	
}
