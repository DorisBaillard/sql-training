--training with SELECT statements

--1st task : finding all employees
SELECT *
FROM employee;

-- 2. Find all clients
SELECT *
FROM client;

-- 3. find all employees ordered by salary

SELECT * 
FROM employee
ORDER BY salary;

--4.  find all employees ordered by birthday in descending order
SELECT * 
FROM employee
ORDER BY birth_day DESC;

--5. find all employees ordered by sex then name

SELECT * 
FROM employee
ORDER BY sex,first_name,last_name;

--6. list the 1st and last name of employees

SELECT first_name, last_name
FROM employee;

-- 7. find the forename and surname names of all employees
SELECT first_name AS forename, last_name AS surname
FROM employee;


--8. Find  out all the different genders

SELECT DISTINCT sex
FROM employee;



-- SQL functions

-- 1. find the number of employees

SELECT COUNT(*)
FROM employee;

-- or
SELECT COUNT(emp_id)
FROM employee;

--2. count how many employees have supervisor

SELECT COUNT(super_id)
FROM employee;

--3. find the number of female employees born after 1970

SELECT COUNT(emp_id)
FROM employee
WHERE sex='F' AND birth_day > '1971-01-01' ;


-- 4. find the average of all employee's salary who are male

SELECT AVG(salary)
FROM employee
WHERE sex='M';

--5.Find the sum of all employees salary

SELECT SUM(salary)
FROM employee;

--6. Aggregation - if I want to count the different genders:


SELECT DISTINCT(sex)AS gender, COUNT(sex) AS gender_count
FROM employee
GROUP BY sex;

--or

SELECT COUNT(sex),sex
FROM employee
GROUP BY sex;

-- 7. Find the total sales of each salesman

SELECT emp_id, SUM(total_sales)
FROM works_with
GROUP BY emp_id;

--8. Idem for clients : show how much each client spent in descending order

SELECT client_id, SUM(total_sales)
FROM works_with
GROUP BY client_id
ORDER BY SUM(total_sales) DESC;

-- Wildcards / Regex  % = any characters, _ = one character

-- 1. Find any clients who are an LLC

SELECT *
FROM client
WHERE client_name LIKE '%LLC%';


-- 2. Find any branch supplier who are in the label business

SELECT *
FROM branch_supplier
WHERE supplier_name LIKE "%label%"; 


--3. Find any employee born in october

SELECT * 
FROM employee
WHERE birth_day LIKE "____-10%";

-- 4. Find any clients who are schools

SELECT *
FROM client
WHERE client_name LIKE '%school%';



-- Union

SELECT first_name FROM employee
UNION
SELECT branch_name FROM branch;

-- find a list of all clients & branch supplier's names + branch_id

SELECT client_name,client.branch_id
FROM client
UNION
SELECT supplier_name,branch_supplier.branch_id
FROM branch_supplier;


--find a list of all money spent or earned by the company

SELECT employee.salary FROM employee
UNION
SELECT works_with.total_sales FROM works_with;



-- JOINS

SELECT employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch ON employee.branch_id = branch.branch_id;


-- inserting another  branch into the branch table for the exercice

INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL);


-- Find all branches and the names of their managers

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch ON employee.emp_id = branch.mgr_id;


SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch ON employee.emp_id = branch.mgr_id;



