WITH department AS (
    SELECT DISTINCT department
    FROM {{ ref('ODS') }}
    WHERE department IS NOT NULL
)
SELECT
    ROW_NUMBER() OVER (ORDER BY department) AS department_id,
    department
FROM department