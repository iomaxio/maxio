--- Create 3 tasks in curated zone,
--- tasks will consume the data from stream objects created in landing zone.

USE SCHEMA ETL_WORKFLOW_DB.CURATED_ZONE;

--- // Create task for order in curated zone.

CREATE OR REPLACE TASK ETL_WORKFLOW_DB.CURATED_ZONE.order_curated_tsk
    warehouse = compute_wh
    schedule = '1 minute'
when
    system$stream_has_data('ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_ORDER_STREAM')

as
    merge into ETL_WORKFLOW_DB.CURATED_ZONE.CURATED_ORDER AS CuO
    using ETL_WORKFLOW_DB.LANDING_ZONE.LANDING_ORDER_STREAM AS LOS on 
    CuO.order_date = LOS.order_date and
    CuO.order_time = LOS.order_time and
    CuO.item_id = LOS.item_id and
    CuO.item_desc = LOS.item_desc
    
when matched
    then update set
    CuO.customer_id = LOS.customer_id,
    CuO.salutation = LOS.salutation,
    CuO.first_name = LOS.first_name,
    CuO.last_name = LOS.last_name,
    CuO.store_id = LOS.store_id,
    CuO.store_name = LOS.store_name,
    CuO.order_quantity = LOS.order_quantity,
    CuO.sale_price = LOS.sale_price,
    CuO.discount_amt = LOS.discount_amt,
    CuO.coupon_amt = LOS.coupon_amt,
    CuO.net_paid = LOS.net_paid,
    CuO.net_paid_tax = LOS.net_paid_tax,
    CuO.net_profit = LOS.net_profit
WHEN NOT MATCHED THEN
INSERT (
ORDER_DATE, ORDER_TIME, ITEM_ID, ITEM_DESC, CUSTOMER_ID, SALUTATION, FIRST_NAME, LAST_NAME, STORE_ID, STORE_NAME, ORDER_QUANTITY, SALE_PRICE, DISCOUNT_AMT, COUPON_AMT, NET_PAID, NET_PAID_TAX, NET_PROFIT
)
VALUES
(
    LOS.ORDER_DATE, 
    LOS.ORDER_TIME, 
    LOS.ITEM_ID, 
    LOS.ITEM_DESC, 
    LOS.CUSTOMER_ID, 
    LOS.SALUTATION, 
    LOS.FIRST_NAME, 
    LOS.LAST_NAME, 
    LOS.STORE_ID, 
    LOS.STORE_NAME, 
    LOS.ORDER_QUANTITY, 
    LOS.SALE_PRICE, 
    LOS.DISCOUNT_AMT, 
    LOS.COUPON_AMT, 
    LOS.NET_PAID, 
    LOS.NET_PAID_TAX, 
    LOS.NET_PROFIT
);
    

SHOW TASKS;

--- // For Resuming each tasks
ALTER TASK ETL_WORKFLOW_DB.CURATED_ZONE.ORDER_CURATED_TSK RESUME;














    