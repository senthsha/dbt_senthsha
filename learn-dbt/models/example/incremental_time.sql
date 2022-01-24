{{ config (materialized='table', unique_key='t_time')}}
select *
from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
where concat(T_HOUR::VARCHAR,':',T_MINUTE::VARCHAR,':',T_SECOND::VARCHAR) <= CURRENT_TIME

{% if is_incremental() %}
 and t_time > (select max(t_time) from {{ this }})
{% endif %}
