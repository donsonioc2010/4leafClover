package buyer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import db.DBClose;
import db.DBConnection;


public class BuyerDao {

	private static BuyerDao dao = new BuyerDao();

	public BuyerDao() {
		DBConnection.initConnection();
	}

	public static BuyerDao getInstance() {
		return dao;
	}

// �ŷ�ó �߰� (�Ϸ�)------------------------------------------------------------------------------------
	public boolean addBuyer(BuyerDto dto) {

		String sql = " INSERT INTO BUYER (BUYER_SEQ, SELLER_ID, "
				+ " BUYER_COMPANY_NAME,  BUYER_CEO, BUYER_BUSINESS_CONDITION, "
				+ " BUYER_BUSINESS_KINDS,  BUYER_COMPANY_NUM, "
				+ " BUYER_ADDRESS1, BUYER_ADDRESS2, " 
				+ " BUYER_ADDRESS3, BUYER_ADMIN,  BUYER_EMAIL, "
				+ " BUYER_TEL_NUM,  BUYER_DATE,  BUYER_MEMO, "
				+ " BUYER_HOMEPAGE ) VALUES(SEQ_BUYER.NEXTVAL, ?, ?, ?, ?, "
				+ " ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, ?) ";

		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;

		try {
			conn = DBConnection.getConnection();

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getSeller_id());
			psmt.setString(2, dto.getBuyer_company_name());
			psmt.setString(3, dto.getBuyer_ceo());
			psmt.setString(4, dto.getBuyer_business_condition());
			psmt.setString(5, dto.getBuyer_business_kinds());
			psmt.setString(6, dto.getBuyer_company_num());
			psmt.setString(7, dto.getBuyer_address1());
			psmt.setString(8, dto.getBuyer_address2());
			psmt.setString(9, dto.getBuyer_address3());
			psmt.setString(10, dto.getBuyer_admin());
			psmt.setString(11, dto.getBuyer_email());
			psmt.setString(12, dto.getBuyer_tel_num());
			psmt.setString(13, dto.getBuyer_memo());
			psmt.setString(14, dto.getBuyer_homepage());
			
			count = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);

		}
		return count > 0 ? true : false;
	}
	
// 로그인한 유저와 관계된 모든 Buyer List Return 
	public List<BuyerDto> getBuyerList(String id){
		String sql = " SELECT BUYER_SEQ,  SELLER_ID,  BUYER_COMPANY_NAME,  BUYER_CEO,  BUYER_BUSINESS_CONDITION,  BUYER_BUSINESS_KINDS, "
				   + " BUYER_COMPANY_NUM,  BUYER_ADDRESS1,  BUYER_ADDRESS2,  BUYER_ADDRESS3,  BUYER_ADMIN,  BUYER_EMAIL,  BUYER_TEL_NUM,  BUYER_DATE, "
				   + " BUYER_MEMO,  BUYER_HOMEPAGE  FROM BUYER  WHERE SELLER_ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BuyerDto> list = new ArrayList<BuyerDto>();
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,id);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				BuyerDto dto = new BuyerDto(rs.getInt(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),
											rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),
											rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++)
											);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

// 로그인한 유저의 Buyer중에서 검색를 한 결과를 Return
	public List<BuyerDto> getBuyerList(String allchoice, String allsearch,String sellderId){
		String sql = " SELECT  BUYER_SEQ,  SELLER_ID,  BUYER_COMPANY_NAME,  BUYER_CEO,  BUYER_BUSINESS_CONDITION,  BUYER_BUSINESS_KINDS, "
				   + " BUYER_COMPANY_NUM,  BUYER_ADDRESS1,  BUYER_ADDRESS2,  BUYER_ADDRESS3,  BUYER_ADMIN,  BUYER_EMAIL, "
				   + " BUYER_TEL_NUM, BUYER_DATE,  BUYER_MEMO, BUYER_HOMEPAGE  FROM BUYER";
		
		String sqlword = "";
		if(allchoice.equals("companyname")) {      //회사명 검색시
			sqlword = " WHERE SELLER_ID = ? AND BUYER_COMPANY_NAME LIKE '%" + allsearch.trim() + "%' ";
		}else if(allchoice.equals("ceoname")) {    // ceo명으로 검색시
			sqlword = " WHERE SELLER_ID = ? AND  BUYER_CEO LIKE '%" + allsearch.trim() + "%' "; 
		}else if(allchoice.equals("companynum")) { // 사업자 번호로 검색시
			sqlword = " WHERE SELLER_ID = ? AND  BUYER_COMPANY_NUM LIKE '%" + allsearch.trim() + "%'";
		}
		sql = sql + sqlword;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BuyerDto> list = new ArrayList<BuyerDto>();
		
		try {
			conn = DBConnection.getConnection();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, sellderId);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int i = 1;
				BuyerDto dto = new BuyerDto(rs.getInt(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),
											rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),
											rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++),rs.getString(i++));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	//단어를 검색해서 해당 단어가 포함된 회사의 리스트만 뽑아옴
	public List<BuyerDto> getBuyerSearchThreeInfo(String id,String type,String searchWord){
        String sql = " SELECT "
                   + " BUYER_SEQ, BUYER_COMPANY_NAME, BUYER_CEO, BUYER_COMPANY_NUM, BUYER_TEL_NUM "
                   + " FROM BUYER WHERE SELLER_ID = ? ";
        //type = 1:전체 2:CompanyName 3:Ceo 4:CompanyNum 5:TelNum
        String addSql = null;
        
        if(type.equals("1")) {
        	addSql="";
        }else if(type.equals("2")) {
        	addSql="AND BUYER_COMPANY_NAME LIKE ?";
        }else if(type.equals("3")) {
        	addSql="AND BUYER_CEO LIKE ?";
        }else if(type.equals("4")) {
        	addSql="AND BUYER_COMPANY_NAME LIKE ?";
        }else if(type.equals("5")) {
        	addSql="AND BUYER_TEL_NUM LIKE ?";
        }
        sql = sql + addSql;

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        
        List<BuyerDto> list = new ArrayList<BuyerDto>();
        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setString(1,id);
            if(!type.equals("1")) {
            	psmt.setString(2, "%"+searchWord+"%");
            }
            rs = psmt.executeQuery();
            while (rs.next()) {
            	int i = 1;
                BuyerDto dto = new BuyerDto();
                dto.setBuyer_seq(rs.getInt(i++));
                dto.setBuyer_company_name(rs.getString(i++));
                dto.setBuyer_ceo(rs.getString(i++));
                dto.setBuyer_company_num(rs.getString(i++));
                dto.setBuyer_tel_num(rs.getString(i++));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBClose.close(psmt, conn, rs);
        }
        return list;
    }    
    //Company_list에 사용하는 seq,회사명,Ceo명만 가져옴
    public List<BuyerDto> getBuyerListThreeInfo(String id){
        //16��
        String sql = " SELECT "
                   + " BUYER_SEQ, BUYER_COMPANY_NAME, BUYER_CEO, BUYER_COMPANY_NUM, BUYER_TEL_NUM "
                   + " FROM BUYER WHERE SELLER_ID = ? ";
        
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        
        List<BuyerDto> list = new ArrayList<BuyerDto>();
        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setString(1,id);
            rs = psmt.executeQuery();
            while (rs.next()) {
            	int i = 1;
                BuyerDto dto = new BuyerDto();
                dto.setBuyer_seq(rs.getInt(i++));
                dto.setBuyer_company_name(rs.getString(i++));
                dto.setBuyer_ceo(rs.getString(i++));
                dto.setBuyer_company_num(rs.getString(i++));
                dto.setBuyer_tel_num(rs.getString(i++));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBClose.close(psmt, conn, rs);
        }
        return list;
    }    
