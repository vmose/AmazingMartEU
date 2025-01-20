WITH validation AS (
    SELECT *
    FROM {{ ref('OrderBreakdown') }}
    WHERE sales < 0
)
SELECT COUNT(*) = 0 AS is_valid
FROM validation;
