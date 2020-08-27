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
	private orderlistbillsDao() {DBConnection.initConnection();}
	public static orderlistbillsDao getInstance() {return dao;}
	
	//주문일자와 BUYER_Seq 번호로 거래명세서에 출력을 할 내역을 가져오는 메소드
	public List<orderlistbillsDto> get_order_list_bills(String orderDate, int seq) {
		String sql = "SELECT O.ORDER_NUM, O.ORDER_COUNT, O.ORDER_PRICE, O.PRICE_TAX, O.PRICE_SUM," 
						+ " P.PRODUCT_NAME, U.PRODUCT_UNIT, P.PRODUCT_TRADE_PRICE, L.BUYER_SEQ," 
						+ " L.ORDER_DATE, L.ORDER_SUPPLY_PRICE, L.ORDER_COLLECT_MONEY, L.ORDER_NOT_COLLECT_MONEY,"
						+ " L.ORDER_TAX_VALUE, L.ORDER_TOTAL, P.PRODUCT_STANDARD" 
						+ " FROM ORDER_DETAIL O, PRODUCT P, ORDER_LIST L, PRODUCT_UNIT_CATE U " 
						+ " WHERE O.ORDER_NUM = L.ORDER_NUM " 
						+ " AND O.PRODUCT_SEQ = P.PRODUCT_SEQ " 
						+ " AND U.SEQ_NUM = P.PRODUCT_UNIT " 
						+ " AND L.ORDER_DATE= ?" 
						+ " AND L.BUYER_SEQ = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<orderlistbillsDto> list = new ArrayList<orderlistbillsDto>();
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, orderDate);
			psmt.setInt(2, seq);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;

				orderlistbillsDto dto 
					= new orderlistbillsDto(
							rs.getString(i++),
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
							rs.getString(i++)
						);
				list.add(dto);
			}
			
		} catch (Exception e) {e.printStackTrace();}
		finally {DBClose.close(psmt, conn, rs);}
		return list;
	}
	//해당일자의 BuyerSeq의 거래총 갯수를 가져옴 (Paging을 위함)
	public int getAllList(int seq, String date) {
		String sql = " SELECT COUNT(L.ORDER_DATE) "
						+ " FROM ORDER_LIST L, BUYER B, ORDER_DETAIL D "
							+ " WHERE L.BUYER_SEQ = B.BUYER_SEQ AND D.ORDER_NUM = L.ORDER_NUM "
							+ " AND B.BUYER_SEQ = ? AND L.ORDER_DATE = ? "
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
				
			if(rs.next()) {len = rs.getInt(1);}
		} catch (Exception e) {e.printStackTrace();}
		finally {DBClose.close(psmt, conn, rs);}
		return len;
	}
	
	public List<companyInform> getBillsInform(String orderDate, int seq) {
		String sql = "SELECT B.BUYER_COMPANY_NAME, B.BUYER_ADDRESS2 || B.BUYER_ADDRESS3, S.SELLER_COMPANY_NAME, S.SELLER_CEO, S.SELLER_TEL_NUM,"
				+ " S.SELLER_PHONE_NUM, S.SELLER_ADDRESS2 ||S.SELLER_ADDRESS1 FROM ORDER_LIST O, BUYER B, SELLER S " 
				+ " WHERE O.BUYER_SEQ = B.BUYER_SEQ  AND B.SELLER_ID = S.SELLER_ID " 
				+ " AND O.ORDER_DATE =? AND O.BUYER_SEQ = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<companyInform> list = new ArrayList<companyInform>();
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, orderDate);
			psmt.setInt(2, seq);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;

				companyInform dto = new companyInform(
						  rs.getString(i++),
						  rs.getString(i++),
						  rs.getString(i++),
						  rs.getString(i++),
						  rs.getString(i++),
						  rs.getString(i++),
						  rs.getString(i++)
					  );
				list.add(dto);
			}
			
		} catch (Exception e) {e.printStackTrace();}
		finally {DBClose.close(psmt, conn, rs);}
		return list;
	}
	//인쇄시 Paging하여 분할해 정보를 가져오기 orderDate 일자의 Paging건수 조회하기
	public List<orderlistbillsDto> getBillsList(int page, int seq, String orderDate) {
		String sql = " SELECT * FROM " + 
							"(SELECT O.ORDER_NUM, O.ORDER_COUNT, O.ORDER_PRICE, O.PRICE_TAX, O.PRICE_SUM, "
							+ " P.PRODUCT_NAME, U.PRODUCT_UNIT, P.PRODUCT_TRADE_PRICE, L.BUYER_SEQ, "
							+ " L.ORDER_DATE, l.order_supply_price, l.order_collect_money, l.order_not_collect_money, "
							+ " l.order_tax_value, l.order_total, p.product_standard, ROWNUM RNUM "  
							+ " FROM order_detail O, product P, order_list L, product_unit_cate U" 
							+ " WHERE O.ORDER_NUM = L.ORDER_NUM AND o.product_seq = p.product_seq " 
							+ " AND U.SEQ_NUM = P.PRODUCT_UNIT AND l.ORDER_DATE= ? " 
							+ " AND L.BUYER_SEQ = ? )" 
					+ " WHERE RNUM BETWEEN ? AND ? ";
		
		int start, end;
		start = 1+ 10 * page;
		end = 10 + 10 * page;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<orderlistbillsDto> list = new ArrayList<orderlistbillsDto>();
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, orderDate);
			psmt.setInt(2, seq);
			psmt.setInt(3, start);
			psmt.setInt(4, end);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				int i = 1;

				orderlistbillsDto dto 
					= new orderlistbillsDto(
							rs.getString(i++),
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
							rs.getString(i++)
						);
				list.add(dto);
			}
		} catch (Exception e) {e.printStackTrace();}
		finally {DBClose.close(psmt, conn, rs);}
		return list;	
	}

	public boolean confirmId(String orderNum, int seq) {
		String sql =" SELECT order_num FROM order_list "
				+ " WHERE ORDER_NUM= ? AND BUYER_SEQ = ? ";
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
			if(rs.next()) {confirm = true;}
		} catch (Exception e) {e.printStackTrace();}
		finally {DBClose.close(psmt, conn, rs);}
		//데이터가 있을떄만 true
		return confirm;
	}	
}

