{{ config(materialized='table') }}
select
    row_number() over (order by country) as country_key,
    country as country_name
from (select distinct country from {{ ref('ODS') }}) c
