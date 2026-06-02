SELECT 
  department, 
  seniority, 
  COUNT(candidate_id) AS total_candidates, 
  COUNTIF(final_stage = 'Hired') AS hired_candidates, 
  ROUND((COUNTIF(final_stage = 'Hired')/COUNT(candidate_id))*100, 1) AS hire_rate
FROM `recruiting.candidates`
GROUP BY
  department,
  seniority
ORDER BY hire_rate DESC;