WITH employee AS (
    SELECT DISTINCT
        ID,
        first_name,
        last_name,
        email,
        gender,
        CAST(DOB AS date) AS birth_date
    FROM {{ref('ODS') }}
    WHERE ID IS NOT NULL
)
SELECT
    ROW_NUMBER() OVER (ORDER BY ID) AS employee_id,
    ID AS source_employee_id,
    first_name,
    last_name,
    email,
    gender,
    birth_date
FROM employee