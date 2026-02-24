WITH tracks AS (
    SELECT
        t.track_id AS content_id,
        t.user_id,
        t.stream_date,
        t.streams,
        t.impressions_per_stream,
        t.estimated_ad_revenue,
        t.total_royalty_cost,
        t.gross_profit,
        a.cpm,
        a.royalty_per_stream,
        'music' as content_type
    FROM {{ ref('fct_track_streams') }} t
    LEFT JOIN {{ ref('int_assumptions') }} a
      ON 'music' = a.content_type
),

podcasts AS (
    SELECT
        p.podcast_id AS content_id,
        p.user_id,
        p.stream_date,
        p.streams,
        p.impressions_per_stream,
        p.estimated_ad_revenue,
        p.total_royalty_cost,
        p.gross_profit,
        a.cpm,
        a.royalty_per_stream,
        'podcast' as content_type
    FROM {{ ref('fct_podcast_streams') }} p
    LEFT JOIN {{ ref('int_assumptions') }} a
      ON 'podcast' = a.content_type
)
SELECT * FROM tracks
UNION DISTINCT
SELECT * FROM podcasts

