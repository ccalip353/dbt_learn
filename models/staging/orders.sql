/*
    This the stage orders stripe table
*/

{{ config(materialized='table') }}

with source_data as (
    select *
    from {{ ref('stg_orders') }}
)
select 
    source_data.ORDER_ID,
    source_data.CUSTOMER_ID,
    SUM(p.PAYMENT_AMOUNT_USD) AS ORDER_AMOUNT
from source_data 
left join {{ ref('customers') }} AS c ON source_data.CUSTOMER_ID = c.CUSTOMER_ID
left join {{ ref('stg_payments') }} AS p ON source_data.ORDER_ID = p.ORDER_ID
GROUP BY source_data.ORDER_ID,source_data.CUSTOMER_ID
