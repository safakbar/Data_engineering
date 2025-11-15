{{ config(

    materialized = 'incremental',
    unique_key = 'date'
) }}

select
    date,
    volume,
    open,
    high,
    low,
    close,
    adj_close,
    ticker,
    year
from {{ ref('stg_stocks') }}

{% if is_incremental() %}


where year > (
    select max(year)
    from {{ this }}
)

{% endif %}


