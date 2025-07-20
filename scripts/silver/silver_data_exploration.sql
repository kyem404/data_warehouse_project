----------------------------------------------------------------------------
-- Data exploration on the BRONZE tables in order to create the transformations upon inserting into the silver table.
----------------------------------------------------------------------------

-- bronze.crm_cust_info

-- Check for Nulls or Duplicates in the Primary Key
-- Expectation: No Result
SELECT
cst_id,
count(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;


-- Check for unwanted spaces in First Names
-- Expectation: No Results
select cst_firstname
from bronze.crm_cust_info
where cst_firstname != trim(cst_firstname);


-- Check for unwanted spaces in Last Names
-- Expectation: No Results
select cst_lastname
from bronze.crm_cust_info
where cst_lastname != trim(cst_lastname);

-- Check for unwanted spaces in Gender
-- Expectation: No Results
select cst_gndr
from bronze.crm_cust_info
where cst_gndr != trim(cst_gndr);

-- Check for Data Standardization & Consistency in cst_gndr
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info;

-- Check for Data Standardization & Consistency in cst_marital_status
SELECT DISTINCT cst_marital_status
FROM bronze.crm_cust_info;



----------------------------------------------------------------------------
-- Quality Checks for the SILVER tables after being inserted transformed data
----------------------------------------------------------------------------

-- silver.crm_cust_info

-- Check for Nulls or Duplicates in the Primary Key
-- Expectation: No Result
SELECT
cst_id,
count(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;


-- Check for unwanted spaces in First Names
-- Expectation: No Results
select cst_firstname
from silver.crm_cust_info
where cst_firstname != trim(cst_firstname);


-- Check for unwanted spaces in Last Names
-- Expectation: No Results
select cst_lastname
from silver.crm_cust_info
where cst_lastname != trim(cst_lastname);

-- Check for unwanted spaces in Gender
-- Expectation: No Results
select cst_gndr
from silver.crm_cust_info
where cst_gndr != trim(cst_gndr);

-- Check for Data Standardization & Consistency in cst_gndr
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info;

-- Check for Data Standardization & Consistency in cst_marital_status
SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info;

----------------------------------------------------------------------------

-- bronze.crm_prd_info

-- Check for Nulls or Duplicates in the Primary Key
-- Expectation: No Result
-- Check for Nulls or Duplicates in the Primary Key
-- Expectation: No Result
SELECT
prd_id,
count(*)
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for unwanted spaces in string columns
-- Expectation: No Results
select prd_nm
from bronze.crm_prd_info
where prd_nm != trim(prd_nm);

-- Check for NULLs or Negative Numbers
-- Expectation: No Results
select prd_cost
from bronze.crm_prd_info
where prd_cost < 0 OR prd_cost IS NULL;

-- Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM bronze.crm_prd_info;

-- Check for Invalid Date Orders
SELECT * 
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt;









---
