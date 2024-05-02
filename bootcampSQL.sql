--####### Curso The complete SQL Bootcamp: Go from Zero to Hero

-- iniciando con SELECT, nos ayuda a saber cuántas columnas hay en la tabla elegida y cuál es su contenido.

SELECT * FROM actor;

SELECT first_name, last_name FROM actor;

SELECT * FROM city;

-- Primer desafío (CHALLENGE) necesitamos enviar un correo a todos nuestros clientes.

SELECT * FROM customer;

SELECT first_name, last_name, email FROM customer;

-- SELECT DISTINCT, esta instrucción opera en una columna, y se ocupa cuando deseamos saber cuántas características
-- y valores únicos hay dentro de la columna a analizar.

SELECT * FROM film;

SELECT DISTINCT(release_year) FROM film;

SELECT DISTINCT(rental_rate) FROM film;

-- Segundo desafío, un visitante de Australia desea saber la equivalencia de movie ratings para ver una película.
-- Deseamos saber los tipos de ratings de nuestra BBDD y cuáles tenemos disponibles.

SELECT * FROM film;

SELECT DISTINCT(rating) FROM film;

-- Función COUNT. Esta función devuelve el número de filas que corresponden a una condición específica de búsqueda.
-- Esta función siempre debe ir acompañada de paréntesis, sino no devuelve el valor de la búsqueda.
-- Podemos usarla con (*) pero no es recomendable, se recomienda siempre usar el nombre de la tabla.

SELECT * FROM payment;

-- SELECT COUNT (*) FROM payment; esta petición nos da un valor deseado, pero no es recomendable usarla.

SELECT COUNT(amount) FROM payment;

-- Seleccionar la columna amount.

SELECT amount FROM payment;

-- Deseamos ver cuantos totales diferentes y únicos tiene la columna amount.

SELECT DISTINCT amount FROM payment;

-- Deseamos ver el conteo de la columna amount

SELECT COUNT(DISTINCT(amount)) FROM payment;

-- Función SELECT WHERE	es la más utilizada dentro del lenguaje SQL.

SELECT * FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R';

-- En el siguiente ejemplo, se va a utilizar el asterisco dentro de la consulta porque no importa qué columna
-- se elija, nos va adevolver el resultado de la condición establecida en la línea de WHERE.

SELECT COUNT (*) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R';

SELECT COUNT (*) FROM film
WHERE rating = 'R' OR rating = 'PG-13';

SELECT * FROM film
WHERE rating != 'R';

-- Desafío SELECT WHERE
-- 1 ¡Un cliente olvidó su cartera en nuestra tienda!, necesitamos buscar su email para notificarle.
-- ¿Cuál es el email del cliente con el nombre Nancy Thomas?

SELECT email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

-- 2 Un cliente quiere saber de qué se trata la película "Outlaw Hanky"
-- ¿Puedes darle la descripción de la película "Outlaw Hanky"?

SELECT description FROM film
WHERE title = 'Outlaw Hanky';

-- 3 Un cliente ha tardado en regresar su película, necesitamos enviarle una carta a su domicilio
-- en '259 Ipoh Drive'. Deberíamos llamarle por teléfono para hcerle saber.
-- ¿Puedes obtener el número teléfonico del cliente que vive en '259 Ipoh Drive'?

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

-- Lección ORDER BY 
-- Esta declaración, va acompañada de ASC y DESC el cual nos permite ordenar de manera ascendente
-- o descendente. Si no se utliza ninguna de las opciones antes mencionadas, simpre va a ordenar
-- de manera ascendente por default.

SELECT * FROM customer
ORDER BY first_name;

SELECT * FROM customer
ORDER BY first_name DESC;

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id DESC,first_name ASC;

-- LIMIT. Este comando nos permite limitar el número de filas del resultado de una consulta.
-- Nos permite explorar lo que se encuentra al principio de una tabla.
-- LIMIT se vuelve útil si se combina con la declaración ORDER BY.

SELECT * FROM payment
ORDER BY payment_date DESC
LIMIT 5;


SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

-- Desafío LIMIT 1. Queremos recompensar a nuestros primeros 10 clientes que pagaron.
-- ¿Cuáles son los ids de los primeros clientes que crearon un pago?

SELECT customer_id FROM payment
WHERE amount >= 1
ORDER BY payment_date ASC
LIMIT 10;

SELECT customer_id FROM payment
WHERE amount != 0.00
ORDER BY payment_date ASC
LIMIT 10;

