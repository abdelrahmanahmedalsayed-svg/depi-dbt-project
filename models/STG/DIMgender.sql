WITH gender AS (
    SELECT DISTINCT gender
    FROM {{ ref('ODS') }}
    WHERE gender IS NOT NULL
)
SELECT
    ROW_NUMBER() OVER (ORDER BY gender) AS gender_id,
    gender
FROM gender