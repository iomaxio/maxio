USE SCHEMA ETL_WORKFLOW_DB.CURATED_ZONE;

--- Step 1, Create order, item and customer table in Curated zone.

create or replace transient table ETL_WORKFLOW_DB.CURATED_ZONE.CURATED_CUSTOMER
(
    customer_pk number autoincrement,
    customer_id varchar(30),
    salutation varchar(18),
    first_name varchar(20),
    last_name varchar(30),
    birth_day number,
    birth_month number,
    birth_year number,
    birth_country varchar(20),
    email_address varchar(50)
) comment = "This is the Customer table in Curated schema";


create or replace transient table ETL_WORKFLOW_DB.CURATED_ZONE.CURATED_ITEM
(
    item_pk number autoincrement,
    item_id varchar(16),
    item_desc varchar,
    start_date date,
    end_date date,
    price number(7,2),
    item_class varchar(50),
    item_category varchar(50)
    
) comment = "This is the ITEM table in Curated Schema";


create or replace transient table ETL_WORKFLOW_DB.CURATED_ZONE.CURATED_ORDER
(
    order_pk number autoincrement,
    order_date date,
    order_time varchar,
    item_id varchar(16),
    item_desc varchar,
    customer_id varchar,
    salutation varchar,
    first_name varchar,
    last_name varchar,
    store_id varchar,
    store_name varchar,
    order_quantity number,
    sale_price number(7,2),
    discount_amt number(7,2),
    coupon_amt number(7,2),
    net_paid number(7,2),
    net_paid_tax number(7,2),
    net_profit number(7,2)
    
) comment = " This is the ORDER table in Curated Schema";


---Step 2 : Now we will going load data from our Landing tables to Curated tables by using insert query.

insert into ETL_WORKFLOW_DB.CURATED_ZONE.CURATED_CUSTOMER
(CUSTOMER_ID, 
    SALUTATION, 
    FIRST_NAME, 
    LAST_NAME, 
    BIRTH_DAY, 
    BIRTH_MONTH, 
    BIRTH_YEAR, 
    BIRTH_COUNTRY, 
    EMAIL_ADDRESS
)
    select 
        CUSTOMER_ID, 
        SALUTATION, 
        FIRST_NAME, 
        LAST_NAME, 
        BIRTH_DAY, 
        BIRTH_MONTH, 
        BIRTH_YEAR, 
        BIRTH_COUNTRY, 
        EMAIL_ADDRESS
    from ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_CUSTOMER;



INSERT INTO ETL_WORKFLOW_DB.CURATED_ZONE.CURATED_ITEM
(
    ITEM_ID, 
    ITEM_DESC, 
    START_DATE, 
    END_DATE, 
    PRICE, 
    ITEM_CLASS, 
    ITEM_CATEGORY
)
SELECT 
    ITEM_ID, 
    ITEM_DESC, 
    START_DATE, 
    END_DATE, 
    PRICE, 
    ITEM_CLASS, 
    ITEM_CATEGORY
FROM ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_ITEM;



INSERT INTO ETL_WORKFLOW_DB.CURATED_ZONE.CURATED_ORDER
(ORDER_DATE, ORDER_TIME, ITEM_ID, ITEM_DESC, CUSTOMER_ID, SALUTATION, FIRST_NAME, LAST_NAME, STORE_ID, STORE_NAME, ORDER_QUANTITY, SALE_PRICE, DISCOUNT_AMT, COUPON_AMT, NET_PAID, NET_PAID_TAX, NET_PROFIT)
SELECT 
ORDER_DATE, ORDER_TIME, ITEM_ID, ITEM_DESC, CUSTOMER_ID, SALUTATION, FIRST_NAME, LAST_NAME, STORE_ID, STORE_NAME, ORDER_QUANTITY, SALE_PRICE, DISCOUNT_AMT, COUPON_AMT, NET_PAID, NET_PAID_TAX, NET_PROFIT
FROM ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_ORDER;



SELECT * FROM ETL_WORKFLOW_DB.CURATED_ZONE.CURATED_CUSTOMER;
SELECT * FROM ETL_WORKFLOW_DB.CURATED_ZONE.CURATED_ITEM;
SELECT * FROM ETL_WORKFLOW_DB.CURATED_ZONE.CURATED_ORDER;























