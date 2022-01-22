SELECT vacancy.vacancy_id,
       vacancy.title
FROM vacancy
JOIN reply ON vacancy.vacancy_id = reply.vacancy_id AND
              extract(DAY FROM reply.created_at::timestamp - vacancy.created_at::timestamp) <= 7
GROUP BY vacancy.vacancy_id
HAVING count(*) > 5
ORDER BY vacancy.vacancy_id;