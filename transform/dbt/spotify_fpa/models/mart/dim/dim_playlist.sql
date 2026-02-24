SELECT
    p.playlist_id,
    p.playlist_name,
    p.owner_name,
    p.genre,
    pd.followers_count,
    CASE
        WHEN followers_count > 100000 THEN 'high'
        WHEN followers_count > 10000  THEN 'medium'
        ELSE 'low'
    END AS engagement_tier
FROM {{ ref('int_playlists') }} p
LEFT JOIN {{ ref('int_playlist_details') }} pd ON p.playlist_id = pd.playlist_id