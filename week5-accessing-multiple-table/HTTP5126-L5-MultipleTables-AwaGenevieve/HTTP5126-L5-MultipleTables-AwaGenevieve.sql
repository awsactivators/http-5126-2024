--  LAB 5 MULTIPLE TABLES
--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--  1 
-- A 
SELECT * FROM sales WHERE item = 1014;
-- B 
SELECT sales.date, stock_items.item 
FROM sales 
INNER JOIN stock_items ON sales.item = stock_items.id 
WHERE sales.item = 1014;

--  2
-- A 
SELECT * FROM sales WHERE employee = 111;
-- B
SELECT sales.date, employees.first_name, employees.last_name, sales.item 
FROM sales 
INNER JOIN employees ON sales.employee = employees.id 
WHERE sales.employee = 111;

--  3
-- A
SELECT sales.date, sales.item, employees.first_name 
FROM sales 
INNER JOIN employees ON sales.employee = employees.id 
WHERE sales.date 
BETWEEN '2024-09-12' AND '2024-09-18';
-- B
SELECT COUNT(sales.item) AS "sales_count", employees.first_name, employees.last_name 
FROM sales 
INNER JOIN employees ON sales.employee = employees.id 
WHERE employees.role = "sales" 
GROUP BY sales.employee 
ORDER BY sales.item DESC;

--  4
-- A I couldn't figure this out then I had to google it and I came about the subqueries, is there a simpler way to
-- achieve question 4A? The link of my research "https://stackoverflow.com/questions/49990666/trying-to-create-multiple-temporary-tables-in-a-single-query"
WITH top_salesperson AS (
  SELECT s.employee
  FROM sales s
  INNER JOIN employees e ON s.employee = e.id
  GROUP BY s.employee
  ORDER BY COUNT(s.item) DESC
  LIMIT 1
)

SELECT s.date, si.item, si.price, si.category, e.first_name
FROM sales s
INNER JOIN stock_items si ON s.item = si.id
INNER JOIN employees e ON s.employee = e.id
WHERE s.employee = (SELECT employee FROM top_salesperson);

-- B
SELECT si.id, si.item, si.price, si.category, COUNT(s.item) AS "times_sold"
FROM stock_items si
LEFT JOIN sales s ON si.item = s.item
GROUP BY si.id, si.item, si.price, si.category
ORDER BY si.id;


--  5
-- A Which employees have sold items with prices above 100 and how many sales have they made?

-- B
SELECT e.first_name, e.last_name, COUNT(*) AS "sales_count"
FROM sales s
INNER JOIN employees e ON s.employee = e.id
INNER JOIN stock_items si ON s.item = si.id
WHERE si.price > 100
GROUP BY e.first_name, e.last_name
ORDER BY sales_count DESC;
