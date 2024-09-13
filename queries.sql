-- Step 4: Queries

-- Query 1: Show All Orders and Customer Details
SELECT orders.order_id, orders.created_at, customers.cust_firstname, customers.cust_lastname, item.item_name, orders.quantity, orders.delivery
FROM orders
JOIN customers ON orders.cust_id = customers.cust_id
JOIN item ON orders.item_id = item.item_id;

-- Query 2: Find Top-Selling Items
SELECT item.item_name, SUM(orders.quantity) AS total_quantity_sold
FROM orders
JOIN item ON orders.item_id = item.item_id
GROUP BY item.item_name
ORDER BY total_quantity_sold DESC;

-- Query 3: Track Ingredient Usage
SELECT ingredient.ing_name, SUM(recipe.quantity * orders.quantity) AS total_quantity_used
FROM orders
JOIN item ON orders.item_id = item.item_id
JOIN recipe ON recipe.item_id = item.item_id
JOIN ingredient ON recipe.ing_id = ingredient.ing_id
GROUP BY ingredient.ing_name;
