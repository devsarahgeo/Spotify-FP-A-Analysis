SELECT
    id as podcast_id,
    name as podcast_name,
    publisher,
    total_episodes,
    languages,
    media_type
FROM {{ source('raw', 'podcast_details') }}
