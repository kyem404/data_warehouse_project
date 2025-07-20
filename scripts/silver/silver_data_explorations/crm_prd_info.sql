-- Data Exploration for the BRONZE table
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

-- Data quality checks for the SILVER table
-- Check for Nulls or Duplicates in the Primary Key
-- Expectation: No Result
SELECT
prd_id,
count(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for unwanted spaces in string columns
-- Expectation: No Results
select prd_nm
from silver.crm_prd_info
where prd_nm != trim(prd_nm);

-- Check for NULLs or Negative Numbers
-- Expectation: No Results
select prd_cost
from silver.crm_prd_info
where prd_cost < 0 OR prd_cost IS NULL;

-- Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info;

-- Check for Invalid Date Orders
SELECT * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;
