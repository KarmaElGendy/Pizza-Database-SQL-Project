# Pizza_DataBase Project 🍕

## Overview
The **Pizza_DataBase Project** is a SQL-based relational database designed to manage a pizza restaurant's orders, customers, staff schedules, and inventory. The project consists of several SQL scripts that create tables, insert sample data, and perform various queries to track sales, ingredient usage, and other operational data.

## Project Structure
```bash
pizza-database-project/
├── create_database_and_tables.sql    # Script to create the database and all related tables
├── insert_data.sql                   # Script to insert sample data into the database
├── queries.sql                       # SQL queries to retrieve and analyze data from the database
├── README.md                         # Project documentation (this file)
└── images/                           # Directory for storing images 
```

1. create_database_and_tables.sql
- Creates the database Pizza_DataBase.
- Defines all the necessary tables for the pizza ordering system, such as customers, orders, item, address, ingredient, inventory, and more.
- Implements primary and foreign key constraints to maintain data integrity.
  
2. insert_data.sql
- Inserts sample data into all relevant tables, including:
Customers (e.g., names, delivery addresses)
Items (e.g., pizza types, prices)
Orders (e.g., order details for different customers)
Ingredients (used in pizza recipes)

- The data is structured to simulate real-world pizza restaurant operations.

3. queries.sql
- Contains SQL queries to perform various analyses and retrieve important information, such as:
Viewing all customer orders and their details.
Finding the top-selling pizza items.
Tracking ingredient usage based on orders.

## Key Features
- Customer Management: Store customer details, including delivery addresses.
- Orders and Items: Track orders made by customers, including the quantity of pizzas, prices, and delivery options.
- Staff Rota: Maintain staff schedules with shifts and staff details.
- Ingredient Management: Track ingredient quantities used based on pizza orders.
- Inventory: Monitor stock levels of items.

## Requirements
- A working SQL environment such as MySQL Workbench or PostgreSQL.
- Ensure you have appropriate permissions to create databases and execute SQL queries.

## How to Use

1. Setup 
Clone the repository:
```
git clone https://github.com/your-username/pizza-database-project.git
cd pizza-database-project
```
Run the scripts in your SQL environment:
- First, execute the create_database_and_tables.sql script to set up the database schema.
- Then, execute the insert_data.sql to populate the tables with sample data.

2. Running Queries   
Once the database is set up, you can run the queries from the queries.sql file to extract useful insights.

### Queries

#### Show All Orders and Customer Details
```
SELECT orders.order_id, orders.created_at, customers.cust_firstname, customers.cust_lastname, 
       item.item_name, orders.quantity, orders.delivery
FROM orders
JOIN customers ON orders.cust_id = customers.cust_id
JOIN item ON orders.item_id = item.item_id;
  ```

#### Find Top-Selling Items
```
SELECT item.item_name, SUM(orders.quantity) AS total_quantity_sold
FROM orders
JOIN item ON orders.item_id = item.item_id
GROUP BY item.item_name
ORDER BY total_quantity_sold DESC;
 ```

#### Track Ingredient Usage
  
```
SELECT ingredient.ing_name, SUM(recipe.quantity * orders.quantity) AS total_quantity_used
FROM orders
JOIN item ON orders.item_id = item.item_id
JOIN recipe ON recipe.recipe_id = item.sku
JOIN ingredient ON recipe.ing_id = ingredient.ing_id
GROUP BY ingredient.ing_name;
```

## Future Improvements
- Implement more advanced queries to analyze staff performance or customer ordering trends.
- Add new tables for promotions and discounts.
- Expand the schema to include online payment methods and delivery tracking.
