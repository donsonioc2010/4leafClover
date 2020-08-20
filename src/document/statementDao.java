package document;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import Seller.sellerDto;
import buyer.BuyerDto;
import db.DBClose;
import db.DBConnection;
import order.orderDto;

//이 문서는 세금계산서를 가져올시 쓰는 java 파일
public class statementDao {
	private static statementDao dao = new statementDao();
	public statementDao() {
		DBConnection.initConnection();
	}
	
	
	//DB에서 가져올 정보는 사업자 정보,구매자정보,구매내역
	public Map<String, Object> getOrderList(int buyerSeq){
		Map<String,Object> list = new HashMap<String, Object>();
		String sql = null;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn.setAutoCommit(false);
			conn = DBConnection.getConnection();

			//Seller 정보 받아오는 부분 Buyer 정보를 받아오는 부분
			sql = "SELECT  FROM SELLER S,BUYER B WHERE S.SELLER_ID = B.SELLER_ID WHERE B.BUYER_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, buyerSeq);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				//seller정보를 담는 부분
				list.put("seller", new sellerDto());
				
				
				//buyer정보를 담는 부분
				list.put("buyer",new BuyerDto());
			}
			DBClose.close(psmt, conn, rs);
			
			
			//구매내역 DB조회
			sql = " SELECT * FROM ORDER_LIST WHERE BUYER_SEQ = ?";

			conn=DBConnection.getConnection();
			psmt= conn.prepareStatement(sql);
			
			psmt.setInt(1, buyerSeq);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				//orderList put Map
				list.put("orderList",new orderDto());
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return null;
	}
	
	public static statementDao getInstance() {
		return dao;
	}
	
}
