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
