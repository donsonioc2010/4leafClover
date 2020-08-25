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

ALTER TABLE SELLER
    ADD CONSTRAINT UC_SELLER_COMPANY_NUMBER UNIQUE (SELLER_COMPANY_NUMBER);

commit;

INSERT INTO SELLER VALUES ('test1','test1','�׽�Ʈ1','������','test1','�׽�Ʈ����','�׽�Ʈ����','�׽�Ʈ�ּ�1','�׽�Ʈ�ּ�2','�׽�Ʈ�ּ�3','�׽�Ʈ����','�׽�Ʈ����','�׽�Ʈ�̸���@�̸���');

select * from seller;