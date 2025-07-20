-- Inserting transformed data into the silver layer
INSERT INTO silver.erp_cust_az12 (cid,bdate,gen)

SELECT
	CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4,LEN(cid)) -- Remove 'NAS' prefix if present
		 ELSE cid
	END cid,

	CASE WHEN bdate > GETDATE() THEN NULL
		 ELSE bdate
	END AS bdate, -- Set future birthdates to NULL

	CASE WHEN UPPER(TRIM(gen)) IN ('F','FEMALE') THEN 'Female'
		 WHEN UPPER(TRIM(gen)) IN ('M','MALE') THEN 'Male'
		 ELSE 'n/a'
	END AS gen -- Normalize gender values and handle unkown cases
FROM bronze.erp_cust_az12;
