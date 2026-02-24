WITH ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY track_id ORDER BY track_name DESC) AS rn
    FROM {{ ref('stg_tracks') }}
)

select
    track_id,
    track_name,
    artist_id,
    artist_name,
    album_total_tracks,
    duration_ms,
    CASE
        WHEN duration_ms < 120000 THEN 'Short'
        WHEN duration_ms < 300000 THEN 'Medium'
        ELSE 'Long'
    END AS track_length_category,

    ROUND(duration_ms / 60000, 2) AS duration_minutes,
    popularity,
    CASE 
        WHEN popularity >= 80 THEN 'High'
        WHEN popularity >= 50 THEN 'Medium'
        ELSE 'Low'
    END AS popularity_band,
    release_date,
    CASE
        WHEN LENGTH(release_date) = 4
        THEN PARSE_DATE('%Y', release_date)

        WHEN LENGTH(release_date) = 7
        THEN PARSE_DATE('%Y-%m', release_date)

        WHEN LENGTH(release_date) = 10
        THEN PARSE_DATE('%Y-%m-%d', release_date)

        ELSE NULL
    END AS release_date_normalized

FROM ranked
WHERE rn = 1

