WITH ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY playlist_id ORDER BY playlist_name DESC) AS rn
    FROM {{ ref('stg_playlist_details') }}
)

SELECT
    playlist_id,
    playlist_name,
    owner_name,
    followers_count
FROM ranked
WHERE rn = 1
  AND NOT (playlist_id IS NULL
           AND playlist_name IS NULL
           AND owner_name IS NULL
           AND followers_count IS NULL)
