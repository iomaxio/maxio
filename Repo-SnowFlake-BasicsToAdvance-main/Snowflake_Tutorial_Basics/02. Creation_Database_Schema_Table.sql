-- DATABASE creation
create database DEV_COMPUTE_DB;


-- Using created DB
use DEV_COMPUTE_DB;


-- Schema Creation
create or replace schema PUBLIC_ORG;

CREATE OR REPLACE TABLE EMPLOYEE 
(
    emp_id int primary key,
    emp_fname string not null,
    emp_lname string not null,
    org_email string not null,
    dept_id int DEFAULT 0,
    location string DEFAULT 'unknown',
    salary double  
    
);


---> Use Insert into command for data insertion

INSERT INTO DEV_COMPUTE_DB.PUBLIC_ORG.EMPLOYEE
(EMP_ID, EMP_FNAME, EMP_LNAME, ORG_EMAIL, DEPT_ID, LOCATION, SALARY)
VALUES
(101,'PABITRA KUMAR','GHORAI','pabitrakumarg@zeta.com',22,'KOLKATA',46709),
(102,'SUSMITA','DAS','susmita@zeta.com',10,'unknown',27000);

truncate table DEV_COMPUTE_DB.PUBLIC_ORG.EMPLOYEE;


CREATE OR REPLACE TABLE DEPT
(
    dept_id int  primary key,
    dept_name string,
    odc_loc string
    
);

-- Add a new column
-- ALTER TABLE EMPLOYEE ADD dept_id int;

-- Drop table

-- drop table DEV_COMPUTE_DB.PUBLIC_ORG.EMPLOYEE;

select * from DEV_COMPUTE_DB.PUBLIC_ORG.DEPT;

select * from DEV_COMPUTE_DB.PUBLIC_ORG.EMPLOYEE;













