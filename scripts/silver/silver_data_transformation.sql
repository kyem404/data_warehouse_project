-- Transformation to keep only the unique primary keys
select
*
from(

select
*,
row_number() over (partition by cst_id order by cst_create_date desc) flag_last
from bronze.crm_cust_info
)t where flag_last = 1;
