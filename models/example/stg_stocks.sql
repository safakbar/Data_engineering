{{ config(materialized="table", schema="STAGE") }}
select
    date::date as date,
    volume,
    open,
    high,
    low,
    close,
    adjclose as adj_close,
    symbol as ticker,
    extract(year from date) as year
from {{ source('stage', 'stocks') }}

