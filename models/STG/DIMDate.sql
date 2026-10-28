with date_ as (
    SELECT DISTINCT
    CAST(DOB AS DATE) AS [date]
    FROM {{ref('ODS')}}
    WHERE DOB IS NOT NULL
)
SELECT
    CONVERT(INT, CONVERT(CHAR(8), [date], 112)) AS date_key,
    [date],
    YEAR([date]) AS [year],
    MONTH([date]) AS [month],
    DAY([date]) AS [day],
    DATENAME(MONTH, [date]) AS month_name,
    DATENAME(WEEKDAY, [date]) AS day_name
FROM date_;