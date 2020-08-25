package tradeBook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

import buyer.BuyerDto;
import tradeBook.clienthistoryDto;

public class clienthistoryDao {

	private static clienthistoryDao dao = new clienthistoryDao();

	private clienthistoryDao() {
		DBConnection.initConnection();
	}

	public static clienthistoryDao getInstance() {
		return dao;
	}
	
	public List<clienthistoryDto> getClientHistory(String ID,int seq,String word) {
		
		String sql = " SELECT BU.BUYER_SEQ, "
				+ " PR.PRODUCT_NAME, "
				+ " OL.ORDER_SORT, "
				+ " OL.ORDER_DATE, "
				+ " OD.ORDER_PRICE, "
				+ " OD.PRICE_TAX, "
				+ " OL.ORDER_COLLECT_MONEY, "
				+ " OL.ORDER_NOT_COLLECT_MONEY, "
				+ " OD.PRICE_SUM "
				+ " FROM BUYER BU,"
				+ " ORDER_DETAIL OD, "
				+ " ORDER_LIST OL, "
				+ " PRODUCT PR "
				+ " WHERE BU.BUYER_SEQ = OL.BUYER_SEQ(+) "
				+ " AND OL.ORDER_NUM = OD.ORDER_NUM "
				+ " AND OD.PRODUCT_SEQ = PR.PRODUCT_SEQ "
				+ " AND BU.SELLER_ID = ? ";
		String sqlword = "";
		if(seq != 0) {
			 sqlword += " AND BU.BUYER_SEQ = "+seq+" ";
			
		}else if(!word.equals("")) {
			
			sqlword += " AND PR.PRODUCT_NAME = '" + word.trim() + "' ";
		}
		
		sqlword += " ORDER BY OL.ORDER_DATE DESC ";
				
		sql += sqlword;
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		clienthistoryDto dto = null;
		List<clienthistoryDto> list = new ArrayList<clienthistoryDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getclienthistory success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getclienthistory success");

			psmt.setString(1, ID);
			
			
			

			rs = psmt.executeQuery();
			System.out.println("3/6 getclienthistory success");

			while (rs.next()) {
				int i = 1;
				dto = new clienthistoryDto(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++),
						rs.getInt(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/6 getclienthistory success");

		} catch (Exception e) {
			System.out.println("getclienthistory fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	public List<BuyerDto> getSearchClient(String choice, String searchWord,String id) {
		String sql = " SELECT " + " BUYER_SEQ, " + " SELLER_ID, " + " BUYER_COMPANY_NAME, " + " BUYER_CEO, "
				+ " BUYER_BUSINESS_CONDITION, " + " BUYER_BUSINESS_KINDS, " + " BUYER_COMPANY_NUM, "
				+ " BUYER_ADDRESS1, " + " BUYER_ADDRESS2, " + " BUYER_ADDRESS3, " + " BUYER_ADMIN, " + " BUYER_EMAIL, "
				+ " BUYER_TEL_NUM, " + " BUYER_DATE, " + " BUYER_MEMO, " + " BUYER_HOMEPAGE " + " FROM BUYER "
				+ " WHERE SELLER_ID = '"+ id.trim() + "'";
				
		String sqlword = "";
		if (choice.equals("seller")) {
			sqlword = " AND  BUYER_COMPANY_NAME LIKE '%" + searchWord.trim() + "%' ";

		} else if (choice.equals("ceo")) {
			sqlword = " AND  BUYER_CEO LIKE '%" + searchWord.trim() + "%' ";

		} else if (choice.equals("number")) {
			sqlword = " AND  BUYER_COMPANY_NUM LIKE '%" + searchWord.trim() + "%' ";

		}
		
		sql = sql + sqlword;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BuyerDto> list = new ArrayList<BuyerDto>();

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				int i = 1;
				BuyerDto dto = new BuyerDto(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getString(i++));

				list.add(dto);
			}
			System.out.println("4/6 getsearchclient success");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	public List<clienthistoryDto> getclienttradedateSearch(String id,int seq,boolean check,String date,String date1) {
		String sqlword = "";
		String splitdate="";
		String splitdate1="";
		String splitdate2="";
	 String sql = " SELECT BU.BUYER_SEQ, "
				+ " PR.PRODUCT_NAME, "
				+ " OL.ORDER_SORT, "
				+ " OL.ORDER_DATE, "
				+ " OD.ORDER_PRICE, "
				+ " OD.PRICE_TAX, "
				+ " OL.ORDER_COLLECT_MONEY, "
				+ " OL.ORDER_NOT_COLLECT_MONEY, "
				+ " OD.PRICE_SUM "
				+ " FROM BUYER BU,"
				+ " ORDER_DETAIL OD, "
				+ " ORDER_LIST OL, "
				+ " PRODUCT PR "
				+ " WHERE BU.BUYER_SEQ = OL.BUYER_SEQ(+) "
				+ " AND OL.ORDER_NUM = OD.ORDER_NUM "
				+ " AND OD.PRODUCT_SEQ = PR.PRODUCT_SEQ "
				+ " AND BU.SELLER_ID = ? "
				+ " AND BU.BUYER_SEQ = ? ";
		if(check == true) {
			splitdate=date.replaceAll("-","");
			sqlword += " AND OL.ORDER_DATE = "+splitdate+" ";
		}else if (check == false) {
			splitdate1=date.replaceAll("-","");
			splitdate2=date1.replaceAll("-","");
			
			
			sqlword +=	" AND OL.ORDER_DATE BETWEEN "+splitdate1+" AND "+splitdate2+" ";
		}
		sql = sql + sqlword;
		
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			clienthistoryDto dto = null;
			List<clienthistoryDto> list = new ArrayList<clienthistoryDto>();

			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 getclienthistory success");

				psmt = conn.prepareStatement(sql);
				System.out.println("2/6 getclienthistory success");

				psmt.setString(1, id);
				psmt.setInt(2, seq);

				rs = psmt.executeQuery();
				System.out.println("3/6 getclienthistory success");

				while (rs.next()) {
					int i = 1;
					dto = new clienthistoryDto(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++),
							rs.getInt(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++));
					list.add(dto);
				}
				System.out.println("4/6 getclienthistory success");

			} catch (Exception e) {
				System.out.println("getclienthistory fail");
				e.printStackTrace();
			} finally {
				DBClose.close(psmt, conn, rs);
			}
			return list;	
		}
	public List<clienthistoryDto> getclienttradeSearch(String ID,int seq,String word) {
		
	 String sql = " SELECT BU.BUYER_SEQ, "
				+ " PR.PRODUCT_NAME, "
				+ " OL.ORDER_SORT, "
				+ " OL.ORDER_DATE, "
				+ " OD.ORDER_PRICE, "
				+ " OD.PRICE_TAX, "
				+ " OL.ORDER_COLLECT_MONEY, "
				+ " OL.ORDER_NOT_COLLECT_MONEY, "
				+ " OD.PRICE_SUM "
				+ " FROM BUYER BU,"
				+ " ORDER_DETAIL OD, "
				+ " ORDER_LIST OL, "
				+ " PRODUCT PR "
				+ " WHERE BU.BUYER_SEQ = OL.BUYER_SEQ(+) "
				+ " AND OL.ORDER_NUM = OD.ORDER_NUM "
				+ " AND OD.PRODUCT_SEQ = PR.PRODUCT_SEQ "
				+ " AND BU.SELLER_ID = ? "
				+ " AND PR.PRODUCT_NAME = ? ";
		String sqlword = "";
		if(seq != 0) {
			 sqlword += " AND BU.BUYER_SEQ = "+seq+" ";
			
		}
		
		sqlword += " ORDER BY OL.ORDER_DATE DESC ";
				
		sql += sqlword;
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		clienthistoryDto dto = null;
		List<clienthistoryDto> list = new ArrayList<clienthistoryDto>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getclienthistory success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getclienthistory success");

			psmt.setString(1, ID);
			psmt.setNString(2, word);
			
			

			rs = psmt.executeQuery();
			System.out.println("3/6 getclienthistory success");

			while (rs.next()) {
				int i = 1;
				dto = new clienthistoryDto(rs.getInt(i++), rs.getString(i++), rs.getInt(i++), rs.getString(i++),
						rs.getInt(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++));
				list.add(dto);
			}
			System.out.println("4/6 getclienthistory success");

		} catch (Exception e) {
			System.out.println("getclienthistory fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	}

