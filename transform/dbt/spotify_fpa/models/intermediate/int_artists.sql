SELECT
    artist_id,
    artist_name,
    CASE 
        WHEN genres IS NULL OR ARRAY_LENGTH(genres) = 0 THEN ['unknown'] 
        ELSE genres
    END AS genres,
    popularity,
    followers
FROM {{ ref('stg_artists') }}

