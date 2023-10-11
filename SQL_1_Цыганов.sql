--#3
SELECT u.first_name as first_name,
       u.last_name as last_name,
       u.id as user_id
  FROM orders o
  JOIN users u
    ON o.user_id = u.id
 WHERE o._order_date SIMILAR to '\d+/(9|10|11)/2022';

--#4
SELECT *,
       CASE
       	    WHEN price = (SELECT MAX(price) from orders) THEN 10
       	    ELSE 0
       END as discount,
       CASE
       	    WHEN price = (SELECT MAX(price) from orders) THEN ROUND(price * 0.9, 2)
       	    ELSE price
       END as new_price
  FROM orders

--#5
DELETE
  FROM orders
 WHERE items > 4
    OR status = 'cancel_order'

--#6
SELECT domain, COUNT(domain) as cnt
  FROM (SELECT SUBSTRING(email, '(?<=@).+(?=\.)') AS domain
          FROM users
         WHERE gender = 'Male')
 GROUP BY DOMAIN
 order by cnt DESC
 LIMIT 3
