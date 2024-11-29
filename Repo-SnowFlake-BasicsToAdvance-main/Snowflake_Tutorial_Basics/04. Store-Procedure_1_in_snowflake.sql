USE DEV_COMPUTE_DB;

CREATE SCHEMA DEV_COMPUTE_DB.SALES_SCHEMA;


--- CREATE PRODUCT TABLE

CREATE OR REPLACE TABLE DEV_COMPUTE_DB.SALES_SCHEMA.PRODUCTS
(
    product_code string not null primary key, 
    product_name string, 
    price int, 
    quantity_remaining int not null, 
    quantity_sold int not null
);

--- INSERT RECORDS INTO PRODUCTS TABLE 

INSERT INTO DEV_COMPUTE_DB.SALES_SCHEMA.PRODUCTS
(PRODUCT_CODE, PRODUCT_NAME, PRICE, QUANTITY_REMAINING, QUANTITY_SOLD)
VALUES
('P1','iphone 13',50000,20,100),
('P2','iphone 14',65000,24,92),
('P3','iphone 14',78000,38,230),
('P4','Samsung s21 ultra',120000,50,120);


--- CREATE SALES TABLE

CREATE OR REPLACE TABLE DEV_COMPUTE_DB.SALES_SCHEMA.SALES
(
    order_id int not null primary key,
    order_date string,
    product_code string,
    quantity_order int,
    sales_price int 

);

--- INSERT INTO SALES TABLE


INSERT INTO DEV_COMPUTE_DB.SALES_SCHEMA.SALES
(ORDER_ID, ORDER_DATE, PRODUCT_CODE, QUANTITY_ORDER, SALES_PRICE)
VALUES
(1,'2022-01-21','P1',100,5000000),
(2,'2022-01-26','P1',20,1000000),
(3,'2022-08-15','P2',10,6500000);


select * from DEV_COMPUTE_DB.SALES_SCHEMA.SALES;

select * from DEV_COMPUTE_DB.SALES_SCHEMA.PRODUCTS;










