/* One of the most powerful features added in MySQL  is common table expressions, which allow for the construction of 
temporary result sets within a single SQL query. In our daily life queries, we often use common table expressions and 
it makes our work easier. In this article, we will understand 
the Common Table Expression with examples and also we will learn how to use the statements.*/
CREATE DATABASE CTE;
USE CTE;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);
INSERT INTO employees (name, department, salary) VALUES
('John Doe', 'Sales', 55000.00),
('Jane Smith', 'Sales', 60000.00),
('Jim Brown', 'Sales', 65000.00),
('Jake White', 'Engineering', 75000.00),
('Jill Green', 'Engineering', 80000.00),
('Jenny Black', 'Engineering', 85000.00),
('James Gray', 'Marketing', 50000.00),
('Janet Blue', 'Marketing', 52000.00),
('Joan Pink', 'Marketing', 54000.00);

WITH department_salaries AS (
    SELECT department, 
           SUM(salary) AS total_salary, 
           AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT department, total_salary, average_salary
FROM department_salaries
WHERE average_salary > 60000;


/* Recursive CTE for Hierarchical Data
Suppose these table categories represent a hierarchical category structure with a self-referencing foreign key parent_id. */

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES categories(id)
);
INSERT INTO categories (name, parent_id) VALUES
('Electronics', NULL),
('Computers', 1),
('Laptops', 2),
('Desktops', 2),
('Smartphones', 1),
('Accessories', 1),
('Chargers', 6),
('Cables', 6);

WITH RECURSIVE category_hierarchy AS (
    SELECT id, name, parent_id, 1 AS level
    FROM categories
    WHERE parent_id IS NULL
    UNION ALL
    SELECT c.id, c.name, c.parent_id, ch.level + 1
    FROM categories c
    JOIN category_hierarchy ch ON c.parent_id = ch.id
)
SELECT id, name, parent_id, level
FROM category_hierarchy;

/*Temporary Aggregation
Let there be a table sales and you need to calculate the total sales for each salesperson, then filter those that achieved sales more than a given cutoff value.*/

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salesperson_id INT,
    sales_amount DECIMAL(10, 2)
);

INSERT INTO sales (salesperson_id, sales_amount) VALUES
(1, 3000.00),
(1, 2500.00),
(1, 1500.00),
(2, 4000.00),
(2, 2000.00),
(3, 1000.00),
(3, 2000.00),
(4, 7000.00),
(5, 3000.00),
(5, 2500.00);

WITH total_sales AS (
    SELECT salesperson_id, SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY salesperson_id
)
SELECT salesperson_id, total_sales
FROM total_sales
WHERE total_sales > 5000;