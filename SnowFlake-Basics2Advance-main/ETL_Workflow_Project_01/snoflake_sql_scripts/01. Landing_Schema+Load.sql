CREATE OR REPLACE DATABASE ETL_WORKFLOW_DB;

--- Step 1 : Create 3 schemas called Landing_zone, curated_zone, consumption_zone

CREATE OR REPLACE SCHEMA ETL_WORKFLOW_DB.landing_zone;
CREATE OR REPLACE SCHEMA ETL_WORKFLOW_DB.curated_zone;
CREATE OR REPLACE SCHEMA ETL_WORKFLOW_DB.consumption_zone;



--- Step 2: Create order, item & customer table in the landing_zone;

--- landing zone table will be transient table,
--- all the fields in these tables are varchar and not having specific data type to make sure all the data is loaded.

use schema landing_zone;


CREATE OR REPLACE TRANSIENT TABLE ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_ITEM(
    item_id varchar,
    item_desc varchar,
    start_date varchar,
    end_date varchar,
    price varchar,
    item_class varchar,
    item_category varchar
) comment = 'This is the item table with in the Landing Schema';


CREATE OR REPLACE TRANSIENT TABLE ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_CUSTOMER(
    customer_id varchar,
    salutation varchar,
    first_name varchar,
    last_name varchar,
    birth_day varchar,
    birth_month varchar,
    birth_year varchar,
    birth_country varchar,
    email_address varchar
) comment = 'This is the customer table in landing schema';


CREATE OR REPLACE TRANSIENT TABLE ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_ORDER(
    order_date varchar,
    order_time varchar,
    item_id varchar,
    item_desc varchar,
    customer_id varchar,
    salutation varchar,
    first_name varchar,
    last_name varchar,
    store_id varchar,
    store_name varchar,
    order_quantity varchar,
    sale_price varchar,
    discount_amt varchar,
    coupon_amt varchar,
    net_paid varchar,
    net_paid_tax varchar,
    net_profit varchar
) comment = 'This is the order table in landing schema';


show tables;


--- Step 3 Now time to create file format

CREATE OR REPLACE FILE FORMAT my_csv_load
    type = 'csv'
    compression = 'auto'
    field_delimiter = ','
    record_delimiter = '\n'
    skip_header = 1
    field_optionally_enclosed_by = '\042'
    null_if = ('\\N');

--- Step 4 Check my landing tables:
select * from ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_CUSTOMER;
select * from ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_ITEM;
select * from ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_ORDER;