-- Desafío 2. Un cliente quiere rentar un video para ver durante su corto receso.
-- ¿Cuáles son los 5 títulos más cortos que tenemos?

SELECT title,length FROM film
ORDER BY length ASC
LIMIT 5;

-- Desafío 3. Si el cliente anterior puede ver cualquier pelúcula con una duración menor a 50 minutos,
-- ¿Cuántas opciones tiene?

SELECT COUNT(*) FROM film
WHERE length <= 50;

-- Operador BETWEEN. Este operador se puede usar para unir valores en un rango de valores.
-- Se puede usar en conjunto con NOT (NOT BETWEEN), para obtener resultados fuera del rango deseado.
-- Se usa con fechas que cumplan con el ISO 8601 'YYYY-MM-DD'

SELECT * FROM payment
LIMIT 2;

SELECT COUNT(*) FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

-- Operador IN, se utiliza para checar opciones múltiples dentro de una lista.
-- Podemos utilizar IN para crear una condición que nos auyude a evaluar si cierto dato está dentro de una opción múltiple.

-- Explorar la tabla

SELECT * FROM payment
LIMIT 2;

SELECT DISTINCT (amount) FROM payment;

SELECT DISTINCT (amount) FROM payment
ORDER BY (amount);

SELECT * FROM payment
WHERE amount IN (0.99,1.98,1.99);

SELECT COUNT(*) FROM payment
WHERE amount IN (0.99,1.98,1.99);

SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99,1.98,1.99);

SELECT * FROM customer
WHERE first_name IN ('John','Jake','Julie');

-- Operador LIKE y ILIKE
-- El operador LIKE nos permite buscar de mejor forma al hacer un match contra alguna cadena
-- de texto, haciendo uso de un comodín que es el símbolo porciento %.
-- El operador LIKE es sensible a mayúsculas.
-- El operador ILIKE no es sensible a mayúsculas.

SELECT * FROM customer
WHERE first_name LIKE 'J%';

SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

SELECT * FROM customer
WHERE first_name LIKE '%er%';

SELECT * FROM customer
WHERE first_name LIKE '%her%';

SELECT * FROM customer
WHERE first_name LIKE '%_her%';

SELECT * FROM customer
WHERE first_name NOT LIKE '%_her%';

SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;

--############ DESAFÍO GENERAL ##########

-- 1.- ¿Cuántas transacciones son mayores que $5.00?

SELECT COUNT(amount) FROM payment
WHERE amount > 5;

-- 2.- ¿Cuántos actores su nombre comineza con la letra P?

SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

-- 3.- ¿De cuántos distritos únicos son nuestros clientes?

SELECT COUNT(DISTINCT(district)) FROM address;

-- 4.- ¿Cuáles son los nombres de los distritos únicos obtenidos en la pregunta anterior?

SELECT DISTINCT(district) FROM address;

-- 5.- ¿Cuántas películas tienen una calificación R y un costo por reemplazo entre $5 y $15?

SELECT COUNT(*) FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;

-- 6.- ¿Cuántas películas tienen la palabra Truman en algún lugar el título?

SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';

-- ########## SECCIÓN 2 ###########
-- GROUP BY
-- Dentro de esta sección, se van a abordar algunas de las Funciones Agregadas más comunes, las cuales son:
-- AVG() - regresa una valor promedio
-- COUNT() - regresa el total de valores
-- MAX() - regresa el valor máximo
-- MIN() - regresa el valor mínimo
-- SUM() - regresa la suma de todos los valores

-- Hay que tener en cuenta que estas Funciones Agregadas solamente funcionan con SELECT o HAVING

-- AVG() regresa un valor flotante con varios decimales después del punto
-- Se puede usar ROUND() para especificar la precisión requerida después del punto
-- COUNT() por convención, sepuede usar * para conocer el total de las filas en una tabla


SELECT * FROM film;

SELECT MIN(replacement_cost) FROM film;

SELECT MAX(replacement_cost) FROM film;

SELECT MAX(replacement_cost),MIN(replacement_cost)
FROM film;

SELECT COUNT(*) FROM film;

SELECT AVG(replacement_cost)
FROM film;

SELECT ROUND(AVG(replacement_cost),2)
FROM film;

