{{ config(materialized='table') }}
select
    row_number() over (order by department) as department_key,
    department as department_name
from (select distinct department from {{ ref('ODS') }}) d
