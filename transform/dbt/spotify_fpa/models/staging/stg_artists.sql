select
    id as artist_id,
    name as artist_name,
    genres,
    popularity,
    followers.total as followers
from {{ source('raw', 'artists') }}
