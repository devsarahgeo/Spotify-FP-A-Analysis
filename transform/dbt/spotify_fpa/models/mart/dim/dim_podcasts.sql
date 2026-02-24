SELECT
    podcast_id,
    podcast_name,
    genre,
    publisher,
    total_episodes,
    languages,
    base_language,
    language_region,
    media_type
FROM {{ ref('int_podcasts') }} 