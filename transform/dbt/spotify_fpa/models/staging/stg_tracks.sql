select
    id as track_id,
    name as track_name,
    artists[offset(0)].id as artist_id, -- Assuming the first artist in the array is the primary artist
    artists[offset(0)].name as artist_name,
    album.total_tracks as album_total_tracks,
    duration_ms,
    popularity,
    album.release_date
from {{ source('raw', 'tracks') }}
