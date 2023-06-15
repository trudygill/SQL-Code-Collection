/*
Created by: Trudy Gill
Created date: 11/06/2023
Description: This is my attempt at the Maven Movies Final Course Project from the MavenAnalytics Learn SQL Udemy Course.
*/

USE mavenmovies;

/* 
1. My partner and I want to come by each of the stores in person and meet the managers. 
Please send over the managers’ names at each store, with the full address 
of each property (street address, district, city, and country please).  
*/ 
SELECT
	staff.first_name AS manager_first_name,
    staff.last_name AS manager_last_name,
    address.address,
    address.district,
    city.city,
    country.country
    FROM staff
    LEFT JOIN store ON store.store_id = staff.store_id
	LEFT JOIN address  ON address.address_id = store.address_id
	LEFT JOIN city ON city.city_id = address.city_id
	LEFT JOIN country ON country.country_id = city.country_id;
	
/*
2.	I would like to get a better understanding of all of the inventory that would come along with the business. 
Please pull together a list of each inventory item you have stocked, including the store_id number, 
the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost. 
*/
SELECT
	inventory.store_id,
    inventory.inventory_id,
    film.title,
    film.rating,
    film.rental_rate,
    film.replacement_cost 
FROM inventory
LEFT JOIN film	ON inventory.film_id = film.film_id;

/* 
3.	From the same list of films you just pulled, please roll that data up and provide a summary level overview 
of your inventory. We would like to know how many inventory items you have with each rating at each store. 
*/
SELECT 
	inventory.store_id,
    film.rating,
	COUNT(inventory_id) AS inventory_items
FROM inventory
LEFT JOIN film ON inventory.film_id = film.film_id
GROUP BY 
	inventory.store_id,
    film.rating;

/* 
4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
see how big of a hit it would be if a certain category of film became unpopular at a certain store.
We would like to see the number of films, as well as the average replacement cost, and total replacement cost, 
sliced by store and film category. 
*/ 
SELECT
	inventory.store_id, 
    category.name AS category,
    COUNT(inventory.inventory_id) AS number_of_films,
    AVG(replacement_cost) AS average_replacement_cost,
    SUM(replacement_cost) AS total_replacement_cost    
FROM inventory
LEFT JOIN film ON inventory.film_id = film.film_id
LEFT JOIN film_category ON film.film_id = film_category.film_id
LEFT JOIN category ON category.category_id = film_category.category_id
GROUP BY 
	inventory.store_id,
    category.name;

/*
5.	We want to make sure you folks have a good handle on who your customers are. Please provide a list 
of all customer names, which store they go to, whether or not they are currently active, 
and their full addresses – street address, city, and country. 
*/
SELECT
	first_name,
    last_name,
    store_id,
    active,
    address.address,
    city.city,
    country.country
    FROM customer
	LEFT JOIN address ON address.address_id = customer.address_id
	LEFT JOIN city ON city.city_id = address.city_id
	LEFT JOIN country ON country.country_id = city.country_id;
        
/*
6.	We would like to understand how much your customers are spending with you, and also to know 
who your most valuable customers are. Please pull together a list of customer names, their total 
lifetime rentals, and the sum of all payments you have collected from them. It would be great to 
see this ordered on total lifetime value, with the most valuable customers at the top of the list. 
*/
SELECT
	first_name,
    last_name,
    COUNT(rental.rental_id) AS total_rentals, 
    SUM(payment.amount) AS total_payment_amount
    FROM customer
	LEFT JOIN rental ON rental.customer_id = customer.customer_id
	LEFT JOIN payment ON rental.rental_id = payment.rental_id
    GROUP BY first_name, last_name
    ORDER BY total_payment_amount DESC;
    
/*
7. My partner and I would like to get to know your board of advisors and any current investors.
Could you please provide a list of advisor and investor names in one table? 
Could you please note whether they are an investor or an advisor, and for the investors, 
it would be good to include which company they work with. 
*/
SELECT 
	'investor' AS type,
    first_name,
    last_name,
    company_name
FROM investor
UNION
SELECT 
	'advisor' AS type,
    first_name,
    last_name,
    NULL
FROM advisor;
/*
8. We're interested in how well you have covered the most-awarded actors. 
Of all the actors with three types of awards, for what % of them do we carry a film?
And how about for actors with two types of awards? Same questions. 
Finally, how about actors with just one award? 
*/

