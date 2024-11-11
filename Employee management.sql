-- Creating Database
CREATE DATABASE empmanagement;
USE empmanagement;

-- Creating and Populating the Employee Database Table
CREATE TABLE empdatabase (
    id INT PRIMARY KEY,
    name VARCHAR(20),
    dept VARCHAR(20),
    salary INT,
    hiredate DATE
);

INSERT INTO empdatabase VALUES 
(1, 'John Doe', 'IT', 50000, '2023-01-01'),
(2, 'Jane Smith', 'HR', 89000, '2023-02-02'),
(3, 'Bob Deo', 'Finance', 93000, '2023-03-10'),
(4, 'Amanda Alison', 'Finance', 58000, '2023-08-15'),
(5, 'Alice Brown', 'Marketing', 89000, '2023-04-20');

-- Displaying All Data
SELECT * FROM empdatabase;

-- DQL: Selecting Specific Department
SELECT * FROM empdatabase WHERE dept = 'IT';

-- DQL: Recent Hires in Last Six Months
SELECT name, hiredate FROM empdatabase 
WHERE hiredate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- Updating Records
UPDATE empdatabase SET dept = 'New Job Title', salary = salary + 5000 WHERE id = 1;

-- Roles and Permissions (MySQL does not support CREATE ROLE directly, so use users instead)
CREATE USER 'manager'@'localhost';
GRANT UPDATE ON empmanagement.empdatabase TO 'manager'@'localhost';

CREATE USER 'viewer'@'localhost';
GRANT SELECT ON empmanagement.empdatabase TO 'viewer'@'localhost';

-- Additional Employee Tables for Join Operations
CREATE TABLE emp_info10 (
    empName VARCHAR(20),
    empID INT,
    empdeptName VARCHAR(20) PRIMARY KEY,
    emphireDate DATE,
    empsalary BIGINT,
    jobtitle VARCHAR(20)
);

INSERT INTO emp_info10 VALUES 
('John', 10, 'IT', '2023-01-01', 1000000, 'Data Analyst'),
('Sam', 20, 'Sales', '2024-08-08', 1007800, 'Data Scientist'),
('Amanda', 30, 'HR', '2028-12-10', 1004700, 'ML Engineer'),
('Ceily', 40, 'Finance', '2023-06-04', 1000980, 'Tableau Developer'),
('Deo', 50, 'Marketing', '2021-01-01', 1000360, 'Python Developer');

CREATE TABLE emp_info30 (
    empName VARCHAR(20),
    empID INT,
    empdeptName VARCHAR(20) PRIMARY KEY,
    emphireDate DATE,
    empsalary BIGINT,
    jobtitle VARCHAR(20)
);

INSERT INTO emp_info30 VALUES 
('Emma', 10, 'IT', '2003-01-01', 1008900, 'Jr. Analyst'),
('Mila', 20, 'Operations', '2024-08-08', 1007800, 'Data Scientist'),
('Amanda', 30, 'HR', '2028-12-10', 1004700, 'ML Engineer'),
('Ceily', 40, 'Finance', '2023-06-04', 1000980, 'Tableau Developer'),
('Deo', 50, 'Marketing', '2021-01-01', 1000360, 'Python Developer');

-- Join Query
SELECT * FROM emp_info10 INNER JOIN emp_info30 ON emp_info10.empID = emp_info30.empID;

-- Case Study Integration with emp_info100 and emp_department1000
CREATE TABLE emp_info100 (
    emp_Name VARCHAR(22),
    emp_ID INT,
    emp_deptName VARCHAR(22) PRIMARY KEY,
    emp_hireDate DATE,
    emp_salary BIGINT,
    job_title VARCHAR(22)
);

INSERT INTO emp_info100 VALUES 
('Ankit', 7, 'Operations', '2017-08-20', 180060, 'Analyst'),
('Vaishnavi', 8, 'Sales', '2016-01-12', 1405800, 'Accountant'),
('Vanes', 9, 'Support', '2021-10-05', 19508, 'Consultant');

CREATE TABLE emp_department1000 (
    dept_Id INT,
    emp_deptName VARCHAR(22),
    FOREIGN KEY (emp_deptName) REFERENCES emp_info100(emp_deptName)
);

INSERT INTO emp_department1000 VALUES 
(1, 'Operations'),
(2, 'Sales'),
(3, 'Support');

-- Join Query with emp_department1000
SELECT emp_info100.emp_deptName, emp_info100.emp_Name, emp_department1000.dept_Id
FROM emp_info100
INNER JOIN emp_department1000 ON emp_info100.emp_deptName = emp_department1000.emp_deptName;

-- Creating Employee and Training Tables
CREATE TABLE employees (
    emp_Id INT PRIMARY KEY,
    emp_Name VARCHAR(20),
    department VARCHAR(20)
);

INSERT INTO employees VALUES 
(100, 'Johnson', 'IT'),
(101, 'Jenelia', 'Sales'),
(102, 'Boby', 'Accounts');

CREATE TABLE emptraining_sessions (
    session_Id INT PRIMARY KEY,
    session_Name VARCHAR(20),
    session_date DATE,
    trainer_Name VARCHAR(20)
);

INSERT INTO emptraining_sessions VALUES 
(1007, 'SQL Basics', '2023-02-02', 'Ankita'),
(1008, 'PBS', '2023-10-12', 'Sumit'),
(1005, 'Data Science', '2023-09-10', 'Jaya');

-- Select Data from Final Tables
SELECT * FROM empdatabase;
SELECT * FROM emp_info10;
SELECT * FROM emp_info30;
SELECT * FROM emp_info100;
SELECT * FROM emp_department1000;
SELECT * FROM employees;
SELECT * FROM emptraining_sessions;
