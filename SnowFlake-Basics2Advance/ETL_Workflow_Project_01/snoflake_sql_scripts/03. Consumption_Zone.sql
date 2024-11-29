USE SCHEMA ETL_WORKFLOW_DB.CONSUMPTION_ZONE;

--- Create fact and dimension tables in our Consumption zone.
CREATE OR REPLACE TABLE ETL_WORKFLOW_DB.CONSUMPTION_ZONE.ITEM_DIM
(
    item_dim_key number autoincrement,
    item_id varchar(16),
    item_desc varchar,
    start_date date,
    end_date date,
    price number(7,2),
    item_class varchar(50),
    item_category varchar(50),
    added_timestamp timestamp default current_timestamp(),
    active_flag varchar(1) default 'Y'
) comment="This is item dim table present in Consumption zone";


CREATE OR REPLACE TABLE ETL_WORKFLOW_DB.CONSUMPTION_ZONE.CUSTOMER_DIM
(
    customer_dim_key number autoincrement,
    customer_id varchar(30),
    salutation varchar(18),
    first_name varchar(20),
    last_name varchar(30),
    birth_day number,
    birth_month number,
    birth_year number,
    birth_country varchar(20),
    email_address varchar(50),
    added_timestamp timestamp default current_timestamp(),
    active_flag varchar(1) default 'Y'
) comment = "This is Customer dim table present in the consumption zone";




CREATE OR REPLACE TABLE ETL_WORKFLOW_DB.CONSUMPTION_ZONE.ORDER_DIM
(
    order_fact_key number autoincrement,
    customer_dim_key number,
    item_dim_key number,
    order_date date,
    order_count number,
    order_quantity number,
    sale_price number(7,2),
    discount_amt number(7,2),
    coupon_amt number(7,2),
    net_paid number(7,2),
    net_paid_tax number(7,2),
    net_profit number(7,2)
    
) comment = "This is Order Fact table present in consumption layer";
















