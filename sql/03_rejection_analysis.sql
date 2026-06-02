WITH total_drops AS(
  SELECT COUNT(*) AS total
  FROM `recruiting.candidates`
  WHERE final_stage = 'Dropped'
)

SELECT 
  drop_reason, 
  ROUND(COUNT(*) OVER (PARTITION BY drop_reason)/ total_drops.total * 100, 1) AS pct_of_all_drops,
  role,
  ROUND(COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY role) * 100, 1) AS pct_within_role
FROM `recruiting.candidates`, total_drops
WHERE final_stage = 'Dropped'
GROUP BY role, drop_reason, total_drops.total
ORDER BY drop_reason, pct_within_role DESC;