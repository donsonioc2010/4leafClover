package orderlistbills;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class orderlistbillsDao {

	private static orderlistbillsDao dao= new orderlistbillsDao();
	
	private orderlistbillsDao() {
		DBConnection.initConnection();
	}
	
	public static orderlistbillsDao getInstance() {
		return dao;
	}
	
	/*
	 ( SELECT BUYER_SEQ FROM BUYER WHERE BUYER_SEQ =? ),"
	 + " ( SELECT PRODUCT_SEQ FROM PRODUCT WHERE PRODUCT_NAME = ? )
	*/
	/*
	this.buyer_seq = buyer_seq;
	this.order_date = order_date;
	this.order_supply_price = order_supply_price;
	this.order_tax_value = order_tax_value;
	this.order_collect_money = order_collect_money;
	this.order_not_collect_money = order_not_collect_money;
	this.order_total = order_total;
	this.product_seq = product_seq;
	this.order_count = order_count;
	this.order_num = order_num;
	this.product_name = product_name;
	this.order_del = order_del;
	this.product_standard = product_standard;
	this.product_trade_price = product_trade_price;
*/
	public List<orderlistbillsDto> get_order_list_bills(String ORDER_DATE, int seq) {
		String sql = "SELECT" + 
							" o.order_num," + 
							" o.order_count," + 
							" o.order_price," + 
							" o.price_tax," + 
							" o.price_sum," + 
							" p.product_name," + 
							" u.product_unit," + 
							" p.product_trade_price," + 
							" l.buyer_seq," + 
							" l.order_date," + 
							" l.order_supply_price," + 
							" l.order_collect_money," + 
							" l.order_not_collect_money,"+
							" l.order_tax_value," + 
							" l.order_total,"+
							" p.product_standard" + 
					" FROM order_detail O, product P, order_list L, product_unit_cate U " + 
					" WHERE O.ORDER_NUM = l.order_num " + 
					" AND o.product_seq = p.product_seq " + 
					" AND U.SEQ_NUM = P.PRODUCT_UNIT " + 
					" AND l.ORDER_DATE= ?"
					+ "AND L.BUYER_SEQ = ?";
		System.out.println(sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<orderlistbillsDto> list = new ArrayList<orderlistbillsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 get_order_list_bills success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ORDER_DATE);
			psmt.setInt(2, seq);
			System.out.println("2/6 get_order_list_bills success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 get_order_list_bills success");
			
			while (rs.next()) {
				int i = 1;

				orderlistbillsDto dto = new orderlistbillsDto(rs.getString(i++),
															rs.getInt(i++), 
															rs.getInt(i++), 
															rs.getInt(i++),
															rs.getInt(i++), 
															rs.getString(i++),
															rs.getString(i++),
															rs.getInt(i++), 
															rs.getInt(i++), 
															rs.getString(i++),
															rs.getInt(i++),
															rs.getInt(i++),
															rs.getInt(i++),
															rs.getInt(i++),
															rs.getInt(i++),
															rs.getString(i++));
			
				list.add(dto);
			}
			System.out.println("4/6 get_order_list_bills success");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
			
		}
		return list;
	}
	
	public int getAllList(int seq, String date) {
		String sql = " SELECT COUNT(L.ORDER_DATE) "
					+ " FROM ORDER_LIST L, BUYER B, ORDER_DETAIL D "
					+ " WHERE L.BUYER_SEQ = B.BUYER_SEQ"
						+ " AND D.ORDER_NUM = L.ORDER_NUM "
						+ " AND B.BUYER_SEQ = ? "
						+ " AND L.ORDER_DATE = ? "
					+ " ORDER BY D.ORDER_NUM DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		
		int len = 0;
		
		try {
			conn= DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			psmt.setString(2, date);
			
			rs = psmt.executeQuery();
			
			
			
			if(rs.next()) {
				len = rs.getInt(1);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return len;
	}

	public List<companyInform> getBillsInform(String ORDER_DATE, int seq) {
		String sql = "SELECT "
				+ " B.BUYER_COMPANY_NAME,"
				+ " B.BUYER_ADDRESS2 || B.BUYER_ADDRESS3,"
				+ " S.SELLER_COMPANY_NAME, S.SELLER_CEO, S.SELLER_TEL_NUM,"
				+ " S.SELLER_PHONE_NUM, " + 
				" S.SELLER_ADDRESS2 ||S.SELLER_ADDRESS1 " + 
				" FROM ORDER_LIST O, BUYER B, SELLER S " + 
				" WHERE O.BUYER_SEQ = B.BUYER_SEQ " + 
				" AND B.SELLER_ID = S.SELLER_ID " + 
				" AND O.ORDER_DATE =?"+
				" AND O.BUYER_SEQ = ?";
		System.out.println(sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<companyInform> list = new ArrayList<companyInform>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBillsInform success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ORDER_DATE);
			psmt.setInt(2, seq);
			System.out.println("2/6 getBillsInform success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBillsInform success");
			
			while (rs.next()) {
				int i = 1;

				companyInform dto = new companyInform(rs.getString(i++),
													  rs.getString(i++),
													  rs.getString(i++),
													  rs.getString(i++),
													  rs.getString(i++),
													  rs.getString(i++),
													  rs.getString(i++));
			
				list.add(dto);
			}
			System.out.println("4/6 getBillsInform success");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
			
		}
		return list;
	}
	
	public List<orderlistbillsDto> getBillsList(int page, int seq, String order_date) {
		String sql = " SELECT * FROM " + 
							"(SELECT "
							+ " O.ORDER_NUM, "
							+ " O.ORDER_COUNT, "
							+ " O.ORDER_PRICE, "
							+ " O.PRICE_TAX, "
							+ " O.PRICE_SUM, "
							+ " P.PRODUCT_NAME, "
							+ " U.PRODUCT_UNIT, "
							+ " P.PRODUCT_TRADE_PRICE, "
							+ " L.BUYER_SEQ, "
							+ " L.ORDER_DATE, "
							+ " l.order_supply_price, "
							+ " l.order_collect_money, "
							+ " l.order_not_collect_money, "
							+ " l.order_tax_value, "
							+ " l.order_total, "
							+ " p.product_standard " + 
							" ,ROWNUM RNUM " + 
							" FROM order_detail O, product P, order_list L, product_unit_cate U\r\n" + 
							" WHERE O.ORDER_NUM = L.ORDER_NUM " + 
							" AND o.product_seq = p.product_seq " + 
							" AND U.SEQ_NUM = P.PRODUCT_UNIT " + 
							" AND l.ORDER_DATE= ? " + 
							" AND L.BUYER_SEQ = ? )" +
				" WHERE RNUM BETWEEN ? AND ? ";
		
		int start, end;
		start = 1+ 10 * page;
		end = 10 + 10 * page;
		
		System.out.println(start+" "+end + " " + page);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<orderlistbillsDto> list = new ArrayList<orderlistbillsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 get_order_list_bills success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, order_date);
			psmt.setInt(2, seq);
			psmt.setInt(3, start);
			psmt.setInt(4, end);
			System.out.println("2/6 get_order_list_bills success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 get_order_list_bills success");
			
			while (rs.next()) {
				int i = 1;

				orderlistbillsDto dto = new orderlistbillsDto(rs.getString(i++),
															rs.getInt(i++), 
															rs.getInt(i++), 
															rs.getInt(i++),
															rs.getInt(i++), 
															rs.getString(i++),
															rs.getString(i++),
															rs.getInt(i++), 
															rs.getInt(i++), 
															rs.getString(i++),
															rs.getInt(i++),
															rs.getInt(i++),
															rs.getInt(i++),
															rs.getInt(i++),
															rs.getInt(i++),
															rs.getString(i++));
			
				list.add(dto);
			}
			System.out.println("4/6 get_order_list_bills success");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
			
		}
		return list;
				
				
	}

	public boolean confirmId(String orderNum, int seq) {
		String sql =" SELECT order_num FROM order_list "
				+ " WHERE ORDER_NUM= ? " 
				+ " AND BUYER_SEQ = ? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean confirm = false;
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,orderNum);
			psmt.setInt(2,seq);
			rs = psmt.executeQuery();
			if(rs.next()) {
				confirm = true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		//데이터가 있을떄만 true
		return confirm;
	}
	
}
















