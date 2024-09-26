-- Awa Genevieve	LAB 4 AGGREGATE FUNCTIONS
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
-- 1 
-- A
SELECT MIN(price) FROM stock_items;
-- B
SELECT MAX(inventory) FROM stock_items;
-- C
SELECT AVG(price) FROM stock_items;
-- D
SELECT SUM(inventory) FROM stock_items;

-- 2
-- A
SELECT role, COUNT(id) FROM employees GROUP BY role;
-- B
SELECT category AS 'Mammals', COUNT(id) AS 'Item Count' FROM stock_items WHERE NOT category='piscine' GROUP BY category ;
-- C
SELECT category, AVG(price) AS 'Average Price ($)' FROM stock_items WHERE inventory > 0 GROUP BY category;

-- 3
-- A
SELECT category AS 'Species', SUM(inventory) AS 'In Stock' FROM stock_items GROUP BY category ORDER BY SUM(inventory) ASC; 
-- B
SELECT category, SUM(inventory), AVG(price) FROM stock_items GROUP BY category HAVING SUM(inventory) < 100 AND AVG(price) < 100;

-- 4
SELECT item AS 'Product', CONCAT('$ ', price) AS 'Price', inventory AS 'Stock Remaining', category AS 'Species', (price * inventory) AS 'Potential Earnings' FROM stock_items ORDER BY (price * inventory) DESC;