SELECT SUM(replacement_cost)
FROM film;

 -- GROUP BY. Se debe elegir una columna no categórica.
 -- La columna no categórica es discontinua.
 -- La cláusula GROUP BY va inmediatamente despues de las declaraciones WHERE y FROM.
 
SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id;

SELECT customer_id,SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id,COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC;

SELECT staff_id,customer_id,SUM(amount) FROM payment
GROUP BY staff_id,customer_id
ORDER BY customer_id;

SELECT staff_id,customer_id,SUM(amount) FROM payment
GROUP BY staff_id,customer_id
ORDER BY SUM(amount);

SELECT DATE(payment_date),SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;

-- Desafío GROUP BY
-- 1.- Hay dos miembros del staff, con identificaciones 1 y 2. Se le va a dar un bono a aquel miembro del staff
-- que haya procesado una mayor cantidad de transacciones (no se va a tomar en cuenta la mator cantidad de dinero 
-- procesado). ¿Cuántas transacciones realizaron estos dos miembros del staff y quién va a ser acreedor del bono?

SELECT staff_id,COUNT(amount) FROM payment
GROUP BY staff_id
ORDER BY COUNT(amount) DESC;

-- 2.- El corporativo está llevando a cabo un estudio sobre la relación entre el costo de reemplazo y la categoría
-- MPAA de las películas (ejemplo, G, PG, R, entre otros).
-- ¿Cuál es costo promedio por clasificación MPAA?

SELECT rating,
ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating;

-- 3.- Se va a ofrecer una promoción para recompensar nuestros cinco principales clientes con cupones.
-- ¿Cuáles son las claves de ID de los 5 clientes con mayor gasto total?

SELECT customer_id,SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;


-- HAVING esta cláusula va después del GROUP BY 

SELECT customer_id,SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT store_id,COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

-- Desafío HAVING
-- 1.- Se va a iniciar un servicio platinum para nuestros clientes más leales. Se les va a asignar
-- el nivel platinum a aquellos clientes que tengan 40 o más transacciones de pago.
-- ¿Cuáles ID de clientes pueden ser elegidos para la categoría platinum?

SELECT customer_id,COUNT(amount) FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40
ORDER BY COUNT(amount) DESC;

-- 2.- ¿Cuáles ID de clientes han gastado más de $100 en transacciones de pago con el miembro del staff 2?

SELECT customer_id,staff_id,SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id,staff_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount) DESC;


--################################### PRUEBA DE HABILIDADES 1

-- 1.- Busca el ID del cliente que ha gastado al menos $110 con el miembro del staff 2

SELECT customer_id,staff_id,SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id,staff_id
HAVING SUM(amount) > 110;

-- 2.- ¿Cuántas películas su título empieza con la letra J?

SELECT COUNT(title) FROM film
WHERE title LIKE 'J%';

-- 3.- ¿Qué cliente tiene el valor más alto en ID cuyo nombre empiece con E y tenga una ID de dirección menor a 500?

-- Mi solución
SELECT MAX(customer_id),MIN(address_id),first_name,last_name FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
GROUP BY first_name,last_name,address_id
ORDER BY MAX(customer_id) DESC
LIMIT 1

;

-- La solución del profe
SELECT first_name,last_name FROM customer
WHERE first_name LIKE 'E%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1

;


-- ################### SECCIÓN 2 JOINS ####################

-- Cláusula AS. Sirve para cambiar el nombre de una columna, al que nosotros le asignemos.

SELECT customer_id FROM payment
;

SELECT amount AS rental_price
FROM payment
;

SELECT SUM(amount) AS net_revenue
FROM payment
;

-- El operador AS se ejecuta al final de la búsqueda (query), lo que significa que no podemos usar el ALIAS dentro del operador WHERE.

SELECT COUNT(amount) AS num_transactions
FROM payment;

-- Esta es la forma correcta de elaborar esta query

SELECT customer_id,SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

-- Esta consulta me genera un error, porque la columna total_spent no existe es un nombre virtual
SELECT customer_id,SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING total_spent > 100;

-- Correcto. Se le genera un alias a la columna amount pero en la cláusula WHERE se llama a la columna amount, no la columna virtual
SELECT customer_id,amount AS new_name
FROM payment
WHERE amount > 2;

-- Incorrecto
SELECT customer_id,amount AS new_name
FROM payment
WHERE new_name > 2;

-- ############### INNER JOIN

-- Cualquier JOIN nos permite combinar múltiples tablas.
-- Las uniones (JOIN) deben ser entre campos iguales
-- Para el caso de INNER JOIN nos permite combinar los datos que se repiten en las tablas objetivo.

SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT payment_id,payment.customer_id,first_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

-- OUTER JOINS
-- FULL OUTER JOIN

SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null;

SELECT COUNT(DISTINCT customer_id) FROM payment;

-- LEFT OUTER JOIN

SELECT * FROM film;

SELECT * FROM inventory;

SELECT film.film_id,title,inventory_id,store_id
FROM film
LEFT JOIN inventory ON
inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL;

-- RIGHT JOINS
-- Tiene la misma función que el LEFT JOIN y el LEFT OUTER JOIN, solamente que esta función es opuesta.
-- Una vez que se domina en primer lugar LEFT JOIN se puede entender la RIGHT JOIN.

-- UNION
-- Esta función puede unir tablas que estén separadas, por ejemplo, tengo una tabla del 1 al 5 y otra del 6 al 10,
-- ambas tienen los mismos campos. Si deseo unir ambas tablas en una sola que contenga la información del 1 al 10,
-- aplico la función UNION como se ve en el ejemplo que se muestra a continuación:
-- SELECT * FROM Sales2021_Q1
-- UNION
-- SELECT * FROM Sales2021_Q2

-- JOIN, retos a resolver
-- 1.- Las leyes de tazas del Estado de California han cambiado, por lo que necesitamos avisarles a los clientes de
-- esta noticia vía e-mail.
-- ¿Cuáles son los e-mails de los clientes que viven en California?

-- Metodología
SELECT * FROM customer;

SELECT * FROM address
WHERE district = 'California';

-- Solución
SELECT email,address.district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'California';

-- 2.- Un cliente se acerca y es un gran fan del actor "Nick Wahlberg" y desea conocer en cuáles películas ha participado.
-- Obtén una lista de todas las películas donde "Nick Wahlberg" ha estado.

SELECT * FROM actor
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';

SELECT * FROM film_actor
WHERE actor_id = 2;

SELECT * FROM film;

SELECT title
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
WHERE actor_id = 2;

SELECT film.title,actor.first_name,actor.last_name
FROM film_actor
JOIN film
ON film.film_id = film_actor.film_id
JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';

-- #####################################Comandos avanzados de SQL
-- Timestamps and extract

SHOW ALL;

SHOW TIMEZONE;

SELECT NOW();

SELECT TIMEOFDAY();

SELECT CURRENT_TIME;

SELECT CURRENT_DATE;

SELECT * FROM payment;

-- Me permite conocer el año de la tabla elegida
SELECT EXTRACT(YEAR FROM payment_date) AS MyYear
FROM payment;

-- Hice un conteo de la tabla por año
SELECT COUNT(EXTRACT(YEAR FROM payment_date)) AS MyYear
FROM payment;

-- Se extrae el mes
SELECT EXTRACT(MONTH FROM payment_date) AS pay_month
FROM payment;

-- Se obtiene el dato del pago, en qué cuarto se realizó ese movimiento
SELECT EXTRACT(QUARTER FROM payment_date)
AS pay_month
FROM payment;

-- Esta función me indica cuál es la edad de los datos que visualizamos
SELECT AGE(payment_date)
FROM payment;

-- Esta función me permite introducir caracteres dentro de la tabla, todo esto de forma virtual.
SELECT TO_CHAR(payment_date,'MONTH   YYYY')
FROM payment;

SELECT TO_CHAR(payment_date,'mon/dd/YYYY')
FROM payment;

SELECT TO_CHAR(payment_date,'MM/dd/YYYY')
FROM payment;

SELECT TO_CHAR(payment_date,'MM-dd-YYYY')
FROM payment;

SELECT TO_CHAR(payment_date,'dd/MM/YYYY')
FROM payment;

-- Desafío con TIMESTAMPS y EXTRACT
-- 1.- ¿Durante qué meses los pagos ocurrieron?
-- Dar formato a la fecha para que solamente visualicemos el nombre del mes.

SELECT * FROM payment;

SELECT DISTINCT(TO_CHAR(payment_date,'Month')) AS payment_month
FROM payment;

-- 2.- ¿Cuántos pagos ocurrieron un lunes?
SELECT * FROM payment;

SELECT COUNT(payment_date) FROM payment
WHERE EXTRACT(dow FROM payment_date)=1;

--######################### FUNCIONES MATEMÁTICAS Y OPERADORES (Mathematical Functions)

