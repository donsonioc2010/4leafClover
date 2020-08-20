package Seller;
/*
CREATE TABLE SELLER
(
    SELLER_ID                    VARCHAR2(20)    NOT NULL, 
    SELLER_PWD                   VARCHAR2(20)    NOT NULL, 
    SELLER_COMPANY_NAME          VARCHAR2(50)    NOT NULL, 
    SELLER_CEO                   VARCHAR2(10)    NOT NULL, 
    SELLER_COMPANY_NUMBER        VARCHAR2(20)    NOT NULL, 
    SELLER_BUSINESS_CONDITION    VARCHAR2(40)    NOT NULL, 
    SELLER_BUSINESS_KIND         VARCHAR2(30)    NOT NULL, 
    SELLER_ADDRESS1              VARCHAR2(20)    NOT NULL, 
    SELLER_ADDRESS2              VARCHAR2(60)    NOT NULL, 
    SELLER_ADDRESS3              VARCHAR2(100)    NOT NULL, 
    SELLER_TEL_NUM               VARCHAR2(20)    NOT NULL, 
    SELLER_PHONE_NUM             VARCHAR2(20)    NOT NULL, 
    SELLER_EMAIL                 VARCHAR2(50)    NOT NULL, 
    CONSTRAINT SELLER_PK PRIMARY KEY (SELLER_ID)
)
*/
public class sellerDto {
	private String id;
	private String pw;
	private String companyName;
	private String ceo;
	private String companyNumber;
	private String businessCondition;
	private String businessKind;
	private String address1;
	private String address2;
	private String address3;
	private String tel;
	private String phone;
	private String email;
	public sellerDto() {
		// TODO Auto-generated constructor stub
	}
	
	public sellerDto(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public sellerDto(String id, String pw, String companyName, String ceo, String companyNumber,
			String businessCondition, String businessKind, String address1, String address2, String address3,
			String tel, String phone, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.companyName = companyName;
		this.ceo = ceo;
		this.companyNumber = companyNumber;
		this.businessCondition = businessCondition;
		this.businessKind = businessKind;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.tel = tel;
		this.phone = phone;
		this.email = email;
	}
	
	
	
	public sellerDto(String companyName, String ceo, String companyNumber, String businessCondition,
			String businessKind, String address1, String address2, String address3, String tel,String phone,
			String email) {
		super();
		this.companyName = companyName;
		this.ceo = ceo;
		this.companyNumber = companyNumber;
		this.businessCondition = businessCondition;
		this.businessKind = businessKind;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.tel = tel;
		this.phone = phone;
		this.email = email;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getCompanyNumber() {
		return companyNumber;
	}
	public void setCompanyNumber(String companyNumber) {
		this.companyNumber = companyNumber;
	}
	public String getBusinessCondition() {
		return businessCondition;
	}
	public void setBusinessCondition(String businessCondition) {
		this.businessCondition = businessCondition;
	}
	public String getBusinessKind() {
		return businessKind;
	}
	public void setBusinessKind(String businessKind) {
		this.businessKind = businessKind;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "sellerDto [id=" + id + ", pw=" + pw + ", companyName=" + companyName + ", ceo=" + ceo
				+ ", companyNumber=" + companyNumber + ", businessCondition=" + businessCondition + ", businessKind="
				+ businessKind + ", address1=" + address1 + ", address2=" + address2 + ", address3=" + address3
				+ ", tel=" + tel + ", phone=" + phone + ", email=" + email + "]";
	}
	
	
	
}
