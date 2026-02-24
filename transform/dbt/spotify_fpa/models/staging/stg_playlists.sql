SELECT
    id as playlist_id,
    name as playlist_name,
    owner.display_name as owner_name,
    query as genre
from {{ source('raw', 'playlists') }}
