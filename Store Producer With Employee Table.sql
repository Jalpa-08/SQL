CREATE DATABASE N1;
USE N1;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each employee
    employee_name VARCHAR(100) NOT NULL,        -- Name of the employee
    department_id INT NOT NULL,                -- ID of the department the employee belongs to
    salary DECIMAL(10, 2) NOT NULL             -- Salary of the employee
);


INSERT INTO employees (employee_name, department_id, salary) VALUES
('Alice Johnson', 101, 60000.00),
('Bob Smith', 102, 55000.00),
('Charlie Brown', 103, 45000.00),
('Diana Prince', 101, 70000.00),
('Edward Norton', 102, 50000.00),
('Fiona Apple', 103, 52000.00),
('George Martin', 101, 62000.00),
('Hannah Lee', 104, 58000.00),
('Ian Wright', 104, 47000.00),
('Julia Roberts', 102, 65000.00),
('Kevin Hart', 103, 54000.00),
('Liam Neeson', 101, 63000.00),
('Monica Bell', 104, 51000.00),
('Nathan Drake', 101, 72000.00),
('Olivia Wilde', 102, 69000.00),
('Paul Walker', 103, 48000.00),
('Quincy Adams', 104, 53000.00),
('Rachel Green', 101, 75000.00),
('Steve Rogers', 102, 46000.00),
('Tina Fey', 103, 61000.00);


/* Insert Data into a Table */

DELIMITER $$

CREATE PROCEDURE AddNewEmployee(
    IN emp_name VARCHAR(100), 
    IN dept_id INT, 
    IN salary DECIMAL(10, 2)
)
BEGIN
    INSERT INTO employees (employee_name, department_id, salary)
    VALUES (emp_name, dept_id, salary);
END $$

DELIMITER ;

CALL AddNewEmployee('John Doe', 101, 75000.00);

/* Update Employee Salary */

DELIMITER $$

CREATE PROCEDURE UpdateEmployeeSalary(
    IN emp_id INT, 
    IN new_salary DECIMAL(10, 2)
)
BEGIN
    UPDATE employees
    SET salary = new_salary
    WHERE employee_id = emp_id;
END $$

DELIMITER ;

CALL UpdateEmployeeSalary(1, 80000.00);

/* Retrieve Total Employees in a Department */

DELIMITER $$

CREATE PROCEDURE CountEmployeesInDepartment(
    IN dept_id INT, 
    OUT total_employees INT
)
BEGIN
    SELECT COUNT(*) INTO total_employees
    FROM employees
    WHERE department_id = dept_id;
END $$

DELIMITER ;

CALL CountEmployeesInDepartment(101, @total);
SELECT @total;


/* Delete an Employee by ID */

DELIMITER $$

CREATE PROCEDURE DeleteEmployeeById(
    IN emp_id INT
)
BEGIN
    DELETE FROM employees
    WHERE employee_id = emp_id;
END $$

DELIMITER ;

CALL DeleteEmployeeById(1);

/*Fetch Employees with Salary Greater Than a Given Amount */
DELIMITER $$

CREATE PROCEDURE GetHighSalaryEmployees(
    IN min_salary DECIMAL(10, 2)
)
BEGIN
    SELECT employee_id, employee_name, salary
    FROM employees
    WHERE salary > min_salary;
END $$

DELIMITER ;

CALL GetHighSalaryEmployees(50000.00);

/* Retrieve Employees by Salary Range */
DELIMITER $$

CREATE PROCEDURE GetEmployeesBySalaryRange(
    IN min_salary DECIMAL(10, 2),
    IN max_salary DECIMAL(10, 2)
)
BEGIN
    SELECT employee_id, employee_name, department_id, salary
    FROM employees
    WHERE salary BETWEEN min_salary AND max_salary;
END $$

DELIMITER ;

CALL GetEmployeesBySalaryRange(50000.00, 70000.00);

/* Count Employees in Each Department */
DELIMITER $$

CREATE PROCEDURE CountEmployeesByDepartment()
BEGIN
    SELECT department_id, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id;
END $$

DELIMITER ;
CALL CountEmployeesByDepartment();

/* Increase Salary by Percentage */
DELIMITER $$

CREATE PROCEDURE IncreaseSalaryByPercentage(
    IN dept_id INT,
    IN percentage DECIMAL(5, 2)
)
BEGIN
    UPDATE employees
    SET salary = salary + (salary * (percentage / 100))
    WHERE department_id = dept_id;
END $$

DELIMITER ;

CALL IncreaseSalaryByPercentage(101, 10);

/* Delete Employees by Department */
DELIMITER $$

CREATE PROCEDURE DeleteEmployeesByDepartment(
    IN dept_id INT
)
BEGIN
    DELETE FROM employees
    WHERE department_id = dept_id;
END $$

DELIMITER ;

CALL DeleteEmployeesByDepartment(104);


/* Get Employees Above Average Salary */
DELIMITER $$

CREATE PROCEDURE GetEmployeesAboveAverageSalary()
BEGIN
    SELECT employee_id, employee_name, department_id, salary
    FROM employees
    WHERE salary > (SELECT AVG(salary) FROM employees);
END $$

DELIMITER ;

CALL GetEmployeesAboveAverageSalary();










