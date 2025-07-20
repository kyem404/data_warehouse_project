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
