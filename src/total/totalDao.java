package total;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class totalDao {
	private static totalDao dao = new totalDao();
	private totalDao() {DBConnection.initConnection();}
	public static totalDao getInstance() {return dao;} 
	
	public List<totalMMDto> getMonthTotalAvg(String sellerId) {
		String sql = "SELECT SUM(O.ORDER_TOTAL), SUM(O.ORDER_COLLECT_MONEY), SUM(O.ORDER_NOT_COLLECT_MONEY) " 
						+ " FROM ORDER_LIST O, BUYER B " 
						+ " WHERE O.BUYER_SEQ=B.BUYER_SEQ " 
							+ " AND SUBSTR(O.ORDER_DATE,1,6) = TO_CHAR(SYSDATE,'YYYYMM') " 
							+ " AND B.BUYER_SEQ = O.BUYER_SEQ" 
							+ " AND B.SELLER_ID = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<totalMMDto> list = new ArrayList<totalMMDto>();
		
		try {
			conn = DBConnection.getConnection();
			
			psmt =conn.prepareStatement(sql);
			psmt.setString(1, sellerId);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				totalMMDto dto 
					= new totalMMDto(rs.getInt(i++), rs.getInt(i++), rs.getInt(i++));
				list.add(dto);
			}
			
		} catch (Exception e) {e.printStackTrace();}
		finally {DBClose.close(psmt, conn, rs);}
		return list;
	}

	public List<totalYYYYDto> getYearTotalAvg(String sellerId) {
		List<totalYYYYDto> list = new ArrayList<totalYYYYDto>();
		String sql = " SELECT SUM(O.ORDER_TOTAL), SUM(O.ORDER_COLLECT_MONEY), SUM(O.ORDER_NOT_COLLECT_MONEY) " 
						+ " FROM ORDER_LIST O, BUYER B " 
							+ " WHERE O.BUYER_SEQ=B.BUYER_SEQ " 
							+ " AND SUBSTR(O.ORDER_DATE,1,4) = TO_CHAR(SYSDATE,'YYYY') " 
							+ " AND B.BUYER_SEQ = O.BUYER_SEQ" 
							+ " AND B.SELLER_ID = ? ";
			
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = DBConnection.getConnection();
			
			psmt =conn.prepareStatement(sql);
			psmt.setString(1, sellerId);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				totalYYYYDto dto 
					= new totalYYYYDto(rs.getInt(i++), rs.getInt(i++), rs.getInt(i++));
				list.add(dto);
			}
			
			
		} catch (Exception e) {e.printStackTrace();}
		finally {DBClose.close(psmt, conn, rs);}
		return list;
	}

	public List<totalMMDto> getCompanyTotal(String id) {
		String sql = " SELECT BCN, SUM(OT), SUM(OC), SUM(ONC) " 
				+ " FROM (SELECT B.BUYER_COMPANY_NAME AS BCN, ORDER_TOTAL AS OT, " 
				+ " ORDER_COLLECT_MONEY AS OC, " 
				+ " ORDER_NOT_COLLECT_MONEY AS ONC " 
				+ " FROM ORDER_LIST O, BUYER B " 
				+ " WHERE B.SELLER_ID = ? " 
				+ " AND SUBSTR(O.ORDER_DATE,1,4) = TO_CHAR(SYSDATE,'YYYY') " 
				+ " AND O.BUYER_SEQ=B.BUYER_SEQ) " 
				+ " GROUP BY BCN ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<totalMMDto> list = new ArrayList<totalMMDto>();
		
		try {
			conn = DBConnection.getConnection();
			
			psmt =conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				totalMMDto dto 
					= new totalMMDto(rs.getString(i++), rs.getInt(i++), rs.getInt(i++), rs.getInt(i++));
				list.add(dto);
			}
		} catch (Exception e) {e.printStackTrace();}
		finally {DBClose.close(psmt, conn, rs);}
		return list;
	}
}
