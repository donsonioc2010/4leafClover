package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class productDao {
	private static productDao dao = new productDao();
	private productDao() {DBConnection.initConnection();}
	public static productDao getInstance() {return dao;}
	
	//물품명으로만 검색함
	public List<productDto> searchProductList(String searchWord, String sellerId){
		List<productDto> list = new ArrayList<productDto>();
		
		String sql = "SELECT PRODUCT_SEQ, PRODUCT_NAME, PRODUCT_SORT, PRODUCT_TRADE_PRICE, PRODUCT_STANDARD "
				+ " FROM PRODUCT WHERE PRODUCT_NAME LIKE ? AND SELLER_ID = ?  ORDER BY PRODUCT_SEQ ";
		Connection conn = null;
		PreparedStatement psmt  = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, "%"+searchWord+"%");
			psmt.setString(2, sellerId);
			rs  = psmt.executeQuery();
			
			while(rs.next()) {
				productDto dto = new productDto();
				dto.setProductSeq(rs.getInt(1));
				dto.setProductName(rs.getString(2));
				dto.setProductSort(rs.getString(3));
				dto.setProductTradePrice(rs.getInt(4));
				dto.setProductStandard(rs.getString(5));
				
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
	
	//상품명 또는 Sort의 검색문구를 입력하여 분류하여 검색함
	//0819 06:22AM 수정중
	public List<productDto> searchProductList(String dataType, String searchWord,String sellerId) {
		List<productDto> list = new ArrayList<productDto>();
		String sql = " SELECT PRODUCT_SEQ, PRODUCT_NAME, PRODUCT_SORT FROM PRODUCT";
		String sqlplus = null;
					
		if(dataType.equals("productName")) {//상품명검색
			sqlplus= " WHERE PRODUCT_NAME LIKE ? AND SERRER_ID = ? ORDER BY PRODUCT_SEQ";
		}else {								//종류로 검색
			sqlplus = " WHERE PRODUCT_SORT LIKE ? AND SERRER_ID = ? ORDER BY PRODUCT_SEQ";
		}
		sql += sqlplus;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
	
			psmt.setString(1, "%"+searchWord+"%");
			psmt.setString(2, sellerId);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				productDto dto = new productDto();
				dto.setProductSeq(rs.getInt(1));
				dto.setProductName(rs.getString(2));
				dto.setProductSort(rs.getString(3));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
	//0819 04:56 seq로 data를 찾아서 product를 수정
	public boolean updateProduct(productDto dto) {
		String sql = " UPDATE PRODUCT SET PRODUCT_NAME = ?, PRODUCT_UNIT = (SELECT SEQ_NUM FROM PRODUCT_UNIT_CATE WHERE PRODUCT_UNIT = ?),"
				+ " PRODUCT_TRADE_PRICE = ?, PRODUCT_SORT = ?, PRODUCT_PIECE_BOX = ?, PRODUCT_STANDARD = ? WHERE PRODUCT_SEQ = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getProductName());
			psmt.setString(2, dto.getProductUnit());
			psmt.setInt(3, dto.getProductTradePrice());
			psmt.setString(4, dto.getProductSort());
			psmt.setInt(5, dto.getProductPieceBox());
			psmt.setString(6, dto.getProductStandard()+"ml");

			psmt.setInt(7, dto.getProductSeq());
			
			count =psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
	}
	
	//4시쯤한거같은데...
	public boolean deleteProduct(int productSeq) {
		String sql[] = {
			"ALTER TABLE ORDER_DETAIL DISABLE CONSTRAINT FK_ORDERDETAIL_PRODUCTSEQ",
			"DELETE FROM PRODUCT WHERE PRODUCT_SEQ = ?",
			"ALTER TABLE ORDER_DETAIL ENABLE NOVALIDATE CONSTRAINT FK_ORDERDETAIL_PRODUCTSEQ"
		};
		int count = 0;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			
			for(int i = 0; i<sql.length; i++) {
				psmt = conn.prepareStatement(sql[i]);
				if(i == 1) {
					psmt.setInt(1, productSeq);
					count = psmt.executeUpdate();
				}else {
					if(psmt.execute()) {
						System.out.println("쿼리처리중 문제발생");
						break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
	}
	// 물품의 세부사항을 적어서 저장하는 기능
	//0819 02:50 수정
	public boolean addproduct(productDto dto,String sellerId) {
		String sql[] = { 
				"SELECT PRODUCT_SEQ FROM PRODUCT WHERE PRODUCT_NAME = ? AND PRODUCT_UNIT = (SELECT SEQ_NUM FROM PRODUCT_UNIT_CATE WHERE PRODUCT_UNIT = ?) AND PRODUCT_SORT = ?"
				," INSERT INTO PRODUCT( PRODUCT_SEQ, PRODUCT_NAME, PRODUCT_UNIT, PRODUCT_TRADE_PRICE, PRODUCT_SORT, PRODUCT_PIECE_BOX, PRODUCT_STANDARD,SELLER_ID) "
				+ " VALUES( PRODUCT_SEQ.NEXTVAL, ?, (SELECT SEQ_NUM FROM PRODUCT_UNIT_CATE WHERE PRODUCT_UNIT = ?)"
				+ ", ?, ?, ?, ?, ?)"};
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql[0]);
			psmt.setString(1, dto.getProductName());
			psmt.setString(2, dto.getProductUnit());
			psmt.setString(3, dto.getProductSort());
			
			rs = psmt.executeQuery();
			if(!rs.next()) {
				//공통된 데이터가 없을때만 입력
				psmt = null;
				psmt = conn.prepareStatement(sql[1]);
				
				psmt.setString(1, dto.getProductName());
				psmt.setString(2, dto.getProductUnit());
				psmt.setInt(3, dto.getProductTradePrice());
				psmt.setString(4, dto.getProductSort());
				psmt.setInt(5, dto.getProductPieceBox());
				psmt.setString(6, dto.getProductStandard()+"ml");
				psmt.setString(7, sellerId);
				
				count = psmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return count>0?true:false;
	}
	
	//명칭좀 이쁘게 해주세요 무슨기능인지 한개도 모르겠어요
	//어느 종류(소주,맥주등등)에 대해서 가져오는 소스
	public List<String> getProductSortType(){
		
		List<String> list = new ArrayList<String>();
		
		String sql = " SELECT * FROM PRODUCT_SORT ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
	//UnitCategory의 종류를 받아와서 추가시 뿌려줄 예정 
	//수정시간 0819 02:11
	public List<String> getProductUnitType(){
		String sql = "SELECT PRODUCT_UNIT FROM PRODUCT_UNIT_CATE";
		List<String> list = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
	//ProductSeq의 번호를 구해서 제품을  찾음 
	//20200819 01:45수정
	public productDto getProductInfoBySeq(int productSeq) {
		productDto dto = new productDto();
		String sql = " SELECT P.PRODUCT_SEQ, P.PRODUCT_NAME, P.PRODUCT_TRADE_PRICE, P.PRODUCT_SORT, P.PRODUCT_PIECE_BOX, P.PRODUCT_STANDARD, U.PRODUCT_UNIT"
				+ " FROM PRODUCT P ,PRODUCT_UNIT_CATE U WHERE P.PRODUCT_UNIT=U.SEQ_NUM AND P.PRODUCT_SEQ = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, productSeq);
			//쿼리로 적용해서 결과값을 가져오는 역할
			rs  = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setProductSeq(rs.getInt(1)); 
				dto.setProductName(rs.getString(2));
				dto.setProductTradePrice(rs.getInt(3));
				dto.setProductSort(rs.getString(4));
				dto.setProductPieceBox(rs.getInt(5));
				dto.setProductStandard(rs.getString(6));
				dto.setProductUnit(rs.getString(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;
	}
	
	//모든 Product항목을 검색해서 List로 Return 해줌 Seq,Name,Sort만 가져간다 
	//20200819 01:00수정완료
	public List<productDto> getAllProductList(String sellerId){
		String sql = "SELECT PRODUCT_SEQ, PRODUCT_NAME, PRODUCT_SORT, PRODUCT_TRADE_PRICE, PRODUCT_STANDARD "
				+ " FROM PRODUCT WHERE SELLER_ID = ? ORDER BY PRODUCT_SEQ";
		
		List<productDto> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt  = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, sellerId);
			
			rs  = psmt.executeQuery();
			
			while(rs.next()) {
				productDto dto = new productDto();
				dto.setProductSeq(rs.getInt(1));
				dto.setProductName(rs.getString(2));
				dto.setProductSort(rs.getString(3));
				dto.setProductTradePrice(rs.getInt(4));
				dto.setProductStandard(rs.getString(5));
				
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