// 거래처 리스트가져오기-------------------------------------------------------------------
	public BuyerDto getBuyerInfo(int seq) {
		BuyerDto dto= null;
		String sql = "SELECT * FROM BUYER WHERE BUYER_SEQ = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				int i = 1;
				dto = new BuyerDto(rs.getInt(i++),
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
							rs.getString(i++),
							rs.getString(i++),
							rs.getString(i++),
							rs.getString(i++)
						);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
	}
	
// 거래처 수정-------------------------------------------------------
	public boolean updateaccount(BuyerDto dto, int seq) {
		String sql = " UPDATE BUYER SET "
				+ " BUYER_COMPANY_NAME=?, "
				+ " BUYER_CEO=?,"
				+ " BUYER_BUSINESS_CONDITION=?, "
				+ " BUYER_BUSINESS_KINDS=?, "
				+ " BUYER_COMPANY_NUM=?, "
				+ " BUYER_ADDRESS1=?, "
				+ " BUYER_ADDRESS2=?, "
				+ " BUYER_ADDRESS3=?, "
				+ " BUYER_ADMIN=?, "
				+ " BUYER_EMAIL=?, "
				+ " BUYER_TEL_NUM=?, "
				+ " BUYER_MEMO=?, "
				+ " BUYER_HOMEPAGE=? "
				+ " WHERE BUYER_SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count  = 0; 
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 updateaccount success");
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getBuyer_company_name());
			psmt.setString(2, dto.getBuyer_ceo());
			psmt.setString(3, dto.getBuyer_business_condition());
			psmt.setString(4, dto.getBuyer_business_kinds());
			psmt.setString(5, dto.getBuyer_company_num());
			psmt.setString(6, dto.getBuyer_address1());
			psmt.setString(7, dto.getBuyer_address2());
			psmt.setString(8, dto.getBuyer_address3());
			psmt.setString(9, dto.getBuyer_admin());
			psmt.setString(10, dto.getBuyer_email());
			psmt.setString(11, dto.getBuyer_tel_num());
			psmt.setString(12, dto.getBuyer_memo());
			psmt.setString(13, dto.getBuyer_homepage());
			psmt.setInt(14, seq);
			
			System.out.println("2/6 updateaccount success");
			
			
			count =  psmt.executeUpdate();
			System.out.println("3/6 updateaccount success");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
			return count>0?true:false;
	}
	
// 거래처 삭제----------------------------------------------------
	public boolean accountdel(String sellerId, String buyerCompanyName){
		
		String sql[] = {" ALTER TABLE ORDER_LIST DISABLE CONSTRAINT FK_BUYER_SEQ ",
				 "DELETE FROM BUYER WHERE SELLER_ID=? AND BUYER_COMPANY_NAME=?" ,
				 "ALTER TABLE ORDER_LIST ENABLE NOVALIDATE CONSTRAINT FK_BUYER_SEQ"
		};
		Connection conn = null;
		PreparedStatement psmt = null;
		System.out.println("1/6 accountdel success");
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			for(int i=0; i<sql.length;i++) {
				psmt =conn.prepareStatement(sql[i]);
				
				if(i==1) {
					psmt.setString(1, sellerId);
					psmt.setString(2, buyerCompanyName);
					System.out.println("3/6 accountdel success");
					count = psmt.executeUpdate();
					System.out.println(i);
				}else {
					psmt.executeUpdate();
				}
				
				
			}
			System.out.println("4/6 accountdel success");
		} catch (Exception e) {
			System.out.println("fail accountdel");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;
	}
}

