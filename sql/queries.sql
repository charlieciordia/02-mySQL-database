/* QUERY 1. PELÍCULAS GÉNERO "DRAMA" */

SELECT
f.title AS 'Films'

FROM films f
LEFT JOIN categories c 
ON f.category_id = c.category_id
WHERE c.name = 'Drama';

/* QUERY 2. ACTORES CON MÁS APARICIONES EN PELÍCULAS DE TERROR (HORROR FILMS) */

SELECT 
a.full_name AS 'Actor',
COUNT(f.title) AS 'Films'

FROM actors a

INNER JOIN af_mn af
ON a.actor_id = af.actor_id
INNER JOIN films f
ON af.film_id = f.film_id
INNER JOIN categories c
ON f.category_id = c.category_id
WHERE c.name = 'Horror'
GROUP BY a.full_name
ORDER BY COUNT(f.title) desc;

/* QUERY 3. TODOS LOS ACTORES POR PELÍCULA */

SELECT 
f.title AS 'Film',
GROUP_CONCAT(a.full_name) AS 'Actors',
COUNT(a.full_name) AS 'Number of actors'
    
FROM categories c
INNER JOIN films f ON c.category_id = f.category_id
INNER JOIN af_mn af ON af.film_id = f.film_id
INNER JOIN actors a ON a.actor_id = af.actor_id
GROUP BY c.name, f.title;

/* QUERY 4. RANKING DE ACTORES CON MÁS APARICIONES POR GÉNERO */

SELECT 
c.name AS 'Categories',
a.full_name AS 'Actors',
COUNT(f.title) AS 'Number or films',
RANK() OVER (PARTITION BY c.name ORDER BY COUNT(f.title) DESC) AS 'Ranking'
/* ROW_NUMBER() OVER (PARTITION BY c.name ORDER BY COUNT(f.title) DESC) AS 'Ranking' */

FROM categories c
INNER JOIN films f ON c.category_id = f.category_id
INNER JOIN af_mn af ON af.film_id = f.film_id
INNER JOIN actors a ON a.actor_id = af.actor_id
GROUP BY c.name, a.full_name;


/* QUERY 5. RANKING DE ACTORES CON MÁS APARICIONES POR GÉNERO */

CREATE TEMPORARY TABLE My_ranking (

SELECT
c.name AS 'Categories',
a.full_name AS 'Actors',
COUNT(f.title) AS 'Number or films',
/*  RANK() OVER (PARTITION BY c.name ORDER BY COUNT(f.title) DESC) AS 'Ranking' */
ROW_NUMBER() OVER (PARTITION BY c.name ORDER BY COUNT(f.title) DESC) AS 'Ranking'

/* rank number me da el ranking, y row number la posición por filas */

FROM categories c
INNER JOIN films f ON c.category_id = f.category_id
INNER JOIN af_mn af ON af.film_id = f.film_id
INNER JOIN actors a ON a.actor_id = af.actor_id
GROUP BY c.name, a.full_name);

SELECT *
FROM My_ranking
WHERE Ranking = 1;

/* QUERY 6. CANTIDAD DE PELÍCULAS SEGÚN GÉNERO Y TIENDA EN EL INVENTARIO */

SELECT
c.name AS 'Categories',
f.title as 'Film',
COUNT(i.film_id) AS 'Number of films',
i.store_id AS 'Store'

FROM categories c
LEFT JOIN films f
ON c.category_id = f.category_id
LEFT JOIN inventory i
ON f.film_id = i.film_id
GROUP BY c.name, f.title, i.store_id;

/* QUERY 7. Nº DE ALQUILERES SEGÚN VENDEDOR Y PELÍCULAS */

SELECT
r.staff_id AS 'Staff',
f.title AS 'Title',
COUNT(f.title) AS 'Number of films'

FROM rental r
LEFT JOIN inventory i
ON r.inventory_id = i.inventory_id
LEFT JOIN films f
ON f.film_id = i.film_id
GROUP BY r.staff_id, f.title;