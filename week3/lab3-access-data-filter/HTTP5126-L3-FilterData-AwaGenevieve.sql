-- Awa Genevieve	ASSIGNMENT 3 FILTER DATA
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
-- 1 
-- A
SELECT * FROM employees WHERE role='manager' OR role='assistant';
-- B
SELECT * FROM stock_items WHERE category='piscine' AND inventory<24;

-- 2
-- A
SELECT * FROM stock_items WHERE item LIKE '%cage%';
-- B
SELECT * FROM employees WHERE first_name LIKE 'F%';

-- 3
-- A
SELECT * FROM stock_items WHERE id BETWEEN 1010 AND 1015;
-- B
SELECT * FROM stock_items WHERE (category = 'Canine') AND (price BETWEEN 10 AND 20);

-- 4
-- A
SELECT last_name, first_name, phone FROM employees WHERE role NOT IN ('manager', 'assistant');
-- B
SELECT item, price, inventory, category FROM stock_items WHERE category NOT IN ('Canine', 'Feline') AND NOT (inventory>20);


-- 5
-- A
SELECT first_name, last_name, role, phone FROM employees ORDER BY last_name;
-- B
SELECT id, item, price, inventory FROM stock_items WHERE category='Murine' AND inventory>20 ORDER BY price DESC; 