USE sakila;

-- Activity 1
-- 1. Drop column picture from staff

ALTER TABLE sakila.staff
DROP COLUMN picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. 
-- Update the database accordingly

SELECT * FROM staff;

SELECT * from sakila.customer
WHERE customer.first_name='TAMMY' AND customer.last_name='SANDERS';

INSERT INTO sakila.staff (
staff_id,
first_name,
last_name,
address_id,
email,
store_id,
active,
username,
password,
last_update)
VALUES (3, 'TAMMY', 'SANDERS', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'TAMMY','', CURRENT_TIMESTAMP);

select * FROM staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.

-- Find Max rental_id to assign to new rental. Use Max(rental_id)+1
SELECT *, MAX(rental_id) FROM rental;  

-- Find customer_id
SELECT customer_id 
FROM sakila.customer
WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';

-- Find title_id
SELECT film_id FROM sakila.film
WHERE title='Academy Dinosaur';

-- Find staff_id
SELECT staff_id
FROM sakila.staff
WHERE store_id=1;

-- Find inventory_id available
SELECT DISTINCT i.inventory_id 
FROM sakila.inventory i
JOIN sakila.rental r
USING (inventory_id)
WHERE i.film_id=1 AND i.store_id=1 AND r.return_date IS NOT NULL;

INSERT INTO sakila.rental (
rental_id,
rental_date,
inventory_id,
customer_id,
return_date,
staff_id,
last_update)
-- VALUES (16050, '2022-01-25 10:20:31', 1, 130, null, 1 , CURRENT_TIMESTAMP);
VALUES (16050, CURRENT_TIMESTAMP(), 1, 130, null, 1 , CURRENT_TIMESTAMP());

-- Activity 2
-- Use dbdiagram.io or draw.io to propose a new structure for the Sakila database.
-- Define primary keys and foreign keys for the new database.

-- I am agree with Eric's proposal, removing 'film_category' table and adding column 'category_id' 
-- to 'film' table (this would be a FK). I can't think of other improvements so far.