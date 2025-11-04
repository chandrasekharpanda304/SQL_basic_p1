CREATE DATABASE sql_p1

CREATE TABLE employees (
						employee_id INT, 
						name VARCHAR(20),
						department VARCHAR(20),
						salary DECIMAL(10, 2),
						hiredate DATE
						);


-- Inserting more records into employees table 

INSERT INTO employees (employee_id, name, department, salary, hiredate)
VALUES 
    (1, 'John Doe', 'IT', 50000, '2020-01-15'),
    (2, 'Jane Smith', 'HR', 55000, '2019-08-20'),
    (3, 'Michael Lee', 'Marketing', 60000, '2020-03-10'),
    (4, 'Emily Brown', 'Finance', 65000, '2018-11-05'),
    (5, 'David Wilson', 'IT', 52000, '2021-02-28');
	
SELECT * FROM employees

--creating product table

CREATE TABLE products (
					    product_id INT,
					    product_name VARCHAR(30),
					    category VARCHAR(30),
					    price DECIMAL(10, 2),
					    quantity_in_stock INT
						); 

-- inserting records into products table 

INSERT INTO products (product_id, product_name, category, price, quantity_in_stock)
VALUES 
    (101, 'Laptop', 'Electronics', 1200, 50),
    (102, 'Smartphone', 'Electronics', 800, 100),
    (103, 'Headphones', 'Electronics', 100, 200),
    (104, 'T-shirt', 'Clothing', 20, 300),
    (105, 'Jeans', 'Clothing', 50, 150);
	
SELECT * FROM products


-- Creating customers table 

CREATE TABLE customers (
					    customer_id INT,
					    customer_name VARCHAR(30),
					    email VARCHAR(30),
					    phone_number VARCHAR(20),
					    city VARCHAR(30)
						);


-- inserting data into customers table 

INSERT INTO customers (customer_id, customer_name, email, phone_number, city)
VALUES 
    (201, 'Alice Johnson', 'alice@example.com', '1234567890', 'New York'),
    (202, 'Bob Smith', 'bob@example.com', '9876543210', 'Los Angeles'),
    (203, 'Emma Davis', 'emma@example.com', '4567890123', 'Chicago'),
    (204, 'Jack Brown', 'jack@example.com', '7890123456', 'Houston'),
    (205, 'Olivia Wilson', 'olivia@example.com', '2345678901', 'Miami');

SELECT * FROM customers


-- creating orders table 

CREATE TABLE orders (
					    order_id INT ,
					    customer_id INT,
					    product_id INT,
					    order_date DATE,
					    quantity_ordered INT
					);

-- inserting data into orders 
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity_ordered)
VALUES 
    (301, 201, 101, '2022-03-15', 2),
    (302, 202, 103, '2022-03-16', 3),
    (303, 203, 104, '2022-03-17', 1),
    (304, 204, 102, '2022-03-18', 2),
    (305, 205, 105, '2022-03-19', 1);

SELECT * FROM orders

-- PRIMARY KEY (t_id cannot be empty, cannot be duplicate, it has be unique)

CREATE TABLE transaction (
					    transaction_id INT PRIMARY KEY,
					    customer_id INT,
					    amount DECIMAL(10, 2),
					    transaction_date DATE,
					    payment_method VARCHAR(50)
						);

-- inserting records into transactions
INSERT INTO transaction (transaction_id, customer_id, amount, transaction_date, payment_method)
VALUES 
    (401, 201, 1200, '2022-03-15', 'Credit Card'),
    (402, 202, 1000, '2022-03-16', 'PayPal'),
    (403, 203, 800, '2022-03-17', 'Cash'),
    (404, 204, 1500, '2022-03-18', 'Debit Card'),
    (405, 205, 600, '2022-03-19', 'PayPal');

SELECT * FROM transaction

-- -----------------------------------------------
-- Business Problems & Answers 
-- -----------------------------------------------

--employees Queries:

-- Q.1 Find the employees with the highest salary.

SELECT * FROM employees
WHERE salary = 85000;

-- similar questions

SELECT * FROM employees
WHERE department = 'IT'

SELECT * FROM employees
WHERE salary > 60000;


SELECT * FROM employees
WHERE salary <= 50000;


-- Q.2 List employees hired after January 1, 2021.

SELECT * FROM employees
WHERE hiredate > '2021-01-01'

