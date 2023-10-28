SELECT
f.title AS 'Films'

FROM films f
LEFT JOIN categories c 
ON f.category_id = c.category_id
WHERE c.name = 'Drama';
