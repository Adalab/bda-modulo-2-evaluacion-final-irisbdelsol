USE sakila;
/* Ejercicio 1  Selecciona todos los nombres de las películas sin que aparezcan duplicados*/
SELECT distinct title
FROM film;

/*Ejercicio 2 Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".*/
SELECT title, rating
FROM film
WHERE rating = "PG-13";

/*Ejercicio 3 Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su
 descripción.*/
SELECT title, description
FROM film
WHERE description LIKE '%amazing%';

/*Ejercicio 4 Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.*/
SELECT title, length
FROM film
WHERE length > 120;

/*Ejercicio 5 Recupera los nombres de todos los actores.*/
SELECT first_name, last_name
FROM actor;

/*Ejercicio 6 Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.*/
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%Gibson%';

SELECT * FROM actor;

/*Ejercicio 7 Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.*/
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id BETWEEN 10 AND 20; 

/*Ejercicio 8 Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su
 clasificación.*/
SELECT title, rating
FROM film
WHERE rating NOT IN ('R', 'PG-13');

/*Ejericio 9 Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación
 junto con el recuento.*/
SELECT * from film;

SELECT title, rating, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY rating;

/*Ejercicio 10  Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su
 nombre y apellido junto con la cantidad de películas alquiladas.*/
SELECT * FROM rental; 
SELECT * FROM customer;

-- Seleccionamos el ID, nombre y apellido de cada cliente para ver cuántas películas alquiló
SELECT c.customer_id AS cliente, c.first_name AS nombre_cliente, c.last_name AS apellido_cliente,
COUNT(*) AS cantidad_peliculas_alquiladas
FROM customer AS c
-- Unimos la tabla de clientes con la tabla de alquileres para relacionar cada cliente con sus correspondientes alquileres
INNER JOIN rental AS r ON c.customer_id = r.customer_id
-- Agrupamos por cliente para que el contador sea cliente por cliente
GROUP BY c.customer_id, c.first_name, c.last_name;

/*Ejercicio 11 Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría
 junto con el recuento de alquileres.*/
SELECT * FROM film;

SELECT c.name AS categoria,
COUNT(*) AS peliculas_alquiladas
FROM rental AS r
-- Unimos la tabla de alquileres con inventario para saber qué película se alquiló
INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id
-- Unimos inventario con películas para saber el detalle de cada película
INNER JOIN film AS f ON i.film_id = f.film_id
-- Unimos cada película con su categoría
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
-- Unimos todo con la tabla de categorías para sacar el nombre
INNER JOIN category AS c ON fc.category_id = c.category_id
-- Agrupamos por categoría para contar cuántas películas alquiladas tiene cada una
GROUP BY c.name;

/*Ejercicio 12 Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la
 clasificación junto con el promedio de duración.*/
SELECT rating, AVG(length)
FROM film
GROUP BY rating;

/*Ejercicio 13 Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".*/
SELECT first_name, last_name
FROM actor
-- Unimos la tabla de actores con la de películas en las que aparecen
INNER JOIN film_actor AS f ON actor.actor_id = f.actor_id
-- Filtramos con el where solo los actores que participan en la película "Indian Love" 
WHERE f.film_id = (SELECT film_id FROM film WHERE title = 'Indian Love'); 

/*Ejercicio 14 Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.*/
SELECT title
FROM film
WHERE description LIKE '%dog%' 
OR description LIKE '%cat%';

/*Ejercicio 15 Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.*/
SELECT title, release_year
FROM film
WHERE release_year BETWEEN 2005 AND 2010; 

/*Ejercicio 16 Encuentra el título de todas las películas que son de la misma categoría que "Family".*/
SELECT title FROM film;
SELECT * FROM category;

 -- Seleccionamos los títulos de las películas de la tabla películas PERO
SELECT title
FROM film
-- Solo buscamos películas que estén en la misma categoría que "Family" (usando un IN con subconsulta)
WHERE film_id IN (
SELECT film_id
FROM film_category
-- Buscamos la categoría "Family" y usamos su ID
WHERE category_id = (SELECT category_id FROM category WHERE name = 'Family')
);

/*Ejercicio 17 Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla
 film.*/ 
SELECT title, rating, length
FROM film
WHERE rating = 'R' AND length > 120;

 -- BONUS
 /* Ejercicio 18 Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.*/
 
SELECT a.actor_id AS actor, a.first_name AS nombre_actor, a.last_name AS apellido_actor,
COUNT(*) AS cantidad_peliculas_rodadas
FROM actor AS a
INNER JOIN film_actor AS f ON a.actor_id = f.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(*) > 10;

/*Ejercicio 19 Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.*/

-- Seleccionamos los actores que no aparecen en ninguna película
SELECT a.actor_id AS actor, a.first_name AS nombre_actor, a.last_name AS apellido_actor,
COUNT(*) AS total_actores
FROM actor AS a
-- Usamos LEFT JOIN para que aparezcan todos los actores, incluso los que no tienen película
LEFT JOIN film_actor AS f ON a.actor_id = f.actor_id
-- Filtramos los que no tienen ninguna película relacionada (los que se quedaron sin pareja en el LEFT JOIN)
WHERE a.actor_id = NULL;

/*Ejercicio 20 Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y
 muestra el nombre de la categoría junto con el promedio de duración.*/

 -- Seleccionamos el nombre de cada categoría y calculamos la media de duración de sus películas
SELECT c.name AS categoria, AVG(f.length) AS promedio_duracion
FROM category AS c
-- Unimos categorías con sus películas (usamos el LEFT JOIN para que aparezcan todos, incluso los que no tienen películas; con el INNER JOIN estos se quedarían fuera)
LEFT JOIN film_category AS fc ON c.category_id = fc.category_id
LEFT JOIN film AS f ON fc.film_id = f.film_id
GROUP BY c.name
HAVING AVG(f.length) > 120;

