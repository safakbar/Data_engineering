{{ config(materialized="table", schema="STAGE") }}

with
    minmaxcalculate as (
        select
            *,
            (high - low) as differences,
            (high - low) % 100 as diff_percentage
        from
            {{ source('stage', 'stocks') }}
    )

select *
from
    minmaxcalculate

