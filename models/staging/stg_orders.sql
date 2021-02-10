with source_data as (
    select *
    from {{ source('sources_raw_jaffle_shop_table','ORDERS') }}
)
select
    o.id as order_id,
    o.user_id as customer_id,
    o.order_date,
    o.status
from source_data o
