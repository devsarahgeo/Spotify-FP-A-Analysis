SELECT 
    id as playlist_id,
    name as playlist_name,
    followers.total as followers_count,
    owner.display_name as owner_name
FROM {{ source('raw', 'playlist_details') }}
