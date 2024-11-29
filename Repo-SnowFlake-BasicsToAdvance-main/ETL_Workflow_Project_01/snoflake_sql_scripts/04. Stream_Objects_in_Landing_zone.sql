 --- 1. Create Streams under landing zone schema.
 --- 2. Create task under curated zone schema.
 --- 3. Resume task and validate that they are running under curated zone.

 use schema ETL_WORKFLOW_DB.LANDING_ZONE;

 --- Creating 3 stream objects: item, customer & order stream in landing_zone schema.
 --- all of them are append only.

CREATE OR REPLACE STREAM 
landing_item_stream on table ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_ITEM
append_only = TRUE;

CREATE OR REPLACE STREAM 
landing_customer_stream on table ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_CUSTOMER
append_only = TRUE;

CREATE OR REPLACE STREAM 
landing_order_stream on table ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_ORDER
append_only = TRUE;

show streams;
 

 
 