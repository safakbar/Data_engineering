
{{ config(
    materialized='table',
    schema='STAGE'
) }}

with  minmaxcalculate as 
(
select *,           (high - low) AS differences,
           (high - low) % 100 AS diff_percentage from {{ source('stage', 'stocks') }}
)

select * from minmaxcalculate
