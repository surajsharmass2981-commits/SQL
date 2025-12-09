Assignment on SubQueries.

Basic Level

Q1. Retrieve the names of employees who earn more than the average salary of all employees.

SELECT name
FROM Employee
WHERE salary > (
    SELECT AVG(salary) FROM Employee
);



Q2. Find the employees who belong to the department with the highest average salary.

SELECT E.name
FROM Employee E
WHERE E.department_id = (
    SELECT department_id
    FROM Employee
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
);



Q3.List all employees who have made at least one sale.

SELECT DISTINCT E.name
FROM Employee E
WHERE E.emp_id IN (
    SELECT emp_id FROM Sales
);



Q4.Find the employee with the highest sale amount.

SELECT E.name
FROM Employee E
WHERE E.emp_id = (
    SELECT emp_id
    FROM Sales
    ORDER BY sale_amount DESC
    LIMIT 1
);


Q5.Retrieve the names of employees whose salaries are higher than Shubham's salary.

SELECT name
FROM Employee
WHERE salary > (
    SELECT salary FROM Employee WHERE name = 'Shubham'
);



Intermediate Level

Q1. Find employees who work in the same department as Abhishek.

SELECT name
FROM Employee
WHERE department_id = (
    SELECT department_id FROM Employee WHERE name = 'Abhishek'
)
AND name != 'Abhishek';



Q2. List departments that have at least one employee earning more than 60,000.

SELECT department_name
FROM Department
WHERE department_id IN (
    SELECT DISTINCT department_id
    FROM Employee
    WHERE salary > 60000
);



Q3. Find the department name of the employee who made the highest sale.

SELECT D.department_name
FROM Department D
WHERE D.department_id = (
    SELECT E.department_id
    FROM Employee E
    WHERE E.emp_id = (
        SELECT emp_id FROM Sales ORDER BY sale_amount DESC LIMIT 1
    )
);



Q4. Retrieve employees who have made sales greater than the average sale amount.

SELECT DISTINCT E.name
FROM Employee E
JOIN Sales S ON E.emp_id = S.emp_id
WHERE S.sale_amount > (
    SELECT AVG(sale_amount) FROM Sales
);



Q5. Find the total sales made by employees who earn more than the average salary.

SELECT SUM(S.sale_amount) AS total_sales
FROM Sales S
WHERE S.emp_id IN (
    SELECT emp_id
    FROM Employee
    WHERE salary > (
        SELECT AVG(salary) FROM Employee
    )
);



Advanced Level

Q1. Find employees who have not made any sales.

SELECT E.name
FROM Employee E
LEFT JOIN Sales S ON E.emp_id = S.emp_id
WHERE S.emp_id IS NULL;



Q2. List departments where the average salary is above ₹55,000.

SELECT D.department_name
FROM Department D
WHERE D.department_id IN (
    SELECT department_id
    FROM Employee
    GROUP BY department_id
    HAVING AVG(salary) > 55000
);



Q3. Retrieve department names where the total sales exceed ₹10,000.

SELECT D.department_name
FROM Department D
WHERE D.department_id IN (
    SELECT E.department_id
    FROM Employee E
    JOIN Sales S ON E.emp_id = S.emp_id
    GROUP BY E.department_id
    HAVING SUM(S.sale_amount) > 10000
);



Q4. Find the employee who has made the second-highest sale.

SELECT E.name
FROM Employee E
WHERE E.emp_id = (
    SELECT emp_id
    FROM Sales
    ORDER BY sale_amount DESC
    LIMIT 1 OFFSET 1
);



Q5. Retrieve the names of employees whose salary is greater than the highest sale amount recorded.

SELECT name
FROM Employee
WHERE salary > (
    SELECT MAX(sale_amount) FROM Sales
);
