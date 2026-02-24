WITH random_streams AS (
  SELECT
    u.user_id,
    t.track_id,
    d.date AS stream_date,
    CAST(1 + RAND() * 5 AS INT64) AS streams,
    CAST(FLOOR(1 + RAND() * 3) AS INT64) AS impressions_per_stream
  FROM {{ ref('dim_user') }} u
  JOIN {{ ref('int_tracks') }} t
    ON RAND() < 0.001   -- small probability match
  JOIN {{ ref('dim_date') }} d
    ON RAND() < 0.01    -- some days have activity
)

SELECT DISTINCT
    rs.*,
    a.cpm,
    a.royalty_per_stream,
    {{ calculate_ad_revenue('rs.streams','rs.impressions_per_stream','a.cpm') }} AS estimated_ad_revenue,
    (rs.streams * a.royalty_per_stream) AS total_royalty_cost,
    {{ calculate_ad_revenue('rs.streams','rs.impressions_per_stream','a.cpm') }}
        - (rs.streams * a.royalty_per_stream) AS gross_profit,
    'music' AS content_type
FROM random_streams rs
LEFT JOIN {{ ref('int_assumptions') }} a
    ON 'music' = a.content_type
