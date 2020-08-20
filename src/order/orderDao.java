package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class orderDao {
	private static orderDao dao = new orderDao();
	//검새간 날짜의 주문내역을 가져오는 메소드
	public List<Object> getDetailList(orderDto dto){
		//ORDER_DETAIL의 TABLE을  BUYER_SEQ와 DATE로 가져와야함
		List<Object> list = new ArrayList<Object>();

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			//거래일자가 있는지 확인
			String sql = "SELECT * FROM ORDER_LIST WHERE BUYER_SEQ =? AND ORDER_DATE=?";
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getBuyerSeq());
			psmt.setString(2, dto.getOrderDate());
			rs = psmt.executeQuery();
			
			if(rs.next()) {//Not Null
				orderDto order = new orderDto();
					order.setBuyerSeq(rs.getInt(1));
					order.setOrderSort(rs.getInt(2));
					order.setOrderDate(rs.getString(3));
					order.setOrderSupplyValue(rs.getInt(4));
					order.setOrderTaxValue(rs.getInt(5));
					order.setOrderCollectMoney(rs.getInt(6));
					order.setOrderNotCollectMoney(rs.getInt(7));
					order.setOrderTotal(rs.getInt(8));
					order.setOrderNum(rs.getString(9));
				list.add(order);
				
				psmt.clearParameters();
				
				psmt = null;
				rs = null;
				
				sql= "SELECT O.PRODUCT_SEQ, O.ORDER_COUNT,O.ORDER_PRICE,O.PRICE_TAX,O.PRICE_SUM,P.PRODUCT_NAME,P.PRODUCT_STANDARD "
						+ " FROM ORDER_DETAIL O,PRODUCT P WHERE ORDER_NUM = ? AND O.PRODUCT_SEQ = P.PRODUCT_SEQ";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, order.getOrderNum());
				rs = psmt.executeQuery();
				while(rs.next()) {
					detailDto detail = new detailDto();
					detail.setProductSeq(rs.getInt(1));
					detail.setOrderCount(rs.getInt(2));
					detail.setOrderPrice(rs.getInt(3));
					detail.setPriceTax(rs.getInt(4));
					detail.setPriceSum(rs.getInt(5));
					detail.setProductName(rs.getString(6));
					detail.setProductStandard(rs.getString(7));
					list.add(detail);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	public boolean updateOrder(orderDto order) {
		//이메소드는 MainOrder페이지에서 수정버튼을 누를시 작동하는 메소드임
		String sql = "UPDATE ORDER_LIST SET ORDER_COLLECT_MONEY=?,"
				+ " ORDER_NOT_COLLECT_MONEY = ?  WHERE ORDER_NUM = ?";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, order.getOrderCollectMoney());
			psmt.setInt(2, order.getOrderNotCollectMoney());
			psmt.setString(3, order.getOrderNum());
			
			count = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		//true면 입력성공
		return count>0?true:false;
	}
	
	//주문을 입력받으면 Db에 Insert하는 기능
	public boolean insertOrder(orderDto order,List<detailDto> detail) {
		boolean confirm = checkDetailData(order);
		if(!confirm) {
			String sql[] = {	//BUYER_SEQ,ORDERSORT,ORDERDATE,ORDERSUPPLYPRICE,
								//ORDERTAXVALUE,ORDERCOLLECT,ORDERNOTCOLLECT,ORDERTOTAL,ORDERNUM
					"INSERT INTO ORDER_LIST VALUES (?,?,?,?,?,?,?,?,?)",
					"INSERT INTO ORDER_DETAIL VALUES (?,?,?,?,?,?)"
					};
			LocalDateTime localDateTime = LocalDateTime.now();
			Timestamp timestamp2 = Timestamp.valueOf(localDateTime);
			long stamp = timestamp2.getTime();
			
			String orderNum = order.getOrderDate()+stamp;
			Connection conn = null;
			PreparedStatement psmt = null;
			
			try {
				conn = DBConnection.getConnection();
				psmt = conn.prepareStatement(sql[0]);
				
				psmt.setInt(1, order.getBuyerSeq());
				psmt.setInt(2, order.getOrderSort());
				psmt.setString(3, order.getOrderDate());
				psmt.setInt(4, order.getOrderSupplyValue());
				psmt.setInt(5, order.getOrderTaxValue());
				psmt.setInt(6, order.getOrderCollectMoney());
				psmt.setInt(7, order.getOrderNotCollectMoney());
				psmt.setInt(8, order.getOrderTotal());
				psmt.setString(9, orderNum);
				
				psmt.executeUpdate();
				psmt = null;
				//먼저 한번 넣어주는건 FK를 통한 신택스 에러를 방지하기 위함!
				conn.setAutoCommit(false);
				psmt = conn.prepareStatement(sql[1]);
				for(int i =0; i<detail.size();i++) {
					detailDto dto = detail.get(i);
					psmt.setInt(1, dto.getProductSeq());
					psmt.setString(2, orderNum);
					psmt.setInt(3, dto.getOrderCount());
					psmt.setInt(4, dto.getOrderPrice());
					psmt.setInt(5, dto.getPriceTax());
					psmt.setInt(6, dto.getOrderPrice());
					psmt.addBatch();
				}
				psmt.executeBatch();
			} catch (Exception e) {
				e.printStackTrace();
				try {
					conn.rollback();
					confirm = true;
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}finally {
				try {
					conn.setAutoCommit(true);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				DBClose.close(psmt, conn, null);
			}
		}
		return confirm;
	}
	public boolean deleteList(String orderNum) {
		String sql[] = {
				"DELETE FROM ORDER_DETAIL WHERE ORDER_NUM = ?",
				"DELETE FROM ORDER_LIST WHERE ORDER_NUM = ?"
		};
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			for(int i =0; i<=1; i++) {
				psmt = null;
				psmt = conn.prepareStatement(sql[i]);
				psmt.setNString(1, orderNum);
				if(i == 1)
					count = psmt.executeUpdate();
				else
					psmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
	}
	
	
	private boolean checkDetailData(orderDto dto) {
		//메소드의 역할 : 중복된 일자에 Data가 있는지 없는지 확인하는 기능
		String sql ="SELECT * FROM ORDER_LIST WHERE BUYER_SEQ = ? AND ORDER_DATE = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean result = false;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getBuyerSeq());
			psmt.setString(2, dto.getOrderDate());
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = true;//Data가 있을경우 True
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return result;
	}
	
	private orderDao() {DBConnection.initConnection();}
	public static orderDao getInstance() {return dao;}
}

