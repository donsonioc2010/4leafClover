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
	
	private totalDao() {
		DBConnection.initConnection();
	}
	public static totalDao getInstance() {
		return dao;
	} 
	
	public List<totalMMDto> getMonthTotalAvg(String sellerId) {
		String sql = "SELECT AVG(o.order_total), "
					+ " AVG(o.order_collect_money), "
					+ " AVG(o.order_not_collect_money) "
					+ " FROM ORDER_LIST O, buyer b "  
					+ " WHERE substr(o.ORDER_DATE,1,6) = TO_CHAR(SYSDATE,'YYYYmm') " 
					+ " AND b.seller_id = ? ";
		
		System.out.println("sql" + sql);
		
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
				totalMMDto dto = new totalMMDto(rs.getInt(i++),
											rs.getInt(i++),
											rs.getInt(i++));
				list.add(dto);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

	public List<totalYYYYDto> getYearTotalAvg(String sellerId) {
		String sql = " SELECT AVG(o.order_total), "
					+ " AVG(o.order_collect_money), "
					+ " AVG(o.order_not_collect_money) "
					+ " FROM ORDER_LIST O, BUYER B "  
					+ " WHERE substr(o.ORDER_DATE,1,4) = TO_CHAR(SYSDATE,'YYYY') " 
					+ " AND b.seller_id = ? ";
		
		System.out.println("sql" + sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<totalYYYYDto> list = new ArrayList<totalYYYYDto>();
		
		try {
			conn = DBConnection.getConnection();
			
			psmt =conn.prepareStatement(sql);
			psmt.setString(1, sellerId);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				totalYYYYDto dto = new totalYYYYDto(rs.getInt(i++),
											rs.getInt(i++),
											rs.getInt(i++));
				list.add(dto);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

}
