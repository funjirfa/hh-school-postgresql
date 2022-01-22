SELECT region,
       avg_from,
       avg_to,
       trunc((avg_from + avg_to) / 2) as avg_mid
FROM
(SELECT area.name as region,
       trunc(avg(vacancy.compensation_from)) as avg_from,
       trunc(avg(vacancy.compensation_to)) as avg_to
FROM vacancy
JOIN area ON area.area_id = vacancy.area_id
GROUP BY area.name
ORDER BY area.name) as avgs;