-- Data transformation for erp_loc_a101 to be inserted into the silver layer
INSERT INTO silver.erp_loc_a101
(cid,cntry)

SELECT
	REPLACE(cid, '-','') cid,
	CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
		 WHEN TRIM(cntry) IN ('US','USA') THEN 'United States'
		 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
		 ELSE TRIM(cntry)
	END AS cntry -- Normalize and Handle missing or blank country codes
FROM bronze.erp_loc_a101;
