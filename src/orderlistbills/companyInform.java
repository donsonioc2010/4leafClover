package orderlistbills;

/*
B.BUYER_COMPANY_NAME,
B.BUYER_ADDRESS1 || B.BUYER_ADDRESS2 || B.BUYER_ADDRESS3,
S.SELLER_COMPANY_NAME, S.SELLER_CEO, S.SELLER_TEL_NUM,
S.SELLER_PHONE_NUM,
S.SELLER_ADDRESS1 || S.SELLER_ADDRESS2 ||S.SELLER_ADDRESS1 
*/
public class companyInform {

	private String buyer_company_name;
	private String buyer_address;
	private String seller_company_name;
	private String seller_ceo;
	private String seller_tel;
	private String seller_phone;
	private String address;
	
	public companyInform() {}

	public companyInform(String buyer_company_name, String buyer_address, String seller_company_name, String seller_ceo,
			String seller_tel, String seller_phone, String address) {
		super();
		this.buyer_company_name = buyer_company_name;
		this.buyer_address = buyer_address;
		this.seller_company_name = seller_company_name;
		this.seller_ceo = seller_ceo;
		this.seller_tel = seller_tel;
		this.seller_phone = seller_phone;
		this.address = address;
	}

	public String getBuyer_company_name() {
		return buyer_company_name;
	}

	public void setBuyer_company_name(String buyer_company_name) {
		this.buyer_company_name = buyer_company_name;
	}

	public String getBuyer_address() {
		return buyer_address;
	}

	public void setBuyer_address(String buyer_address) {
		this.buyer_address = buyer_address;
	}

	public String getSeller_company_name() {
		return seller_company_name;
	}

	public void setSeller_company_name(String seller_company_name) {
		this.seller_company_name = seller_company_name;
	}

	public String getSeller_ceo() {
		return seller_ceo;
	}

	public void setSeller_ceo(String seller_ceo) {
		this.seller_ceo = seller_ceo;
	}

	public String getSeller_tel() {
		return seller_tel;
	}

	public void setSeller_tel(String seller_tel) {
		this.seller_tel = seller_tel;
	}

	public String getSeller_phone() {
		return seller_phone;
	}

	public void setSeller_phone(String seller_phone) {
		this.seller_phone = seller_phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
