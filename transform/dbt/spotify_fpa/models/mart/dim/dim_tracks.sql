SELECT
    t.track_id,
    t.track_name,
    t.artist_id,
    t.artist_name,
    t.album_total_tracks,
    t.duration_ms,
    t.track_length_category,
    t.duration_minutes,
    t.popularity,
    t.popularity_band,
    t.release_date_normalized,
    a.genres
FROM {{ ref('int_tracks') }} t
LEFT JOIN {{ ref('int_artists') }} a ON t.artist_id = a.artist_id
