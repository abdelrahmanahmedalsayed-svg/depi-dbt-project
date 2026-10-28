{{ config(
    materialized='incremental',
    unique_key='employee_id'
) }}

SELECT DISTINCT
    ID AS employee_id,
    first_name,
    last_name,
    {{ capitalize_name('first_name', 'last_name') }} AS full_name,
    email,
    gender,
    DOB AS [date],
    CAST(REPLACE(salary, '$', '') AS DECIMAL(10,2)) AS salary,
    department,
    country
FROM {{ ref('ODS') }}
WHERE ID IS NOT NULL
{% if is_incremental() %}
    AND ID NOT IN (SELECT employee_id FROM {{ this }} WHERE employee_id IS NOT NULL)
{% endif %}