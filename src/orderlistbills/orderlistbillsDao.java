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
	
	public int getAllList(String date) {
		String sql = " SELECT COUNT(O.ORDER_DATE) "
					+ " FROM ORDER_LIST O, BUYER B "
					+ " WHERE O.BUYER_SEQ = B.BUYER_SEQ "
						+ " AND B.SELLER_ID = 'test1' "
						+ " AND O.ORDER_DATE = ? "
					+ " ORDER BY O.ORDER_NUM DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		
		int len = 0;
		
		try {
			conn= DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, date);
			
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
	
}















