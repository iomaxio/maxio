USE SCHEMA FALCON_SALES_DB.STAGGING_ZONE;

--- Create Streams under stagging zone schema.

CREATE OR REPLACE STREAM 
stagging_customer_stream on table FALCON_SALES_DB.STAGGING_ZONE.CUSTOMER_STG
append_only = TRUE;

CREATE OR REPLACE STREAM
stagging_market_stream on table FALCON_SALES_DB.STAGGING_ZONE.MARKET_STG
append_only = TRUE;

CREATE OR REPLACE STREAM
stagging_product_stream on table FALCON_SALES_DB.STAGGING_ZONE.PRODUCT_STG
append_only = TRUE;

SHOW STREAMS;

--- // Check Data Load in Stream Objects

SELECT * FROM stagging_customer_stream;