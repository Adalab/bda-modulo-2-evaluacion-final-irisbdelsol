USE sakila;
/* Ejercicio 1 */
SELECT distinct title
FROM film;

/*Ejercicio 2*/
SELECT title, rating
FROM film
WHERE rating = "PG-13";

/*Ejercicio 3*/
SELECT title, description
FROM film
WHERE description LIKE '%amazing%';

/*Ejercicio 4*/
SELECT title, length
FROM film
WHERE length > 120; 

/*Ejercicio 5*/
SELECT first_name, last_name
FROM actor;

/*Ejercicio 6*/
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%Gibson%';

SELECT * FROM actor;

/*Ejercicio 7 */
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id BETWEEN 10 AND 20; 

/*Ejercicio 8*/
SELECT title, rating
FROM film
WHERE rating NOT IN ('R', 'PG-13');

/*Ejericio 9*/
SELECT * from film;

SELECT title, rating, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY rating;

/*Ejercicio 10 */
SELECT * FROM rental; 
SELECT * FROM customer;

SELECT c.customer_id AS cliente, c.first_name AS nombre_cliente, c.last_name AS apellido_cliente,
COUNT(*) AS cantidad_peliculas_alquiladas
FROM customer AS c
INNER JOIN rental AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

/*Ejercicio 11*/
 SELECT * FROM film;
 
SELECT f.title AS peliculas,
COUNT(*) AS categoria_peliculas_alquiladas
FROM film AS f
INNER JOIN rental AS r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

/*Ejercicio 12 */
SELECT rating, AVG(length)
FROM film
GROUP BY rating;


/*Ejercicio 13*/
SELECT first_name, last_name
FROM actor
INNER JOIN film_actor AS f ON actor.actor_id = f.actor_id
WHERE f.film_id = (SELECT film_id FROM film WHERE title = 'Indian Love'); 

 /*Ejercicio 14 */
SELECT title
FROM film
WHERE description LIKE '%dog%' 
OR description LIKE '%cat%';

/*Ejercicio 15 */
SELECT title, release_year
FROM film
WHERE release_year BETWEEN 2005 AND 2010; 

/*Ejercicio 16  Encuentra el título de todas las películas que
son de la misma categoría que "Family".*/
SELECT title FROM film;
SELECT * FROM category;

SELECT title
FROM film
WHERE film_id IN (
    SELECT film_id
    FROM film_category
    WHERE category_id = (SELECT category_id FROM category WHERE name = 'Family')
);

/*Ejercicio 17 */ 

SELECT title, rating, length
FROM film
WHERE rating = 'R' AND length > 120;

 -- BONUS
 /* Ejercicio 18*/
 
SELECT a.actor_id AS actor, a.first_name AS nombre_actor, a.last_name AS apellido_actor,
COUNT(*) AS cantidad_peliculas_rodadas
FROM actor AS a
INNER JOIN film_actor AS f ON a.actor_id = f.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(*) > 10;

/*Ejercicio 19*/
SELECT a.actor_id AS actor, a.first_name AS nombre_actor, a.last_name AS apellido_actor,
COUNT(*) AS total_actores
FROM actor AS a
INNER JOIN film_actor AS f ON a.actor_id = f.actor_id
WHERE a.actor_id = NULL;

/*Ejercicio 20 */
SELECT c.name AS categoria, AVG(f.length) AS promedio_duracion
FROM category AS c
LEFT JOIN film_category AS fc ON c.category_id = fc.category_id
LEFT JOIN film AS f ON fc.film_id = f.film_id
GROUP BY c.name
HAVING AVG(f.length) > 120;

