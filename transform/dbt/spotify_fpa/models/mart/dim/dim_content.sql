WITH tracks AS (
    SELECT
        track_id AS content_id,
        track_name AS content_name,
        'music' AS content_type,
        artist_name,
        CAST(NULL AS STRING) AS publisher,
        NULL AS total_episodes
    FROM {{ ref('int_tracks') }}
),
podcasts AS (
    SELECT
        podcast_id AS content_id,
        podcast_name AS content_name,
        'podcast' AS content_type,
        CAST(NULL AS STRING) AS artist_name,
        publisher,
        total_episodes,
    FROM {{ ref('int_podcasts') }}
)
SELECT * FROM tracks
UNION DISTINCT
SELECT * FROM podcasts

