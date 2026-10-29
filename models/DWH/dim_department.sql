{{ config(materialized='table') }}
select
    department_id as department_key,
    department as department_name
from {{ ref('DIMdepartment') }}