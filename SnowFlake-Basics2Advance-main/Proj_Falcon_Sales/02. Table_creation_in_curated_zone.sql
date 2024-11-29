USE SCHEMA FALCON_SALES_DB.CURATED_ZONE;


CREATE OR REPLACE TRANSIENT TABLE FALCON_SALES_DB.CURATED_ZONE.CUSTOMER_CURATED
(
    CUSTOMER_CODE VARCHAR(10),
    CUSTOMER_NAME VARCHAR(30),
    CUSTOMER_TYPE VARCHAR(10),
    LOAD_DATE_TIMESTAMP timestamp default current_timestamp()
    
) COMMENT = "CUSTOMER_STG is created in CURATED_ZONE";

CREATE OR REPLACE TRANSIENT TABLE FALCON_SALES_DB.CURATED_ZONE.PRODUCT_CURATED
(
    PRODUCT_CODE VARCHAR(10),
    PRODUCT_TYPE VARCHAR(10),
    LOAD_DATE_TIMESTAMP timestamp default current_timestamp()
    
)COMMENT = "PRODUCT_STG is created in CURATED_ZONE";

CREATE OR REPLACE TRANSIENT TABLE FALCON_SALES_DB.CURATED_ZONE.MARKET_CURATED
(
    MARKET_CODE VARCHAR(10),
    MARKET_NAME VARCHAR(20),
    ZONE VARCHAR(10),
    LOAD_DATE_TIMESTAMP timestamp default current_timestamp()
) COMMENT = "PRODUCT_STG is created in CURATED_ZONE";

