-- Q.3 Calculate the average salary of employees in each department.

SELECT department, AVG(salary) as avg_salary
FROM employees
GROUP BY department;

-- Q.4 Update the salary of employee with ID 3 to 62000.


SELECT * FROM employees;

UPDATE employees
SET salary = 62000
WHERE  employee_id = 3


--Q.5 Delete the employee with the lowest salary.

DELETE FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

------Product Queries:-------

-- Q.6 Find the total value of products in stock for each category.

SELECT * FROM products

SELECT category,
		SUM(price * quantity_in_stock) as total_stock_value
		FROM products
		GROUP BY category;

-- Q.7 Identify products with a quantity in stock less than 50.

SELECT * FROM products
WHERE quantity_in_stock <= 50

-- Q.8 Calculate total number of product we have in products table.

-- SUM, COUNT, MAX, MIN
	
SELECT 
	COUNT(product_id) as total_products
FROM products;

-- Q.9 Update the price of all products in the 'Clothing' category to 10% higher.

SELECT * FROM products
WHERE category = 'Clothing';

UPDATE products
SET price = price * 1.10
WHERE category = 'Clothing'


-- Q.10 Delete products with a price less than 50.

SELECT * FROM products
WHERE price < 50;

DELETE FROM products
WHERE price < 50;

----- Customer Queries:-----

SELECT * FROM customers

-- Q.11 Count the number of customers in each city.

SELECT COUNT(customer_id),
			city 
			FROM customers
GROUP BY city;

-- Q.12 Update the email of customer with ID 204 to 'new_email@example.com'.

 UPDATE customers
 SET email = 'newemail@example.com'
 WHERE customer_id = 204;


 -- Order Queries:

 SELECT * FROM orders
 
-- Q.14. Find the total number of orders placed on each date.

SELECT 
COUNT(order_id) AS total_orders, 
	  order_date 
FROM orders
GROUP BY order_date
ORDER BY order_date;

-- Q.15 Identify orders with a quantity_ordered greater or equal to than 3.

SELECT * FROM orders
WHERE quantity_ordered >= 3;


-- Q.16 Update the order_date of order with ID 304 to '2022-03-20'.

UPDATE orders
SET order_date = '2022-03-20'
WHERE order_id = 304;

-- Q.17 Delete orders placed before January 1, 2022.

DELETE FROM orders
WHERE order_date < '2022-01-01'

-- Transaction Queries:

SELECT * FROM transaction

-- Q.18. Find the average transaction amount for each payment method.

SELECT payment_method,
		ROUND(AVG(amount) ,2) AS avg_amt
		FROM transaction
GROUP BY payment_method;

-- Q.19 Identify transactions made on March 15, 2022

SELECT * FROM transaction 
WHERE transaction_date = '2022-03-15'

-- Q.20 Identify customers who have made transactions using PayPal.

SELECT * FROM transaction 
WHERE payment_method = 'PayPal'

-- -- Insertion Tasks:

-- 1. Insert a new employee with the following details: EmployeeID = 101, Name = 'John Doe', Department = 'Marketing', Salary = 60000, HireDate = '2022-04-01'.

SELECT * FROM employees

INSERT INTO employees (employee_id, name, department, salary, hiredate)
VALUES  
		(101,'john Doe', 'Marketing',60000, '2022-04-01')

-- 2. Add a new product with the following details: ProductID = 11, Name = 'Smartphone', Category = 'Electronics', Price = 799.99, Quantity = 100.

SELECT * FROM products

INSERT INTO products (product_id, product_name, category, price, quantity_in_stock)
VALUES  
		(11,'Smartphone','Electronics',799.99,100)
		
-- -- Update Tasks:
-- 1. Increase the salary of all employees in the 'IT' department by 10%.

UPDATE employees
SET salary = salary * 1.10
WHERE department = 'IT'

-- 2. Update the price of the product with ProductID = 105 to 99.99.

UPDATE products
SET price = 99.99
WHERE product_id = 105;

-- -- Deletion Tasks:
-- 1. Delete the employee with EmployeeID = 101.

DELETE FROM employees
WHERE employee_id = 101

-- 2. Remove all products with a Quantity less than or equal to 50.

DELETE FROM products
WHERE quantity_in_stock <= 50


-- END OF PROJECT --
