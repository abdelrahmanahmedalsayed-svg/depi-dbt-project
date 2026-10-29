{{ config(materialized='table') }}
select
    employee_id as employee_key,
    source_employee_id as employee_id,
    first_name,
    last_name,
    email,
    gender,
    birth_date
from {{ ref('DIMemployee') }}