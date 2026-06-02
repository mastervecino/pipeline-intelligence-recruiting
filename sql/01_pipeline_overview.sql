SELECT 
  COUNT(candidate_id) AS total_candidates,
  COUNTIF(final_stage = 'Hired') AS hired_candidates,
  COUNTIF(final_stage = 'Dropped') AS dropped_candidates,
  COUNTIF(final_stage NOT IN ('Hired', 'Dropped')) AS active_candidates,
  ROUND((COUNTIF(final_stage = 'Hired')/COUNT(candidate_id))*100, 1) AS hire_rate
FROM `recruiting.candidates`;
