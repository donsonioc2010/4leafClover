package Seller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class sellerDao {
	private static sellerDao dao = new sellerDao();
	private sellerDao() {
		DBConnection.initConnection();
	}
	public static sellerDao getInstance() {
		return dao;
	}
	
	//관리자의 로그인 기능
	public boolean sellerLogin(sellerDto dto) {
		String sql = "SELECT SELLER_ID FROM SELLER WHERE SELLER_ID = ? AND SELLER_PWD = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean confirm = false;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			rs = psmt.executeQuery();
			//정보를 확인해서 널값인지 아닌지만 확인한다
			if(rs.next()) {
				confirm = true;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return confirm;
	}
	
	//회원가입
	public boolean addSeller(sellerDto dto) {
		String sql = "INSERT INTO SELLER (SELLER_ID, SELLER_PWD, SELLER_COMPANY_NAME, SELLER_CEO, SELLER_COMPANY_NUMBER, SELLER_BUSINESS_CONDITION, SELLER_BUSINESS_KIND,"
				+ " SELLER_ADDRESS1, SELLER_ADDRESS2, SELLER_ADDRESS3, SELLER_TEL_NUM, SELLER_PHONE_NUM, SELLER_EMAIL)"
				+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count  = 0; 
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getCompanyName());
			psmt.setString(4, dto.getCeo());
			psmt.setString(5, dto.getCompanyNumber());
			psmt.setString(6, dto.getBusinessCondition());
			psmt.setString(7, dto.getBusinessKind());
			psmt.setString(8, dto.getAddress1());
			psmt.setString(9, dto.getAddress2());
			psmt.setString(10, dto.getAddress3());
			psmt.setString(11, dto.getTel());
			psmt.setString(12, dto.getPhone());
			psmt.setString(13, dto.getEmail());
			
			count = psmt.executeUpdate();			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;	
	}
	//id중복확인 null인경우에만(false인경우)에만 사용이 가능하다
	public boolean confirmId(String id) {
		String sql =" SELECT SELLER_ID FROM SELLER WHERE SELLER_ID = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		boolean confirm = false;
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);
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
	// seller 정보 불러오기
	public List<sellerDto> getSellerInform(String id) {
		String sql = " SELECT * FROM SELLER WHERE SELLER_ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<sellerDto> list = new ArrayList<sellerDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getSellerInform success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/6 getSellerInform success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getSellerInform success");
			
			while (rs.next()) {
				int i = 1;
				sellerDto dto = new sellerDto(	rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++),
												rs.getString(i++));
				list.add(dto);
			}
			System.out.println("4/6 getSellerInform success");
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
		
	}
	// seller 정보 수정
	public boolean updateSeller(sellerDto dto, String id) {
		String sql = " UPDATE SELLER"
				+ " SET SELLER_COMPANY_NAME=?, "
				+ " SELLER_CEO=?, "
				+ " SELLER_COMPANY_NUMBER=?, "
				+ " SELLER_BUSINESS_CONDITION=?, "
				+ " SELLER_BUSINESS_KIND=?, "
				+ " SELLER_ADDRESS1=?, "
				+ " SELLER_ADDRESS2=?, "
				+ " SELLER_ADDRESS3=?, "
				+ " SELLER_TEL_NUM=?, "
				+ " SELLER_PHONE_NUM=?, "
				+ " SELLER_EMAIL=?"
				+ " WHERE SELLER_ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count  = 0; 
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 updateSeller success");
			
			psmt=conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getCompanyName());
			psmt.setString(2, dto.getCeo());
			psmt.setString(3, dto.getCompanyNumber());
			psmt.setString(4, dto.getBusinessCondition());
			psmt.setString(5, dto.getBusinessKind());
			psmt.setString(6, dto.getAddress1());
			psmt.setString(7, dto.getAddress2());
			psmt.setString(8, dto.getAddress3());
			psmt.setString(9, dto.getTel());
			psmt.setString(10, dto.getPhone());
			psmt.setString(11, dto.getEmail());
			psmt.setString(12, id);
			System.out.println("2/6 updateSeller success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 updateSeller success");
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
	}
}






