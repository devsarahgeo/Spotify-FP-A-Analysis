SELECT
  GENERATE_UUID() AS user_id,
  CONCAT('User_', CAST(row_number AS STRING)) AS username,
  CASE
    WHEN RAND() < 0.5 THEN 'Free'
    ELSE 'Premium'
  END AS subscription_type
FROM UNNEST(GENERATE_ARRAY(1, 10000)) AS row_number
