WITH country AS (
    SELECT DISTINCT country
    FROM {{ ref('ODS') }}
    WHERE country IS NOT NULL
)
SELECT
    ROW_NUMBER() OVER (ORDER BY country) AS country_id,
    country
FROM country