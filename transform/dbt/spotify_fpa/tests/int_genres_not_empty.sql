SELECT *
FROM {{ ref('int_artists') }}
WHERE EXISTS (
  SELECT 1
  FROM UNNEST(genres) g
  WHERE g IS NULL
)
