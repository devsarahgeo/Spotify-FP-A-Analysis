SELECT *
FROM {{ ref('fct_track_streams') }}
WHERE gross_profit < -1000
