-- First query, we will select all the records from the actor table
SELECT * FROM ACTOR;

-- Query for first_name and last_name in the actor table 
SELECT FIRST_NAME,LAST_NAME
FROM ACTOR;

-- Query for a first_name that equals Nick using the WHERE clause
SELECT FIRST_NAME,LAST_NAME
FROM ACTOR
WHERE FIRST_NAME LIKE 'Nick';

-- Query for all first_name data that starts with a J using LIKE and WHERE clauses and a wildcard
SELECT FIRST_NAME,ACTOR_ID
FROM ACTOR
WHERE FIRST_NAME LIKE 'J%';

-- Query for all first_name data that starts with K and has 2 letters after the K again using LIKE and WHERE clauses and the underscore
SELECT FIRST_NAME,ACTOR_ID 
FROM ACTOR 
WHERE FIRST_NAME LIKE 'K__';

-- Query for all first_name data that starts with a K and ends with th 
-- We will use the LIKE and WHERE clauses using both wildcard and the underscore
SELECT FIRST_NAME,LAST_NAME,ACTOR_ID
FROM ACTOR 
WHERE FIRST_NAME LIKE 'K__%th';

-- Comparing operators
-- >, <, >=, <=, <>

-- Explore data with select all query so that we can change into a new table
SELECT * FROM PAYMENT

-- Query for data that shows customers who paid an amount GREATER than $2
SELECT CUSTOMER_ID,AMOUNT
FROM PAYMENT 
WHERE AMOUNT > 2.00;

-- Query for data that shows customers who paid an amount less than 7.99
SELECT CUSTOMER_ID,AMOUNT
FROM PAYMENT 
WHERE AMOUNT < 7.99;

-- Query for less than or equal to 7.99
SELECT CUSTOMER_ID,AMOUNT
FROM PAYMENT 
WHERE AMOUNT <= 7.99;

-- Greater than or equal to 2
SELECT CUSTOMER_ID,AMOUNT
FROM PAYMENT 
WHERE AMOUNT >= 2.00;

-- Query for data that shows customers who paid an amount not equal to $0.00 ordered in DESCENDING order
SELECT CUSTOMER_ID,AMOUNT 
FROM PAYMENT 
WHERE AMOUNT <> 0.00
ORDER BY AMOUNT DESC;

-- SQL Aggregate Functions! Sum, avg, count, min, max
--Query to display the sum of amounts paid that are greater than 5.99
SELECT SUM(AMOUNT)
FROM PAYMENT 
WHERE AMOUNT > 5.99;

-- Query to display the average of amounts paid greater than 5.99
SELECT AVG(AMOUNT)
FROM PAYMENT 
WHERE AMOUNT > 5.99;

-- Query to display the count of amounts paid greater than 5.99
SELECT COUNT(AMOUNT) FROM PAYMENT WHERE AMOUNT > 5.99;

-- Query to display the count of DISTINCT amounts paid greater than 5.99
SELECT COUNT(DISTINCT AMOUNT)
FROM PAYMENT WHERE AMOUNT > 5.99;

-- Query to display min amount greater than 7.99
SELECT MIN(AMOUNT) AS MIN_NUM_PAYMENTS
FROM PAYMENT 
WHERE AMOUNT > 7.99;

--Query to display max amount greater than 7.99
SELECT MAX(AMOUNT) AS MAX_NUM_PAYMENTS
FROM PAYMENT 
WHERE AMOUNT > 7.99;

-- Demo of groupby
SELECT AMOUNT
FROM PAYMENT 
WHERE AMOUNT = 7.99;

-- Query to display different amounts grouped together
-- and count the amounts
SELECT AMOUNT, COUNT(AMOUNT)
FROM PAYMENT 
GROUP BY AMOUNT 
ORDER BY AMOUNT;

-- Query to display customer ids with the summed amounts for each customer id
SELECT CUSTOMER_ID,SUM(AMOUNT)
FROM PAYMENT 
GROUP BY CUSTOMER_ID 
ORDER BY CUSTOMER_ID DESC;

-- 1. How many actors are there with the last name 'Wahlberg'?
SELECT LAST_NAME, COUNT(LAST_NAME)
FROM ACTOR 
WHERE LAST_NAME LIKE 'Wahlberg'
GROUP BY LAST_NAME;

--2. How many payments were made between 3.99 and 5.99?
SELECT COUNT(AMOUNT)
FROM PAYMENT
WHERE AMOUNT BETWEEN 3.99 AND 5.99;

--3. What film does the store owner have the most of? (search in inventory)
SELECT FILM_ID,COUNT(FILM_ID)
FROM INVENTORY 
GROUP BY FILM_ID
ORDER BY COUNT(FILM_ID) DESC LIMIT 1;

-- 4. How many customers have the last name 'William'?
SELECT COUNT(LAST_NAME)
FROM CUSTOMER 
WHERE LAST_NAME LIKE 'William';

-- 5. What store employee (get the id) sold the most rentals?
SELECT STAFF_ID, COUNT(RENTAL_ID)
FROM RENTAL 
GROUP BY STAFF_ID 
ORDER BY COUNT(RENTAL_ID) DESC LIMIT 1;

-- 6. How many different district names are there?
SELECT COUNT(DISTINCT DISTRICT)
FROM ADDRESS;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT FILM_ID, COUNT(ACTOR_ID)
FROM FILM_ACTOR 
GROUP BY FILM_ID
ORDER BY COUNT(FILM_ID) DESC LIMIT 1;


-- 8. From store_id 1, how many customers have a last name ending with 'es' (use customer table)
SELECT FIRST_NAME,LAST_NAME
FROM CUSTOMER 
WHERE STORE_ID = 1 AND LAST_NAME LIKE '%es';
-- 13

-- 9. How many payment amounts (4.99, 5.99, etc) had a number of rentals above 250 for customers with ids
-- between 380 and 430? (use group by and having > 250)
SELECT AMOUNT, CUSTOMER_ID, COUNT(RENTAL_ID)
FROM PAYMENT 
WHERE RENTAL_ID > 250 AND CUSTOMER_ID BETWEEN 380 AND 430
GROUP BY AMOUNT, CUSTOMER_ID 
ORDER BY AMOUNT;

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT RATING
FROM FILM 
GROUP BY RATING 
-- 5

SELECT RATING
FROM FILM 
GROUP BY RATING 
ORDER BY COUNT(RATING) DESC LIMIT 1;




