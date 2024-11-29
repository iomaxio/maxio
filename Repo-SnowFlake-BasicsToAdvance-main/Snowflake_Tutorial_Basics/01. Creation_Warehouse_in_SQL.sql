CREATE OR REPLACE WAREHOUSE LOCAL_COMPUTE
WITH
WAREHOUSE_SIZE=XSMALL
MAX_CLUSTER_COUNT=3
AUTO_SUSPEND=300
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = "This is created WAREHOUSE using SQL"


SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER