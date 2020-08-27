package buyer;

import java.io.Serializable;

/*
DROP TABLE BUYER								--���̺����
CASCADE CONSTRAINTS;
 
DROP SEQUENCE SEQ_BUYER;						--������ ���� 

CREATE TABLE BUYER(
BUYER_SEQ NUMBER(8) NOT NULL,               	--����(������)
SELLER_ID VARCHAR2(50) PRIMARY KEY,          	--SEQ
BUYER_COMPANY_NAME VARCHAR2(50) NOT NULL,    	--�ŷ�ó��
BUYER_CEO VARCHAR2(50) NOT NULL,             	--��ǥ��
BUYER_BUSINESS_CONDITION VARCHAR2(50) NOT NULL, --����
BUYER_BUSINESS_KINDS VARCHAR2(50) NOT NULL, 	--����
BUYER_COMPANY_NUM VARCHAR2(50) NOT NULL, 		--����ڹ�ȣ
BUYER_ADDRESS1 VARCHAR2(50) NOT NULL, 			--�ּ�1(���θ�)
BUYER_ADDRESS2 VARCHAR2(50) NOT NULL,  			--�ּ�2(�ּ�)
BUYER_ADDRESS3 VARCHAR2(50) NOT NULL,  			--�ּ�3(���ּ�)
BUYER_ADMIN VARCHAR2(50) NOT NULL, 				--�����
BUYER_EMAIL VARCHAR2(50) NOT NULL,				--�̸���
BUYER_TEL_NUM VARCHAR2(50),         			--����ó
BUYER_DATE DATE NOT NULL,                       --DATE
BUYER_MEMO VARCHAR2(200),                    	--�޸�
BUYER_HOMEPAGE VARCHAR2(100) NOT NULL        	--����Ʈ
);
 
CREATE SEQUENCE SEQ_BUYER						--�������߰�
START WITH 1
INCREMENT BY 1;
 
SELECT * FROM BUYER;							--���̺�Ȯ��
 */
public class BuyerDto implements Serializable {
	private int buyer_seq;
	private String seller_id;
	private String buyer_company_name; // �ŷ�ó��
	private String buyer_ceo; // ��ǥ�ڸ�
	private String buyer_business_condition; // ����
	private String buyer_business_kinds; // ����
	private String buyer_company_num; // ����ڹ�ȣ
	private String buyer_address1; // �ּ�(���θ�)
	private String buyer_address2; // ���ּ�
	private String buyer_address3; // �����ּ�
	private String buyer_admin; // �����
	private String buyer_email; // �̸���
	private String buyer_tel_num; // ��ȭ��ȣ
	private String buyer_date; // �ŷ�����
	private String buyer_memo; // �ŷ��޸�
	private String buyer_homepage; // ����Ʈ

	public BuyerDto() {}

	public BuyerDto(int buyer_seq, String seller_id, String buyer_company_name, String buyer_ceo,
			String buyer_business_condition, String buyer_business_kinds, String buyer_company_num,
			String buyer_address1, String buyer_address2, String buyer_address3, String buyer_admin, String buyer_email,
			String buyer_tel_num, String buyer_date, String buyer_memo, String buyer_homepage) {
		super();
		this.buyer_seq = buyer_seq;
		this.seller_id = seller_id;
		this.buyer_company_name = buyer_company_name;
		this.buyer_ceo = buyer_ceo;
		this.buyer_business_condition = buyer_business_condition;
		this.buyer_business_kinds = buyer_business_kinds;
		this.buyer_company_num = buyer_company_num;
		this.buyer_address1 = buyer_address1;
		this.buyer_address2 = buyer_address2;
		this.buyer_address3 = buyer_address3;
		this.buyer_admin = buyer_admin;
		this.buyer_email = buyer_email;
		this.buyer_tel_num = buyer_tel_num;
		this.buyer_date = buyer_date;
		this.buyer_memo = buyer_memo;
		this.buyer_homepage = buyer_homepage;
	}

