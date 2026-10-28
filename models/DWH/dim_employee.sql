{{ config(materialized='table') }}
select
    row_number() over (order by ID) as employee_key,
    ID as employee_id,
    first_name,
    last_name,
    email,
    gender,
    cast(DOB as date) as birth_date
from {{ ref('ODS') }}
