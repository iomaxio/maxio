select * from DEV_COMPUTE_DB.SALES_SCHEMA.SALES;

select * from DEV_COMPUTE_DB.SALES_SCHEMA.PRODUCTS;



---> Q. FOR EVERY 'iphone 13' SALES MODIFY THE DATABASE ACCORDINGLY

CREATE OR REPLACE PROCEDURE DEV_COMPUTE_DB.SALES_SCHEMA.pr_products_buy()
RETURNS STRING --VARCHAR(16777216)
LANGUAGE SQL
as
'
declare
    v_product_code string;
    v_price int;
    
begin

    select PRODUCT_CODE, PRICE
    into v_product_code, v_price
    from DEV_COMPUTE_DB.SALES_SCHEMA.PRODUCTS
    where PRODUCT_NAME = ''iphone 13'';

    insert into DEV_COMPUTE_DB.SALES_SCHEMA.SALES
    (ORDER_ID, ORDER_DATE, PRODUCT_CODE, QUANTITY_ORDER, SALES_PRICE)
    values
    (6,current_date,:v_product_code,1, (:v_price*1));

    update DEV_COMPUTE_DB.SALES_SCHEMA.PRODUCTS
    set 
    QUANTITY_REMAINING = (QUANTITY_REMAINING-1),
    QUANTITY_SOLD = (QUANTITY_SOLD+1)
    where
    PRODUCT_CODE =: v_product_code;



end';


CALL PR_PRODUCTS_BUY();














