# Pizza Database Project 🍕

## Overview
The **Pizza Database Project** is a SQL-based relational database designed to manage a pizza restaurant's orders, customers, staff schedules, and inventory. The project consists of several SQL scripts that create tables, insert sample data, and perform various queries to track sales, ingredient usage, and other operational data.

## Project Structure
pizza-database-project/
├── create_database_and_tables.sql    # Script to create the database and all related tables
├── insert_data.sql                   # Script to insert sample data into the database
├── queries.sql                       # SQL queries to retrieve and analyze data from the database
├── README.md                         # Project documentation (this file)
└── images/                           # Directory for storing images (e.g., ER diagrams, screenshots)

1. create_database_and_tables.sql
   
This script:

Creates the database Pizza_DataBase.
Defines all necessary tables: customers, orders, item, address, ingredient, inventory, and more.
Implements primary and foreign key constraints to maintain data integrity.

2. insert_data.sql
   
This script:

Inserts sample data into relevant tables, including:
Customers (names, delivery addresses)
Items (pizza types, prices)
Orders (order details)
Ingredients (used in pizza recipes)
Simulates real-world pizza restaurant operations.

3. queries.sql
   
This script:

Contains SQL queries to retrieve information such as:
Customer orders and details.
Top-selling pizza items.
Ingredient usage tracking.

4. images/
   
This directory stores relevant images such as ER diagrams, schema designs, or screenshots of query results.

Key Features
Customer Management: Store customer details and delivery addresses.
Orders and Items: Track pizza orders, quantities, and prices.
Staff Rota: Maintain staff schedules.
Ingredient Management: Track ingredient quantities used in pizzas.
Inventory: Monitor stock levels.

How to Use

1. Setup
   
Clone the repository:

git clone https://github.com/your-username/pizza-database-project.git

cd pizza-database-project

Run the scripts in your SQL environment:

First, run create_database_and_tables.sql to set up the schema.
Then, run insert_data.sql to populate the tables with sample data.

2. Running Queries
   
Run queries from queries.sql to extract insights.
Sample Queries
Show All Orders and Customer Details

SELECT orders.order_id, orders.created_at, customers.cust_firstname, customers.cust_lastname, 
       item.item_name, orders.quantity, orders.delivery
FROM orders
JOIN customers ON orders.cust_id = customers.cust_id
JOIN item ON orders.item_id = item.item_id;
Find Top-Selling Items

SELECT item.item_name, SUM(orders.quantity) AS total_quantity_sold
FROM orders
JOIN item ON orders.item_id = item.item_id
GROUP BY item.item_name
ORDER BY total_quantity_sold DESC;

Track Ingredient Usage

SELECT ingredient.ing_name, SUM(recipe.quantity * orders.quantity) AS total_quantity_used
FROM orders
JOIN item ON orders.item_id = item.item_id
JOIN recipe ON recipe.item_id = item.item_id
JOIN ingredient ON recipe.ing_id = ingredient.ing_id
GROUP BY ingredient.ing_name;

Future Improvements

Implement more advanced queries for staff performance.
Add tables for promotions and discounts.
Expand schema for online payments and delivery tracking.
