-- Step 3: Insert Sample Data

-- Customers
INSERT INTO `customers` (`cust_firstname`, `cust_lastname`)
VALUES
('Michael', 'Johnson'),
('Sarah', 'Williams'),
('David', 'Brown'),
('Emily', 'Martinez'),
('Sophia', 'Davis');

-- Addresses
INSERT INTO `address` (`delivery_address1`, `delivery_address2`, `delivery_city`, `delivery_zipcode`)
VALUES
('101 Maple Street', 'Apt 4B', 'New York', '10001'),
('202 Oak Avenue', NULL, 'Los Angeles', '90001'),
('303 Pine Road', 'Unit 12', 'Chicago', '60601'),
('404 Cedar Blvd', 'Suite 7', 'Houston', '77001'),
('505 Birch Lane', NULL, 'Phoenix', '85001');

-- Items (menu items)
INSERT INTO `item` (`sku`, `item_name`, `item_cat`, `item_size`, `item_price`)
VALUES
('PZ001', 'Margherita Pizza', 'Pizza', 'Large', 15.99),
('PZ002', 'Pepperoni Pizza', 'Pizza', 'Medium', 13.99),
('PZ003', 'BBQ Chicken Pizza', 'Pizza', 'Large', 16.99),
('PZ004', 'Veggie Pizza', 'Pizza', 'Medium', 12.99),
('PZ005', 'Hawaiian Pizza', 'Pizza', 'Small', 10.99);

-- Orders
INSERT INTO `orders` (`created_at`, `item_id`, `quantity`, `cust_id`, `delivery`, `add_id`)
VALUES
('2024-09-12 18:25:00', 1, 2, 1, TRUE, 1),  -- Delivery for customer Michael Johnson
('2024-09-12 19:00:00', 2, 1, 2, FALSE, NULL),  -- Pickup for Sarah Williams
('2024-09-13 12:30:00', 3, 3, 3, TRUE, 3),  -- Delivery for David Brown
('2024-09-13 13:15:00', 4, 2, 4, TRUE, 4),  -- Delivery for Emily Martinez
('2024-09-13 14:00:00', 5, 1, 5, TRUE, 5);  -- Delivery for Sophia Davis

-- Ingredients
INSERT INTO `ingredient` (`ing_name`, `ing_weight`, `ing_meas`, `ing_price`)
VALUES
('Tomato Sauce', 500, 'grams', 3.00),
('Mozzarella Cheese', 200, 'grams', 5.00),
('Pepperoni', 100, 'grams', 2.50),
('Chicken', 250, 'grams', 4.00),
('Pineapple', 150, 'grams', 2.00);

-- Recipes (Link items to ingredients)
INSERT INTO `recipe` (`item_id`, `ing_id`, `quantity`)
VALUES
(1, 1, 150),  -- Margherita Pizza with Tomato Sauce (150g)
(1, 2, 100),  -- Margherita Pizza with Mozzarella Cheese (100g)
(2, 1, 100),  -- Pepperoni Pizza with Tomato Sauce (100g)
(2, 2, 80),   -- Pepperoni Pizza with Mozzarella Cheese (80g)
(2, 3, 50),   -- Pepperoni Pizza with Pepperoni (50g)
(3, 1, 120),  -- BBQ Chicken Pizza with Tomato Sauce (120g)
(3, 2, 80),   -- BBQ Chicken Pizza with Mozzarella Cheese (80g)
(3, 4, 200),  -- BBQ Chicken Pizza with Chicken (200g)
(5, 1, 50),   -- Hawaiian Pizza with Tomato Sauce (50g)
(5, 2, 70),   -- Hawaiian Pizza with Mozzarella Cheese (70g)
(5, 5, 60);   -- Hawaiian Pizza with Pineapple (60g)

