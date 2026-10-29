{{ config(materialized='table') }}
select
    e.employee_key,
    d.department_key,
    c.country_key,
    cast(convert(varchar(8), cast(o.[date] as date), 112) as int) as birth_date_key,
    o.salary
from {{ ref('OBT') }} o
join {{ ref('dim_employee') }}   e on e.employee_id = o.employee_id
join {{ ref('dim_department') }} d on d.department_name = o.department
join {{ ref('dim_country') }}    c on c.country_name = o.country