SELECT ROUND(rental_rate/replacement_cost,4)*100 AS percent_cost
FROM film;

SELECT 0.1 * replacement_cost AS deposit
FROM film;

--################ FUNCIONES DE CADENA Y OPERADORES (String Functions and Operators)

-- Conocer el largo de una columna
SELECT LENGTH(first_name) FROM customer;

-- Concatenar
SELECT first_name || last_name AS full_name
FROM customer;

SELECT first_name || ' ' || last_name AS full_name
FROM customer;

SELECT upper(first_name) || ' ' || upper(last_name) AS full_name
FROM customer;

SELECT first_name || last_name || '@gmail.com'
FROM customer;

SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@gmail.com'
AS custom_email
FROM customer;

-- ################ SUBCONSULTAS(SUBQUERY)
-- Las subconsultas se ejecutan primero porque las escribimos dentro de paréntesis, recordando el orden de las operaciones todas 
-- aquellas que están dentro d eparéntesis se ejecutan en primer orden.

-- En el siguiente ejemplo la subconsulta es la que está entre paréntesis
SELECT title,rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

-- En el siguiente ejemplo ocupamos el operador IN para obtener los resultados que se cumplen dentro de la subconsulta
SELECT film_id,title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY film_id;

-- Usaremos el operador EXISTS en el siguiente ejemplo
-- En esta consulta, vamos a obtener a aquellos clientes que tienen al menos un pago mayor a 11 dólares
SELECT first_name,last_name
FROM customer AS c
WHERE EXISTS
(SELECT * FROM payment AS p
 WHERE p.customer_id = c.customer_id
 AND amount > 11);

-- Si deseamos conocer el resultado inverso, usamos el operador NOT
SELECT first_name,last_name
FROM customer AS c
WHERE NOT EXISTS
(SELECT * FROM payment AS p
 WHERE p.customer_id = c.customer_id
 AND amount > 11);
 
-- SELF JOIN
-- Es una cosulta en la que una tabla se une a sí misma
-- Son muy útiles para comparar valores en una columna y celdas en la misma tabla
 
SELECT f1.title,f2.title, f1.length
FROM film AS f1
INNER JOIN film AS f2 ON
f1.film_id != f2.film_id
AND f1.length = f2.length;

-- ===================================================================================================================
-- ################################## PRUEBA NÚMERO 2 ########################################
-- Esta prueba se va a realizar con la nueva Base de Datos llamada "exercises", con el esquema "cd"

SELECT * FROM cd.facilities;
SELECT * FROM cd.bookings;
SELECT * FROM cd.members;

-- 1.- ¿Cómo puedes recuperar toda la información de la tabla cd.facilities?

SELECT * FROM cd.facilities;

-- 2.- Deseas imprimir una lista de todas las instalaciones y el costo de de los miembros. ¿Cómo puedes obtener una lista
-- que contenga solamente el nombre de la instalación y su costo?

SELECT name,membercost FROM cd.facilities;

-- 3.- ¿Cómo puedes obtener una lista de las instalaciones que le hacen un cargo a sus miembros?

SELECT * FROM cd.facilities
WHERE membercost != 0;

-- 4.- ¿Cómo puedes obtener una lista de las instalaciones que le hacen un cargo a sus miembros, y ese cargo sea
-- de al menos 1/50 del costo de mantenimiento? En la tabla obtener el facid, facility name, member cost,
-- y monthly maintenance de las instalaciones en cuestion.

SELECT facid,name,membercost,monthlymaintenance
FROM cd.facilities
WHERE membercost > 0 AND
membercost < (monthlymaintenance/50.0)

-- 5.- ¿Cómo puedes obtener una lista de las instalaciones que contengan la palabra 'Tennis' en su nombre?

SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%';

-- 6.- ¿Cómo puedes obtener los detalles de las instalaciones del ID 1 y 5? Trata de no usar el operador OR

SELECT * FROM cd.facilities
WHERE facid IN (1,5);

-- 7.- ¿Cómo obtener una lista de los miembros que se unieron después de haber comenzado septiembre de 2012?
-- Regresa memid, surname, firstname, y joindate de los miembros en cuestión.

SELECT memid,surname,firstname,joindate FROM cd.members
WHERE joindate >= '2012-09-01';

-- 8.-¿Cómo obtener una lista de los diez primeros apellidos de la tabla miembros?, la lista no debe tener duplicados

