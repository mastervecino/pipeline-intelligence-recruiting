SELECT
  role,
  COUNT(*) AS total_hires,
  MIN(time_to_hire) AS min_time_to_hire,
  MAX(time_to_hire) AS max_time_to_hire,
  ROUND(AVG(time_to_hire), 1) AS avg_time_to_hire
FROM `recruiting.candidates`
WHERE time_to_hire IS NOT NULL
GROUP BY role
ORDER BY avg_time_to_hire;