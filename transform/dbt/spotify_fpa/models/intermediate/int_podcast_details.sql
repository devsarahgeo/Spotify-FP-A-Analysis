WITH ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY podcast_id ORDER BY total_episodes DESC) AS rn
    FROM {{ ref('stg_podcast_details') }}
)

SELECT
    podcast_id,
    podcast_name,
    publisher,
    total_episodes,
    languages,
    SPLIT(languages[OFFSET(0)], '-')[OFFSET(0)] AS base_language,
    SPLIT(languages[OFFSET(0)], '-')[SAFE_OFFSET(1)] AS language_region,
    -- podcasts have no popularity so using total_episodes as proxy
    CAST(total_episodes * 3000 + RAND() * 10000 AS INT64) AS streams,
    CAST(FLOOR(1 + RAND() * 4) AS INT64) AS impressions_per_stream,
    media_type
FROM ranked
WHERE rn = 1
