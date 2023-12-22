use mavenmovies;

-- TOPIC REGEXP

-- 1.Get all the details of the customers whose last name starts with a vowel and ends with a consonant.
SELECT * FROM CUSTOMER 
WHERE LAST_NAME REGEXP '^[AEIOU].*[^AEIOU]$';

-- 2.Get all the details of the movies which has gold in its title.
SELECT * FROM FILM WHERE TITLE REGEXP 'GOLD';

-- 3.Get the customer first and last name and postal code, whose postal code starts with 9 and ends with 5.
SELECT FIRST_NAME,LAST_NAME,POSTAL_CODE FROM CUSTOMER C 
INNER JOIN ADDRESS A ON A.ADDRESS_ID=C.ADDRESS_ID
WHERE POSTAL_CODE REGEXP '^9.*5$';

-- 4.Get the films which are based on the subject ‘student’.
SELECT TITLE FROM FILM_TEXT WHERE DESCRIPTION REGEXP 'STUDENT';

-- 5.Find all the customer details whose last name does not contain w, j and b characters
SELECT * FROM CUSTOMER WHERE LAST_NAME NOT REGEXP '[WJB]';

-- 6.Find the customers whose address starts with 1 and ends with parkway.
SELECT FIRST_NAME,LAST_NAME,ADDRESS FROM ADDRESS A INNER JOIN CUSTOMER C 
ON C.ADDRESS_ID=A.ADDRESS_ID 
WHERE ADDRESS REGEXP '^1.*PARKWAY$';

-- 7.Replace the term school to campus in “Odin school”
SELECT REPLACE("Odin school","school","campus") Replace_reg;

-- 8.Write a query to group the rental data by customer_id.
SELECT customer_id from rental group by customer_id;

-- 9.Query to order the customers based on the number of rentals in descending order.
SELECT CUSTOMER_ID,COUNT(*) FROM RENTAL
GROUP BY CUSTOMER_ID
ORDER BY COUNT(*) DESC;

-- 10.Write a query to count the number of payments made by each customer. 
-- Show the customer id, the number of rentals and the total amount paid for each customer.
SELECT CUSTOMER_ID,COUNT(*),SUM(AMOUNT) FROM PAYMENT GROUP BY CUSTOMER_ID;

-- 11.Modify the above query to include only those customers who have made at least 2 payments.
SELECT CUSTOMER_ID,COUNT(*),SUM(AMOUNT) FROM PAYMENT
GROUP BY CUSTOMER_ID
HAVING COUNT(*) >=2;

-- 12.Write a query to find the number of films acted by each actor_id using film_actor table.
SELECT ACTOR_ID,COUNT(*) FROM FILM_ACTOR GROUP BY ACTOR_ID;

-- 13.Write a query to find the total number of films acted by each actor grouped by the film rating.
SELECT ACTOR_ID,RATING,COUNT(*) FROM FILM_ACTOR A 
INNER JOIN FILM B 
ON B.FILM_ID = A.FILM_ID
GROUP BY ACTOR_ID,RATING
ORDER BY ACTOR_ID;

-- 14.Using roll up, modify the above query to find the total count for each distinct actor i.e. 
-- find the total number of films each actor has acted along with the count of different ratings.
SELECT ACTOR_ID,RATING,COUNT(*) FROM FILM_ACTOR A 
INNER JOIN FILM B ON A.FILM_ID=B.FILM_ID
GROUP BY ACTOR_ID,RATING WITH ROLLUP
ORDER BY ACTOR_ID,RATING;

-- 15.Write a query to group the rentals by year and count them.
SELECT YEAR(rental_date) AS YEAR, COUNT(*) AS HOW_MANY FROM RENTAL 
GROUP BY YEAR(rental_date);





