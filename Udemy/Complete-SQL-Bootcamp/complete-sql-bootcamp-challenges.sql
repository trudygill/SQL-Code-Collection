/*
Created by: T. Gill
Created date: 20/06/2023
Description: These are my answers to the Complete SQL Bootcamp Course Challenges 
by Jose Portilla on Udemy
*/

-- 1. SELECT CHALLENGE | We want to send out a promotional email to our existing customers
SELECT first_name, last_name, email
FROM customer; 

-- 2. SELECT DISTINCT | An Australian visitor isn't familiar with MPAA movie ratings.
-- We want to know the types of ratings we have in our database. What ratings do we have available?
SELECT DISTINCT rating
FROM film; 

-- 3. SELECT WHERE | A customer forgot their wallet at our store. We need to track down their
-- email to inform them. What is the email for the customer with the name Nancy Thomas?
SELECT email
FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas'

-- A customer wants to know what the movie 'Outlaw Hanky' is about. Could you give them the description for the movie?
SELECT description
FROM film
WHERE title = 'Outlaw Hanky';

-- A customer is late on their movie return and we've mailed a letter to their address at '259 Ipoh Drive'. Can you get
-- their phone number so we can call them on the phone?
SELECT phone
FROM address
WHERE address = '259 Ipoh Drive';

-- 4. ORDER BY & LIMIT
-- We want to reward our first 10 paying customers. What are the customer ids of the first 10 customers who created a payment?
SELECT customer_id
FROM payment
ORDER BY payment_date 
LIMIT 10

-- A customer wants to quickly rent a video to watch over t heir short lunch break. 
-- What are the titles of the 5 shortest(in length of runtime) movies?
SELECT title, length
FROM film
ORDER BY length 
LIMIT 5

-- if the previous customer can watch any movie that is 50 minutes or less in run time, how many options are available?
SELECT COUNT(*)
FROM film
WHERE length <= 50

-- 5. How many payment transactions were greater than $5.00?
SELECT COUNT(amount)
FROM payment
WHERE amount > 5

-- How many actors have a first name that starts with P?
SELECT COUNT(*)
FROM actor
WHERE first_name LIKE 'P%'

-- how many unique districts are our customers from?
SELECT COUNT(DISTINCT district)
FROM address

-- retrieve the list of names for the unique districts from the previous questions
SELECT DISTINCT district
FROM address

-- how many films have a rating of R and a replacement cost between $5 and $15?
SELECT COUNT(*)
FROM film
WHERE rating = 'R'
	AND replacement_cost BETWEEN 5 AND 15
	
-- how many films have the word Truman somewhere in the title?
SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%'

-- GROUP BY Challenge Tasks
-- We have two staff members with staff ids 1 and 2. we want to give a bonus to the staaff member
-- that handled the most payments (most in terms of number of payments processed, and not total dollar amount)
-- Haow many payments did each staff membeer handle and who gets the bonus?
SELECT staff_id, COUNT(amount)
FROM payment
GROUP BY staff_id

-- Cooperate hq is conducting a study on the relationship between replacement cost and a movie MPAA rating. example GPG R et cetera. 
-- What is the average replacement cost per MPAA rating?
SELECT rating, AVG(replacement_cost)
FROM film
GROUP BY rating 

-- We are running a promotion to reward our top five customers with coupons. What are the customer Ids of the top five customers by total spend?
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5

-- HAVING Challenges 

-- We are launching a platinum service for our most loyal customers. 
-- We will assign platinum status to customers that have had 40 or more transaction payments.
-- what customer_ids are eligible for platinum status?

SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40

-- What are the customer I ds of customers who have spent more than $100 in payment transactions with our staff ID member 2?
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100

-- Assessment Test 1
-- 1.  Return the customer ids of customers who have spent at least $110 with a staff member who has an ID of 2
SELECT customer_id, SUM(amount)
FROM payment 
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >110

--2. How many films begin with the letter J?
SELECT COUNT(*)
FROM film
WHERE title LIKE 'J%'

--3. What customer has the highest customer ID number whose name starts with an E and has an address id than 500?
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'E%' AND address_id <500
ORDER BY customer_id DESC
LIMIT 1
