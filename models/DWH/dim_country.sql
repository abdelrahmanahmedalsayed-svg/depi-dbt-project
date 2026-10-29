{{ config(materialized='table') }}
select
    country_id as country_key,
    country as country_name
from {{ ref('DIMcountry') }}