SELECT DISTINCT surname FROM cd.members
ORDER BY surname
LIMIT 10;

-- 9.- Deseas conocer la fecha de inscripción del último miembro, ¿Cómo puedes obtener esta información?

SELECT joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

-- Solución del profe
SELECT MAX(joindate)
FROM cd.members

-- 10.- Realiza y obtén un conteo de las instalaciones que generan un costo a los miembros de 10 o más dólares

SELECT COUNT(*) FROM cd.facilities
WHERE guestcost >= 10;

-- 11.- Obtén una lista del total de espacios reservados por instalación en el mes de septiembre de 2012.
-- Genera una tabla que tenga el id de la instalación y los espacios, acomodados por el número de espacio.

SELECT facid,SUM(slots) AS Total_slots
FROM cd.bookings
WHERE starttime >= '2012-09-01 00:00:00' AND starttime <='2012-09-30 23:59:59'
GROUP BY facid ORDER BY SUM(slots);

-- 12.- Obtén una lista de instalaciones que tengan más de 1000 espacios reservados.
-- Que la tabla de salida contenga el facid y el total de espacios, ordenados por el facid

SELECT facid,SUM(slots) AS "Total"
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;

-- 13.- ¿Cómo puedes obtener una lista de las start times para las canchas de tennis de la fecha '2012-09-21'?
-- Regresa una lista con los nombres de la instalación y la fecha ordenada de menor a mayor.

SELECT bookings.starttime AS "start",facilities.name
FROM cd.facilities
JOIN cd.bookings
ON bookings.facid = facilities.facid
WHERE name LIKE 'Ten%' AND starttime BETWEEN '2012-09-21 00:00:00' AND '2012-09-21 23:59:59'
ORDER BY starttime;

-- 14.- ¿Cómo puedes obtener una lista de las veces que han reservado los miembros llamados David Farrell?

SELECT bookings.starttime
FROM cd.members
JOIN cd.bookings
ON bookings.memid = members.memid
WHERE firstname = 'David' AND surname = 'Farrell'
ORDER BY starttime;

--==============================================================================================================================
-- #################### 
CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	 password VARCHAR(50) NOT NULL,
	 email VARCHAR(250) UNIQUE NOT NULL,
	 created_on TIMESTAMP NOT NULL,
	 last_login TIMESTAMP
);

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	 job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
);

-- INSERT este comando sirve para ingresar información a las tablas creadas

INSERT INTO account(username,password,email,created_on)
VALUES
('Jose','password','jose@mail.com',CURRENT_TIMESTAMP);

SELECT * FROM account;

INSERT INTO job(job_name)
VALUES
('Astronaut');

INSERT INTO job(job_name)
VALUES
('President');

SELECT * FROM  job;

INSERT INTO account_job(user_id,job_id,hire_date)
VALUES
	(1,1,CURRENT_TIMESTAMP);
	
SELECT * FROM account_job;

-- ########### UPDATE
-- Este comando se utiliza para actualizar información
-- A continuación se van a actualizar las tablas anteriormente creadas

SELECT * FROM account;

UPDATE account
SET last_login = CURRENT_TIMESTAMP;

UPDATE account
SET last_login = created_on;

SELECT * FROM account_job;

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email,created_on,last_login;

-- ########### DELETE
-- Se usa para eliminar filas de una tabla desde la lógica de un JOIN

-- Con esta línea se crea una fila
INSERT INTO job(job_name)
VALUES
	('Cowboy');

-- Visualizamos la línea anteriormente creada
SELECT * FROM job;

-- Ahora se va a eliminar esa líne de Cowboy
DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id,job_name;

SELECT * FROM job;


-- ################ ALTER TABLE
-- Permite la edición de tablas
-- Crear una tabla
CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
		title VARCHAR (500) NOT NULL,
		person VARCHAR(50) NOT NULL UNIQUE
);

-- Vemos el contenido de la tabla
SELECT * FROM information;

-- Renombrar la tabla information a new_info
ALTER TABLE information
RENAME TO new_info;

-- Buscamos la tabla information y vemos el resultado que arroja
SELECT * FROM information;

-- Buscamos la tabla new_info
SELECT * FROM new_info;

-- Vamos a renombrar una columna
ALTER TABLE new_info
RENAME COLUMN person TO people;

-- Observamos los cambios en la tabla
SELECT * FROM new_info;

