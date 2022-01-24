{{ config (materialized='table')}}

select O_ORDERDATE ORDERDATE,
SUM (O_TOTALPRICE) OVER ( ORDER  BY O_ORDERDATE range between unbounded preceding and current row) cumulative_price
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
--group by O_ORDERDATE
ORDER BY O_ORDERDATE ASC
