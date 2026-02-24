WITH ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY playlist_id ORDER BY playlist_name DESC) AS rn
    FROM {{ ref('stg_playlists') }}
)


SELECT
    playlist_id,
    playlist_name,
    owner_name,
    genre
    FROM ranked
    WHERE rn = 1
