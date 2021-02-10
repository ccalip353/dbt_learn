with source_data as (
    select *
    from {{ source('sources_raw_jaffle_shop_table','CUSTOMERS') }}
)
select
    id as customer_id,
    first_name,
    last_name
from source_data