-- Ahora vamos a ver cómo cambiar restricciones en la tabla
-- Antes vamos a insertar datos en la tabla 

INSERT INTO new_info(title)
VALUES
('some new title');

-- Al correr la consulta anterior nos arroja un error
-- Para evitarlo, hay que cambiar la restricción que se le dio al crear la tabla por primera vez

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

INSERT INTO new_info(title)
VALUES
('some new title');

SELECT * FROM new_info;

-- ################# DROP

ALTER TABLE new_info
DROP COLUMN people;

SELECT * FROM new_info;

ALTER TABLE new_info
DROP COLUMN IF EXISTS people;

-- ################ CHECK CONSTRAINT

CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK (birthdate > '1900-01-01'),
	hire_date DATE CHECK (hire_date > birthdate),
	salary INTEGER CHECK (salary > 0)
);

INSERT INTO employees(
first_name,
	last_name,
	birthdate,
	hire_date,
	salary
)
VALUES
('Sammy',
 'Smith',
 '1990-11-03',
 '2010-01-01',
 100
);

SELECT * FROM employees;

-- ######################### Prueba 3

CREATE DATABASE school
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER,
	department VARCHAR(30),
	email VARCHAR(250) UNIQUE,
	phone VARCHAR(30) UNIQUE
);

SELECT * FROM teachers;

CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER,
	phone VARCHAR(30) UNIQUE,
	email VARCHAR(250) UNIQUE,
	graduation_year INTEGER
);

SELECT * FROM students;

DROP TABLE tecahers

INSERT INTO students(first_name,last_name,homeroom_number,phone,email,graduation_year)
VALUES
('Mark','Watney',5,'777-555-1234','','01-01-2035')


INSERT INTO teachers(first_name,last_name,homeroom_number,department,email,phone)
VALUES
('Jonas','Salk',5,'Biology','jsalk@school.org','777-555-4321')

SELECT * FROM teachers;


-- ################## CASE

SELECT customer_id,
CASE 
	WHEN (customer_id <= 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_class
FROM customer;

SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second place'
	ELSE 'Normal'
END AS raffle_results
FROM customer;

SELECT * FROM film;

SELECT rental_rate FROM film;

-- Las películas que tengan un costo de 0.99 centavos, vamos a transformarlas a 1
SELECT rental_rate,
CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END
FROM film;

-- Quiero saber cuántas películas cumplen con la condición
SELECT
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains
FROM film;

-- Si quiero ver las demás películas y agruparlas, puedo hacerlo con la función CASE
-- Sin necesidad de recurrir a GROUP BY, HAVING o a lo ya anteriormente aprendido.

SELECT
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains,
SUM(CASE rental_rate
	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular,
SUM(CASE rental_rate
	WHEN 4.99 THEN 1
	ELSE 0
END) AS premium
FROM film;

-- ######################## Desafío CASE
-- Se desea conocer el total de películas de acuerdo a su calificación dirigida al público

SELECT * FROM film;

SELECT
SUM(CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END) AS r,
SUM(CASE rating
   WHEN 'PG' THEN 1
   ELSE 0
END) AS pg,
SUM(CASE rating
   WHEN 'PG-13' THEN 1
   ELSE 0
END) AS pg13
FROM film;

-- ################### COALESCE
-- ################### CAST

SELECT CAST('5' AS INTEGER) AS new_int;

SELECT '5'::INTEGER;

SELECT * FROM rental;

SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental

-- #################### NULLIF
-- Para esta función, vamos a crear una tabla en la BBDD exercises

CREATE TABLE depts(
first_name VARCHAR(50),
department VARCHAR(50)
);

INSERT INTO depts(
first_name,
department
)
VALUES
('Vinton','A'),
('Lauren','A'),
('Claire','B');

SELECT * FROM depts;

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS department_ratio
FROM depts;

DELETE FROM depts
WHERE department = 'B';

SELECT * FROM depts;

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
	NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END),0)
) AS department_ratio
FROM depts;

-- ################# VIEW
-- Se va a ocupar la base de DVDRENTAL 

CREATE VIEW customer_info AS
SELECT first_name,last_name,address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name,last_name,address,district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

ALTER VIEW customer_info RENAME TO c_info;

DROP VIEW IF EXISTS c_info;

-- ############## IMPORT AND EXPORT

CREATE TABLE simple(
a INTEGER,
b INTEGER,
c INTEGER
);

SELECT * FROM simple;

