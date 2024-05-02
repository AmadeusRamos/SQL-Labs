-- PRIMER EJERCICIO
-- REALIZANDO CONSULTAS CON SELECT

 SELECT * FROM sakila.actor
 SELECT title, release_year FROM sakila.film
 SELECT title AS 'Titulo de pelicula', release_year AS 'Año de lanzamiento' FROM sakila.film 
 SELECT DISTINCT(district) FROM sakila.address
 SELECT film_id, title FROM sakila.film;

-- ejercicio 02 asignar un alias
SELECT title as 'Titulo de pelicula', description as 'Descripcion de la pelicula' FROM sakila.film;

-- ejercicio 03 valores distintos
SELECT DISTINCT (postal_code) FROM sakila.address;

-- ejercicio 04 muestra la inicial o los tres primeros caracteres de una columna definida
SELECT LEFT(country,3) AS Inicial, country FROM sakila.country;

-- ejercicio 05 cambiar a mayúsculas el contenido de un campo
SELECT UPPER(country) AS Pais_mayuscula, country FROM sakila.country;

-- ejercicio 06 conteo de caracteres por de campo
SELECT LENGTH(country) AS Conteo_caracteres, country FROM sakila.country;

-- ejercicio 07 concatenación de campos
SELECT CONCAT(country_id, ' ',country) FROM sakila.country;

-- ejercicio 08 Multiplicando por 19.58 el amount de la base sakila
SELECT (amount*19.58) AS 'Conversion dolar', amount FROM sakila.payment;

-- ejercicio 09 redondea al valor superior la columna amount de sakila.payment
SELECT round(amount, 0), amount FROM sakila.payment;

-- ejercicio 10 mostrar valor de PI
SELECT pi();

SELECT title, rental_rate FROM sakila.film
WHERE rental_rate >= 4.99;

SELECT * FROM sakila.actor
WHERE first_name = 'ED';

SELECT * FROM sakila.country
WHERE country IN ('Chile', 'France');

SELECT * FROM sakila.rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-06-01';

SELECT * FROM sakila.actor
WHERE first_name LIKE '%E';

SELECT * FROM sakila.actor
WHERE first_name LIKE 'J%'
AND last_name LIKE 'c%';

SELECT * FROM sakila.actor
WHERE first_name LIKE 'Z%'
OR last_name LIKE 'P%';

SELECT * FROM sakila.country
WHERE NOT country = 'Brazil';

-- Ejercicio en elcual se ordena de la Z a la A la información de customer

SELECT * FROM sakila.customer
ORDER BY first_name DESC;

-- Ejercicio en el que las letras ON se encuentran contenidas en el primer nombre
SELECT * FROM sakila.actor
WHERE first_name LIKE '%ON';

-- Ejercicio en el que en el primer nombre del actor contiene 1 letra O y en su apellido tiene las letras AN
SELECT * FROM sakila.actor
WHERE first_name LIKE '%O%' AND last_name LIKE '%AN%';

-- Ejercicio donde el primer nombre del actor contiene 2 letras O y en su apellido hay 1 letra A
SELECT * FROM sakila.actor
WHERE first_name LIKE '%O%%O%' AND last_name LIKE '%A%';

-- Ejercicio de actores donde la tercera letra de su nombre es B
SELECT * FROM sakila.actor
WHERE first_name like '%___B%';

-- Ejercicio de ciudades que empiezan con A
SELECT * FROM sakila.city
WHERE city like 'A%';

-- Ejercicio donde se busca las ciudades que terminen con la letra S
SELECT * FROM sakila.city
WHERE city like '%S';

-- Ejercicio para obtener los resultados de las películas que contegan una duración entre 80 y 100 minutos de duración
SELECT * FROM sakila.film
WHERE length BETWEEN 80 AND 100;

-- Ejercicio buscar las películas con un rental rate entre 1 y 3
SELECT * FROM sakila.film
WHERE rental_rate BETWEEN 1 AND 3;

-- Ejercicio obtener las películas con un rating de PG o G
SELECT * FROM sakila.film
WHERE rating IN ('PG', 'G');

-- Reglas para generar una subconsulta

-- Poner la subconsulta entre paréntesis
-- En una subcosulta, especificar solo una columna o expresión, a no ser que esté utilizando IN, ANY, ALL o EXISTS
-- Una subconsulta no puede contener una cláusula BETWEEN ni LIKE
-- Una subconsulta no puede contener una cláusula ORDER BY

