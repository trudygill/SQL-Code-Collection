/*
Created by: Trudy Gill
Created date: 10/06/2023
Description: This file contains SQL code I wrote for the Multi-Table Analysis Assignments from the Maven Analytics Learn SQL Udemy Course. 
The database explored is the Maven Movies Database.
*/

-- 1. INNER JOIN | Pull a list of each film in the inventory. Show the film's title, description, store_id value, and inventory_id.
SELECT 
	inventory.inventory_id,
	inventory.store_id, 
	film.title, 
	film.description
FROM inventory 
INNER JOIN film
	ON inventory.film_id = film.film_id;
    
-- 2. LEFT JOIN | Pull a list of all film titles and show how many actors are associated with each title
SELECT film.title, 
	COUNT(film_actor.actor_id) AS number_of_actors
FROM film
LEFT JOIN film_actor
		ON film.film_id = film_actor.film_id
GROUP BY film.title; 

-- 3. BRIDGING TABLES | Pull a list of all actors and each film title that they appear in 
SELECT
	actor.first_name,
	actor.last_name,
	film.title
FROM actor
INNER JOIN film_actor
	ON film_actor.actor_id = actor.actor_id
INNER JOIN film
	ON film.film_id = film_actor.film_id;

-- 4. MULTI-CONDITION JOINS | Pull a list of distinct titles and their descriptions, currently available in inventory at store 2
SELECT DISTINCT
	film.title,
	film.description
FROM film
INNER JOIN inventory
	ON film.film_id = inventory.film_id
	AND inventory.store_id = 2;

-- 5. UNION | Create one list of all staff and advisor names and include a column noting whether they are a staff member or an advisor
SELECT
	'advisor' AS type,
		first_name,
		last_name
FROM advisor
UNION
SELECT
	'staff' AS type,
	first_name,
	last_name
FROM staff;
