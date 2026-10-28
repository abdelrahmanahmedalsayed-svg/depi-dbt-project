{{ config(materialized='table') }}
select
    e.employee_key,
    d.department_key,
    c.country_key,
    cast(convert(varchar(8), cast(s.DOB as date), 112) as int) as birth_date_key,
    try_cast(replace(s.salary, '$', '') as decimal(10,2)) as salary
from {{ ref('ODS') }} s
join {{ ref('dim_employee') }}   e on e.employee_id = s.ID
join {{ ref('dim_department') }} d on d.department_name = s.department
join {{ ref('dim_country') }}    c on c.country_name = s.country
