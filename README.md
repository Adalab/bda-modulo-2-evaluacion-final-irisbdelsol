Evaluación Módulo 2

Ejercicio de Evaluación del Módulo 2 Base de datos Sakila

Base de datos 🚀

Para esta evaluación usamos la BBDD Sakila que simula una tienda de alquiler de películas. Contiene las siguientes tablas:

film (películas).
actor (actores).
customer (clientes).
rental (alquileres).
category (categorías).
Estas tablas contienen información sobre películas, actores, clientes, alquileres y más, y se utilizan para realizar consultas y análisis de datos en el contexto de una tienda de alquiler de películas.

Desarrollo de Ejercicio 🔧

Se compone de 17 ejercicios obligatorios y 8 extras como bonus, hechos exclusivamentede forma voluntaria.

Los enunciados de cada ejercicio son los siguientes:

 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.
 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
 5. Recupera los nombres de todos los actores.
 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra elbnombre de la categoría junto con el recuento de alquileres.
 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
 15. Encuentr a el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
 16. Encuentra el título de todas las películas que son de la misma categoría que "Family".
 17. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film.

 BONUS
 
 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.
 19. Hay algún actor o actriz que no apareca en ninguna película en la tabla film_actor.
 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.
 21. Encuentra los actores que han actuado en al menos 5 películas y muestra el nombre del actor junto con la cantidad de películas en las que han actuado.
 22. Encuentra el título de todas las películas que fueron alquiladas por más de 5 días. Utiliza una subconsulta para encontrar los rental_ids con una duración superior a 5 días y luego selecciona las películas correspondientes.
 23. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría "Horror". Utiliza una subconsulta para encontrar los actores que han actuado en películas de la categoría "Horror" y luego exclúyelos de la lista de actores.
 24. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.
 25. Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos.

 Autora ✒️
 
 Iris Barredo del Sol (https://github.com/irisbdelsol/Modulo-2-Iris-Barredo-)

 Software Utilizado 📋
 
 El trabajo se ha desarrollado mediente el uso de MySQL Workbench.
