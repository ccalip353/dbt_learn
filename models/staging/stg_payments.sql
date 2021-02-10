/*
    This the stage orders stripe table
*/

{{ config(materialized='table') }}

with source_data as (
    select *
    from {{ source('sources_raw_stripe_table','PAYMENT') }}
)
select 
    ID as PAYMENT_ID, 
    ORDERID AS ORDER_ID,
    PAYMENTMETHOD AS PAYMENT_METHOD,
    STATUS AS PAYMENT_STATUS,
    AMOUNT/100 AS PAYMENT_AMOUNT_USD,
    CREATED AS PAYMENT_CREATED_DATE,
    _batched_at AS PAYMENT_BATCHED_DATE
from source_data
where status = 'success'
