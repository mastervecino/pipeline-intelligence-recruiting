SELECT
  recruiter,
  COUNT(*) AS total_candidates,
  ROUND(COUNTIF(final_stage = 'Hired')/COUNT(*)*100, 1) AS hire_rate,
  ROUND(AVG(time_to_hire), 2) AS avg_time_to_hire
FROM `recruiting.candidates`
GROUP BY recruiter
ORDER BY hire_rate DESC, avg_time_to_hire DESC;