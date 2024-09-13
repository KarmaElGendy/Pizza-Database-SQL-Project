-- Step 1: Create Database

CREATE DATABASE Pizza_DataBase;
USE Pizza_DataBase;

-- Step 2: Create Tables

-- Customers table
CREATE TABLE `customers` (
    `cust_id` int NOT NULL AUTO_INCREMENT,
    `cust_firstname` varchar(50) NOT NULL,
    `cust_lastname` varchar(50) NOT NULL,
    PRIMARY KEY (`cust_id`)
);

-- Address table (for delivery addresses)
CREATE TABLE `address` (
    `add_id` int NOT NULL AUTO_INCREMENT,
    `delivery_address1` varchar(200) NOT NULL,
    `delivery_address2` varchar(200),
    `delivery_city` varchar(50) NOT NULL,
    `delivery_zipcode` varchar(20) NOT NULL,
    PRIMARY KEY (`add_id`)
);

-- Items (menu items like pizzas)
CREATE TABLE `item` (
    `item_id` int NOT NULL AUTO_INCREMENT,
    `sku` varchar(20) NOT NULL,
    `item_name` varchar(100) NOT NULL,
    `item_cat` varchar(100) NOT NULL,
    `item_size` varchar(10) NOT NULL,
    `item_price` decimal(10,2) NOT NULL,
    PRIMARY KEY (`item_id`),
    UNIQUE (`sku`)
);

-- Orders table, with delivery linked to address
CREATE TABLE `orders` (
    `order_id` int NOT NULL AUTO_INCREMENT,
    `created_at` datetime NOT NULL,
    `item_id` int NOT NULL,
    `quantity` int NOT NULL,
    `cust_id` int NOT NULL,
    `delivery` boolean NOT NULL,
    `add_id` int DEFAULT NULL,  -- Make delivery address optional for non-delivery orders
    PRIMARY KEY (`order_id`),
    FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`),
    FOREIGN KEY (`cust_id`) REFERENCES `customers`(`cust_id`),
    FOREIGN KEY (`add_id`) REFERENCES `address`(`add_id`) ON DELETE SET NULL  -- Optional delivery address
);

-- Ingredients table (for tracking ingredient usage)
CREATE TABLE `ingredient` (
    `ing_id` int NOT NULL AUTO_INCREMENT,
    `ing_name` varchar(200) NOT NULL,
    `ing_weight` int NOT NULL,  -- Measurement weight per ingredient unit
    `ing_meas` varchar(20) NOT NULL,  -- Unit of measurement (e.g., grams, kg)
    `ing_price` decimal(5,2) NOT NULL,  -- Price per unit of ingredient
    PRIMARY KEY (`ing_id`)
);

-- Recipe table to link menu items to ingredients
CREATE TABLE `recipe` (
    `recipe_id` int NOT NULL AUTO_INCREMENT,
    `item_id` int NOT NULL,  -- Referencing item by `item_id`
    `ing_id` int NOT NULL,  -- Referencing ingredients
    `quantity` int NOT NULL,  -- Quantity of the ingredient used for the item
    PRIMARY KEY (`recipe_id`),
    FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`),
    FOREIGN KEY (`ing_id`) REFERENCES `ingredient`(`ing_id`)
);

-- Inventory table to manage stock levels
CREATE TABLE `inventory` (
    `inv_id` int NOT NULL AUTO_INCREMENT,
    `item_id` int NOT NULL,
    `quantity` int NOT NULL,  -- Stock level of the item
    PRIMARY KEY (`inv_id`),
    FOREIGN KEY (`item_id`) REFERENCES `item`(`item_id`)
);

-- Staff table for managing employees
CREATE TABLE `staff` (
    `staff_id` int NOT NULL AUTO_INCREMENT,
    `first_name` varchar(50) NOT NULL,
    `last_name` varchar(50) NOT NULL,
    `position` varchar(100) NOT NULL,
    `hourly_rate` decimal(5,2) NOT NULL,
    PRIMARY KEY (`staff_id`)
);

-- Shifts table for staff work shifts
CREATE TABLE `shift` (
    `shift_id` int NOT NULL AUTO_INCREMENT,
    `day_of_week` varchar(10) NOT NULL,
    `start_time` time NOT NULL,
    `end_time` time NOT NULL,
    PRIMARY KEY (`shift_id`)
);

-- Rota table for assigning staff to shifts
CREATE TABLE `rota` (
    `rota_id` int NOT NULL AUTO_INCREMENT,
    `date` date NOT NULL,
    `shift_id` int NOT NULL,
    `staff_id` int NOT NULL,
    PRIMARY KEY (`rota_id`),
    FOREIGN KEY (`shift_id`) REFERENCES `shift`(`shift_id`),
    FOREIGN KEY (`staff_id`) REFERENCES `staff`(`staff_id`)
);
