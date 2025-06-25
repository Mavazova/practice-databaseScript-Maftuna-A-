
-- Scenario 1 Urban Eats
-- Begin Transaction
START TRANSACTION;

-- Drop tables
DROP TABLE IF EXISTS orders, menu_items, restaurants;

-- Create restaurants table
CREATE TABLE restaurants (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  location VARCHAR(100) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create menu_items table
CREATE TABLE menu_items (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create orders table with foreign keys
CREATE TABLE orders (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  restaurant_id INT NOT NULL,
  menu_item_id INT NOT NULL,
  quantity INT NOT NULL,
  order_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);

-- Insert sample restaurant data
INSERT INTO restaurants (name, location) VALUES
  ('Urban Eats', '123 St. Louis'),
  ('Urban Eats', '456 Austin'),
  ('Urban Eats', '789 Cheyenne');

-- Insert sample menu items
INSERT INTO menu_items (name, description, price) VALUES
  ('Gooey Butter Cake', 'Cake for breakfast? Yes, please! In St. Louis, starting your day with a slice of gooey butter cake is practically a rite of passage.', 10.99),
  ('Austin Barbecue', 'The secret to Austin barbecue lies in the meticulous smoking process using post oak or other hardwoods.', 20.99),
  ('Cowboy Cut Ribeye', 'A thick, juicy steak that’s cut from the rib section of the cow.', 15.99);

-- Insert sample customer orders
INSERT INTO orders (restaurant_id, menu_item_id, quantity) VALUES
  (1, 2, 3),
  (2, 3, 1),
  (1, 3, 3);

-- Commit
COMMIT;