-- Ejercicio Cuántas ciudades tienen Spain

SELECT * FROM sakila.city
WHERE country_id = (SELECT country_id FROM sakila.country WHERE country = 'Spain');

-- Ejercicio SUM
SELECT SUM(amount) FROM sakila.payment
WHERE payment_date BETWEEN '2005-05-10' AND '2005-05-25'; 

-- Ejercicio COUNT cuántos registros hay en la tabla CUSTOMER donde FIRST_NAME empiece con A
SELECT COUNT(*) FROM sakila.customer
WHERE first_name LIKE 'A%';

-- CONSULTA UTILIZANDO FUNCIONES DE AGREGACION
-- La función AVG () devuelve el valor promedio de una columna numérica.
-- Ejercicio: Calcula el promedio de renta entre los días 10 y 25 del 2005

SELECT AVG(amount) FROM sakila.payment
WHERE payment_date BETWEEN '2005-05-10' AND '2005-05-25';

-- Utilizando funciones de agregación
-- Función MIN () devuleve el valor más pequeño de la columna seleccionada
-- Función MAX () devuleve el valor más grande de la columna seleccionada

-- Ejercicio muestra el valor más pequeño de una película y el valor más grande de una película
SELECT MAX(length) FROM sakila.film;

-- GROUP BY se usa a menudo con funciones agregadas COUNT (), MAX (), MIN (), SUM (), AVG () para agregar el conjunto de resultados por una o más columnas.
-- Ejercicio. haz un conteo del número de películas agrupadas por raiting 

SELECT rating, COUNT(film_id)
FROM sakila.film
GROUP BY rating;

-- HAVING se agregó a SQL porque la palabra clave WHEre no se puede usar con funciones de agregación.
-- Ejercicio: Muestra o los clientes que tengan  más de 25 rentas

SELECT first_name, COUNT(rental_id)
FROM sakila.customer c
INNER JOIN sakila.rental r ON c.customer_id = r.customer_id
GROUP BY first_name
HAVING COUNT(rental_id) > 25;

-- Usar este segmento para probar cómo queda
INNER JOIN rental r ON c.customer_id = r.customer_id
GROUP BY frist_name
HAVING COUNT(rental_id) > 25;

-- Ejercicio Media de duración de película con la categoría PG
SELECT AVG(length) FROM sakila.film
WHERE rating = 'PG';

-- Ejercicio: cuántas películas ha realizado el actor ED CHASE
SELECT a.first_name, a.last_name, COUNT(*)
FROM sakila.actor a
INNER JOIN sakila.film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN sakila.film f ON f.film_id = fa.film_id
WHERE a.first_name = 'ED'
AND a.last_name = 'CHASE'
GROUP BY a.first_name, a.last_name;

-- Ejercicio número de películas de cada rating
SELECT rating, COUNT(*)
FROM sakila.film
GROUP BY rating;

-- Ejercicio película con menor duración
SELECT MIN(length) FROM sakila.film

-- Ejercicio muestra la suma de pagos de 2006
SELECT SUM(amount) as 'Total de pagos despues del 2006'
FROM sakila.payment
WHERE payment_date >= '2006-01-01';

-- CONSULTA UTILIZANDO JOINS
-- INNER JOIN selecciona registros que tienen valores coincidentes en ambas tablas

SELECT r.rental_id, c.first_name 
FROM sakila.rental r
INNER JOIN sakila.customer c ON r.customer_id = c.customer_id;

-- LEFT JOIN devuelve todos los registros  de la tabla de la izquierda 	y los registros coincidentes de la tabla de la derecha
-- El resultado es de 0 registros del lado derecho si no hay ninguna coincidencia
-- Muestra si existen peliculas con idioma italiano

SELECT * FROM sakila.language l
LEFT JOIN sakila.film f ON l.language_id = f.language_id
WHERE l.language_id = 2;

-- RIGHT JOIN devuelve todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda
-- El resultado es 0 registros del lado izquierdo si no hay ninguna coincidencia
-- Muestra si existen peliculas con idioma italiano

SELECT * FROM sakila.film f
RIGHT JOIN sakila.language l ON f.language_id = l.language_id
WHERE l.language_id = 2;