	public BuyerDto(String seller_id, String buyer_company_name, String buyer_ceo, String buyer_business_condition,
			String buyer_business_kinds, String buyer_company_num, String buyer_address1, String buyer_address2,
			String buyer_address3, String buyer_admin, String buyer_email, String buyer_tel_num, String buyer_date,
			String buyer_memo, String buyer_homepage) {
		super();
		this.seller_id = seller_id;
		this.buyer_company_name = buyer_company_name;
		this.buyer_ceo = buyer_ceo;
		this.buyer_business_condition = buyer_business_condition;
		this.buyer_business_kinds = buyer_business_kinds;
		this.buyer_company_num = buyer_company_num;
		this.buyer_address1 = buyer_address1;
		this.buyer_address2 = buyer_address2;
		this.buyer_address3 = buyer_address3;
		this.buyer_admin = buyer_admin;
		this.buyer_email = buyer_email;
		this.buyer_tel_num = buyer_tel_num;
		this.buyer_date = buyer_date;
		this.buyer_memo = buyer_memo;
		this.buyer_homepage = buyer_homepage;
	}

	public BuyerDto(String buyer_company_name, String buyer_ceo, String buyer_business_condition,
			String buyer_business_kinds, String buyer_company_num, String buyer_address1, String buyer_address2,
			String buyer_address3, String buyer_admin, String buyer_email, String buyer_tel_num, String buyer_memo,
			String buyer_homepage) {
		super();
		this.buyer_company_name = buyer_company_name;
		this.buyer_ceo = buyer_ceo;
		this.buyer_business_condition = buyer_business_condition;
		this.buyer_business_kinds = buyer_business_kinds;
		this.buyer_company_num = buyer_company_num;
		this.buyer_address1 = buyer_address1;
		this.buyer_address2 = buyer_address2;
		this.buyer_address3 = buyer_address3;
		this.buyer_admin = buyer_admin;
		this.buyer_email = buyer_email;
		this.buyer_tel_num = buyer_tel_num;
		this.buyer_memo = buyer_memo;
		this.buyer_homepage = buyer_homepage;
	}

	public int getBuyer_seq() {return buyer_seq;}
	public void setBuyer_seq(int buyer_seq) {this.buyer_seq = buyer_seq;}

	public String getSeller_id() {return seller_id;}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getBuyer_company_name() {
		return buyer_company_name;
	}

	public void setBuyer_company_name(String buyer_company_name) {
		this.buyer_company_name = buyer_company_name;
	}

	public String getBuyer_ceo() {
		return buyer_ceo;
	}

	public void setBuyer_ceo(String buyer_ceo) {
		this.buyer_ceo = buyer_ceo;
	}

	public String getBuyer_business_condition() {
		return buyer_business_condition;
	}

	public void setBuyer_business_condition(String buyer_business_condition) {
		this.buyer_business_condition = buyer_business_condition;
	}

	public String getBuyer_business_kinds() {
		return buyer_business_kinds;
	}

	public void setBuyer_business_kinds(String buyer_business_kinds) {
		this.buyer_business_kinds = buyer_business_kinds;
	}

	public String getBuyer_company_num() {
		return buyer_company_num;
	}

	public void setBuyer_company_num(String buyer_company_num) {
		this.buyer_company_num = buyer_company_num;
	}

	public String getBuyer_address1() {
		return buyer_address1;
	}

	public void setBuyer_address1(String buyer_address1) {
		this.buyer_address1 = buyer_address1;
	}

	public String getBuyer_address2() {
		return buyer_address2;
	}

	public void setBuyer_address2(String buyer_address2) {
		this.buyer_address2 = buyer_address2;
	}

	public String getBuyer_address3() {
		return buyer_address3;
	}

	public void setBuyer_address3(String buyer_address3) {
		this.buyer_address3 = buyer_address3;
	}

	public String getBuyer_admin() {
		return buyer_admin;
	}

	public void setBuyer_admin(String buyer_admin) {
		this.buyer_admin = buyer_admin;
	}

	public String getBuyer_email() {
		return buyer_email;
	}

	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}

	public String getBuyer_tel_num() {
		return buyer_tel_num;
	}

	public void setBuyer_tel_num(String buyer_tel_num) {
		this.buyer_tel_num = buyer_tel_num;
	}

	public String getBuyer_date() {
		return buyer_date;
	}

	public void setBuyer_date(String buyer_date) {
		this.buyer_date = buyer_date;
	}

	public String getBuyer_memo() {
		return buyer_memo;
	}

	public void setBuyer_memo(String buyer_memo) {
		this.buyer_memo = buyer_memo;
	}

	public String getBuyer_homepage() {
		return buyer_homepage;
	}

	public void setBuyer_homepage(String buyer_homepage) {
		this.buyer_homepage = buyer_homepage;
	}
}
