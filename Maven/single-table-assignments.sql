/*
Created by: Trudy Gill
Created date: 10/06/2023
Description: This file contains SQL code I wrote for the Single Table Analysis Assignments from the Maven Analytics Learn SQL Udemy Course.
The database explored is the Maven Movies Database.
*/

-- 1. SELECT & FROM | Create a list that includes the first name, last name, and email of customers 
SELECT first_name, last_name, email
FROM customer; 

-- 2. SELECT DISTINCT | Pull the records of films and verify if there are any other rental durations in addition to 3, 5 and 7
SELECT DISTINCT rental_duration
FROM film; 

-- 3. FILTERING WITH WHERE | Show all payments from the first 100 customers (based on customer ID)
SELECT customer_id, rental_id, amount, payment_date
FROM payment
WHERE customer_id BETWEEN 1 AND 100; 

-- 4. WHERE & AND | Show payments for the first 100 customers that are over $5 and that are from since January 1, 2006
SELECT customer_id, rental_id, amount, payment_date
FROM payment
WHERE customer_id BETWEEN 1 AND 100
	AND amount >= 5
	AND payment_date > '2006-01-01'; 
    
-- 5a. WHERE & OR | Show all payments for the customerids (42, 53, 60, and 75) along with payments over $5 for any customer
SELECT customer_id, rental_id, amount, payment_date
FROM payment
WHERE amount >= 5
	OR customer_id = 42
    OR customer_id = 53
    OR customer_id = 60
    OR customer_id = 73;
    
-- 5b. WHERE & IN | Show all payments for customerids (41, 53, 60 and 75) along with payments over $5 for any customer
SELECT customer_id, rental_id, amount, payment_date
FROM payment
WHERE amount >=5
	OR customer_id IN (42, 53, 60, 73);

-- 6. THE LIKE OPERATOR | Pull a list of films which include a Behind the Scenes special feature 
SELECT title, special_features
FROM film
WHERE special_features LIKE '%Behind the Scenes%'; 

-- 7. GROUP BY | Pull a count of titles sliced by rental duration
SELECT rental_duration,
	COUNT(film_id) AS films_with_this_rental_duration
FROM film
GROUP BY rental_duration; 

-- 8. AGGREGRATE FUNCTIONS | Pull a count of films, along with the average, min and max rental rate, grouped by replacement cost
SELECT 
	replacement_cost, 
    COUNT(film_id) AS number_of_films,
    MIN(rental_rate) AS cheapest_rental,
    MAX(rental_rate) AS most_expensive_rental,
    AVG(rental_rate) AS average_rental
FROM film
GROUP BY replacement_cost;

-- 9. HAVING  | Pull a list of customer_ids with less than 15 rentals all-time
SELECT customer_id, 
    COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY customer_id
HAVING COUNT(rental_id) < 15;

-- 10. ORDER BY | Pull a list of all film titles along with their lengths and rental rates, sorted by longest to shortest 
SELECT
	title,
    length,
    rental_rate
FROM film
ORDER BY length DESC; 
    
-- 11. CASE STATEMENTS | Pull a list of first and last names of all customers, and label them as either 'store 1 active', 'store 1 inactive', 'store 2 active', or 'store 2 inactive'
SELECT 
	first_name, last_name, 
    CASE 
		WHEN store_id = 1 AND active = 1 THEN 'store 1 active'
        WHEN store_id = 1 AND active = 0 THEN 'store 1 inactive'
        WHEN store_id = 2 AND active = 1 THEN 'store 2 active'
        WHEN store_id = 2 AND active = 0 THEN 'store 2 inactive'
	END AS store_and_status    
FROM customer; 

-- 12. CASE & COUNT | Create a table to count the number of customers broken down by store_id (in rows), and active status (in columns)
SELECT
	store_id,
    COUNT(CASE WHEN active = 1 THEN customer_id ELSE NULL END) AS 'active',
    COUNT(CASE WHEN active = 0 THEN customer_id ELSE NULL END) AS 'inactive'
FROM customer
GROUP BY store_id;
