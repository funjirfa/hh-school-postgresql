(SELECT to_char(created_at, 'Month') AS month
FROM vacancy
GROUP BY month
ORDER BY count(*) DESC
LIMIT 1)
UNION
(SELECT to_char(created_at, 'Month') AS month
FROM cv
GROUP BY month
ORDER BY count(*) DESC
LIMIT 1);