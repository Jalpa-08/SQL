CREATE DATABASE UDF;
USE UDF;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (first_name, last_name, age, department, salary)
VALUES
('John', 'Doe', 30, 'HR', 50000.00),
('Jane', 'Smith', 27, 'IT', 60000.00),
('Mike', 'Brown', 35, 'Finance', 75000.00),
('Sara', 'Johnson', 29, 'Marketing', 55000.00),
('David', 'White', 40, 'Sales', 80000.00),
('Emily', 'Taylor', 32, 'IT', 62000.00),
('Brian', 'Adams', 45, 'Finance', 90000.00),
('Sophia', 'Clark', 26, 'HR', 48000.00),
('James', 'Lewis', 38, 'Marketing', 72000.00),
('Olivia', 'Walker', 29, 'IT', 64000.00),
('Ethan', 'Harris', 31, 'Finance', 78000.00),
('Ava', 'Martin', 27, 'Sales', 55000.00),
('William', 'Thompson', 35, 'IT', 70000.00),
('Mia', 'Anderson', 28, 'HR', 52000.00),
('Benjamin', 'Thomas', 37, 'Marketing', 75000.00),
('Charlotte', 'Robinson', 30, 'Finance', 81000.00);

/* Get Full Name of an Employee */
DELIMITER $$
CREATE FUNCTION get_full_name(emp_id INT) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE full_name VARCHAR(100);
    SELECT CONCAT(first_name, ' ', last_name) INTO full_name FROM employees WHERE id = emp_id;
    RETURN full_name;
END$$
DELIMITER ;

/* Calculate Annual Salary */
DELIMITER $$
CREATE FUNCTION get_annual_salary(emp_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE annual_salary DECIMAL(10,2);
    SELECT salary * 12 INTO annual_salary FROM employees WHERE id = emp_id;
    RETURN annual_salary;
END$$
DELIMITER ;

/* Get Employee Age Category */
DELIMITER $$
CREATE FUNCTION age_category(emp_id INT) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE age INT;
    DECLARE category VARCHAR(20);
    
    SELECT employees.age INTO age FROM employees WHERE id = emp_id;
    
    IF age < 25 THEN
        SET category = 'Young';
    ELSEIF age BETWEEN 25 AND 40 THEN
        SET category = 'Middle Age';
    ELSE
        SET category = 'Senior';
    END IF;
    
    RETURN category;
END$$
DELIMITER ;

/* Get Department Name of an Employee */
DELIMITER $$
CREATE FUNCTION get_department(emp_id INT) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE dept VARCHAR(50);
    SELECT department INTO dept FROM employees WHERE id = emp_id;
    RETURN dept;
END$$
DELIMITER ;


/*Calculate Bonus (10% of Salary) */
DELIMITER $$
CREATE FUNCTION calculate_bonus(emp_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE bonus DECIMAL(10,2);
    SELECT salary * 0.10 INTO bonus FROM employees WHERE id = emp_id;
    RETURN bonus;
END$$
DELIMITER ;

/* Check if Employee is Eligible for Promotion (Salary > 70k) */
DELIMITER $$
CREATE FUNCTION is_eligible_for_promotion(emp_id INT) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE salary DECIMAL(10,2);
    DECLARE eligible VARCHAR(10);
    
    SELECT employees.salary INTO salary FROM employees WHERE id = emp_id;
    
    IF salary > 70000 THEN
        SET eligible = 'Yes';
    ELSE
        SET eligible = 'No';
    END IF;
    
    RETURN eligible;
END$$
DELIMITER ;

/*  Calculate Tax (20% of Salary) */
DELIMITER $$
CREATE FUNCTION calculate_tax(emp_id INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE tax DECIMAL(10,2);
    SELECT salary * 0.20 INTO tax FROM employees WHERE id = emp_id;
    RETURN tax;
END$$
DELIMITER ;

/*  Get Employee Count in a Department */
DELIMITER $$
CREATE FUNCTION employee_count(dept_name VARCHAR(50)) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE count_emp INT;
    SELECT COUNT(*) INTO count_emp FROM employees WHERE department = dept_name;
    RETURN count_emp;
END$$
DELIMITER ;

/* Get Average Salary in a Department */
DELIMITER $$
CREATE FUNCTION average_salary(dept_name VARCHAR(50)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_salary DECIMAL(10,2);
    SELECT AVG(salary) INTO avg_salary FROM employees WHERE department = dept_name;
    RETURN avg_salary;
END$$
DELIMITER ;

/* Get Highest Salary in a Department */
DELIMITER $$
CREATE FUNCTION highest_salary(dept_name VARCHAR(50)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE max_salary DECIMAL(10,2);
    SELECT MAX(salary) INTO max_salary FROM employees WHERE department = dept_name;
    RETURN max_salary;
END$$
DELIMITER ;


/* Get Experience Level Based on Age */
DELIMITER $$

CREATE FUNCTION experience_level(emp_id INT) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE age INT;
    DECLARE level VARCHAR(20);
    
    -- Get the employee's age
    SELECT employees.age INTO age FROM employees WHERE id = emp_id;
    
    -- Define experience level based on age
    IF age < 30 THEN
        SET level = 'Junior';
    ELSEIF age BETWEEN 30 AND 40 THEN
        SET level = 'Mid-Level';
    ELSE
        SET level = 'Senior';
    END IF;
    
    RETURN level;
END$$

DELIMITER ;


/* Get Salary Grade */
DELIMITER $$

CREATE FUNCTION salary_grade(emp_id INT) RETURNS CHAR(1)
DETERMINISTIC
BEGIN
    DECLARE salary DECIMAL(10,2);
    DECLARE grade CHAR(1);
    
    -- Get the employee's salary
    SELECT employees.salary INTO salary FROM employees WHERE id = emp_id;
    
    -- Define salary grade
    IF salary >= 90000 THEN
        SET grade = 'A';
    ELSEIF salary BETWEEN 75000 AND 89999 THEN
        SET grade = 'B';
    ELSEIF salary BETWEEN 60000 AND 74999 THEN
        SET grade = 'C';
    ELSEIF salary BETWEEN 45000 AND 59999 THEN
        SET grade = 'D';
    ELSE
        SET grade = 'E';
    END IF;
    
    RETURN grade;
END$$

DELIMITER ;





