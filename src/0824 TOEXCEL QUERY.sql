-- buyerSeq 66 orderdate 20200824
SELECT * FROM PRODUCT;
SELECT * FROM PRODUCT_UNIT_CATE;
SELECT * FROM ORDER_DETAIL;
select * from order_list where buyer_seq = 66 and order_date='20200824';

select D.ORDER_NUM, B.SELLER_ID,P.PRODUCT_NAME,PU.PRODUCT_UNIT ,B.BUYER_COMPANY_NAME, L.ORDER_DATE,
    L.ORDER_SUPPLY_PRICE,L.ORDER_TAX_VALUE,L.ORDER_TOTAL,
    D.ORDER_COUNT, D.ORDER_PRICE,D.PRICE_TAX,D.PRICE_SUM
    FROM ORDER_LIST L, order_detail D, PRODUCT P,BUYER B ,PRODUCT_UNIT_CATE PU
    where D.PRODUCT_SEQ = P.PRODUCT_SEQ 
            AND P.PRODUCT_UNIT = PU.SEQ_NUM
            and D.order_num = L.ORDER_NUM
            AND B.BUYER_SEQ = L.BUYER_SEQ
            AND L.BUYER_SEQ = 66 
            AND ORDER_DATE='20200824';