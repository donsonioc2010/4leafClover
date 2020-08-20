 --BUYER_Table
    --BUYER �ܷ�Ű �߰�
    ALTER TABLE BUYER
        ADD CONSTRAINT FK_BUYER_SELLER_ID FOREIGN KEY (SELLER_ID) REFERENCES  SELLER(SELLER_ID);
    
    --BUYER
    ALTER TABLE BUYER
        ADD CONSTRAINT PK_BUYER_SEQ PRIMARY KEY (BUYER_SEQ);
    --BUYER���̺� ������ ����
    DELETE FROM BUYER;
    
     --BUYER ���̺� PRIMARYŰ ����
    ALTER TABLE BUYER DROP PRIMARY KEY;

--ORDER LIST Table
    
    --�ܷ�Ű ����
        --BUYER_SEQ����
    ALTER TABLE ORDER_LIST
        ADD CONSTRAINT FK_BUYER_SEQ FOREIGN KEY (BUYER_SEQ) REFERENCES BUYER(BUYER_SEQ);
    
    ALTER TABLE ORDER_LIST
        ADD CONSTRAINT FK_PRODUCT_SEQ FOREIGN KEY (PRODUCT_SEQ) REFERENCES PRODUCT(PRODUCT_SEQ);


--SELLER Table
    --Ÿ�� �뷮����    
    ALTER TABLE SELLER
    MODIFY SELLER_ID VARCHAR2(50);

--PRODUCT
    --PRODUCT_STANDARD NOT NULL DELETE (CONSTARINT�� �̹� ������)
    ALTER TABLE PRODUCT DROP CONSTRAINT SYS_C007079;
    ALTER TABLE PRODUCT DROP CONSTRAINT SYS_C007078;
    --PRODUCT_SORT �뷮����
    ALTER TABLE PRODUCT MODIFY PRODUCT_SORT VARCHAR2(100);
    
    DELETE FROM PRODUCT;
    INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL,'CASS',(SELECT SEQ_NUM FROM PRODUCT_UNIT_CATE WHERE PRODUCT_UNIT = 'ĵ'),1800,'����',6,NULL);
    INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL,'CASS',(SELECT SEQ_NUM FROM PRODUCT_UNIT_CATE WHERE PRODUCT_UNIT = 'ĵ'),1800,'����',30,NULL);
    INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL,'���̽�',(SELECT SEQ_NUM FROM PRODUCT_UNIT_CATE WHERE PRODUCT_UNIT = '��'),990,'�Ϲ�������',30,NULL);
    INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL,'���̽�',(SELECT SEQ_NUM FROM PRODUCT_UNIT_CATE WHERE PRODUCT_UNIT = '��'),2700,'�Ϲ�������',30,NULL);
    INSERT INTO PRODUCT VALUES (PRODUCT_SEQ.NEXTVAL,'�ۼַ�Ʈ',(SELECT SEQ_NUM FROM PRODUCT_UNIT_CATE WHERE PRODUCT_UNIT = '��'),45000,'����',NULL,NULL);
    
    
    SELECT * FROM PRODUCT_SORT;
    COMMIT;

--PRODUCT_SORT 
    -- TABLE ����
        --�ܷ�Ű
    --ALTER TABLE PRODUCT_SORT DROP PRIMARY KEY; 
    
    --DELETE FROM PRODUCT_SORT;
    --DATA_INSERT
    INSERT INTO PRODUCT_SORT VALUES('Ź��');
    INSERT INTO PRODUCT_SORT VALUES('����');
    INSERT INTO PRODUCT_SORT VALUES('����');
    INSERT INTO PRODUCT_SORT VALUES('û��');
    INSERT INTO PRODUCT_SORT VALUES('������');
    INSERT INTO PRODUCT_SORT VALUES('����');
    INSERT INTO PRODUCT_SORT VALUES('�����ļ���');
    INSERT INTO PRODUCT_SORT VALUES('�񼮽ļ���');
    INSERT INTO PRODUCT_SORT VALUES('����Ű');
    INSERT INTO PRODUCT_SORT VALUES('�귣��');
    INSERT INTO PRODUCT_SORT VALUES('����');
    INSERT INTO PRODUCT_SORT VALUES('�Ϲ�������');
    INSERT INTO PRODUCT_SORT VALUES('��ť��');
    INSERT INTO PRODUCT_SORT VALUES('��Ÿ�ַ�');
    

--PRODUCT_UNIT_CATE
    --CREATE SEQ
    CREATE SEQUENCE SEQ_UNIT_CATE
        START WITH 1
        INCREMENT BY 1
        MINVALUE 1;
        
    --INSERT DATA
    INSERT INTO PRODUCT_UNIT_CATE VALUES(SEQ_UNIT_CATE.NEXTVAL,'��');
    INSERT INTO PRODUCT_UNIT_CATE VALUES(SEQ_UNIT_CATE.NEXTVAL,'��');
    INSERT INTO PRODUCT_UNIT_CATE VALUES(SEQ_UNIT_CATE.NEXTVAL,'ĵ');
    INSERT INTO PRODUCT_UNIT_CATE VALUES(SEQ_UNIT_CATE.NEXTVAL,'��Ʈ');
    INSERT INTO PRODUCT_UNIT_CATE VALUES(SEQ_UNIT_CATE.NEXTVAL,'������');
    
    
--PRODUCT_STANDARD_CATE����
    ALTER TABLE PRODUCT
        DROP CONSTRAINT FK_PRODUCT_PRODUCT_STANDARD_PR;
    DROP TABLE PRODUCT_STANDARD_CATE;
    COMMIT;