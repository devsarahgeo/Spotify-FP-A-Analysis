select
    id as podcast_id,
    name as podcast_name,
    publisher,
    total_episodes,
    languages,
    media_type,
    query as genre
from {{ source('raw', 'podcasts') }}
