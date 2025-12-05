-- SQL Basics Assignment (Questions + Direct SQL Answers)
-- No explanations
-- No alternatives

/*
Q1. Create a New Database and Table for Employees
*/
CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

/*
Q2. Insert Data into Employees Table
*/
INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date) VALUES
(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(102, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
(103, 'Raj', 'Mehta', 'IT', 90000, '2018-07-11'),
(104, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
(105, 'Arjun', 'Singh', 'Finance', 60000, '2022-02-10');

/*
Q3. Display All Employee Records Sorted by Salary (Lowest to Highest)
*/
SELECT * FROM employees
ORDER BY salary ASC;

/*
Q4. Show Employees Sorted by Department (A–Z) and Salary (High → Low)
*/
SELECT * FROM employees
ORDER BY department ASC, salary DESC;

/*
Q5. List All Employees in the IT Department, Ordered by Hire Date (Newest First)
*/
SELECT * FROM employees
WHERE department = 'IT'
ORDER BY hire_date DESC;

/*
Q6. Create and Populate a Sales Table
*/
CREATE TABLE sales (
    sale_id INT,
    customer_name VARCHAR(50),
    amount INT,
    sale_date DATE
);

INSERT INTO sales (sale_id, customer_name, amount, sale_date) VALUES
(1, 'Aditi', 1500, '2024-08-01'),
(2, 'Rohan', 2200, '2024-08-03'),
(3, 'Aditi', 3500, '2024-09-05'),
(4, 'Meena', 2700, '2024-09-15'),
(5, 'Rohan', 4500, '2024-09-25');

/*
Q7. Display All Sales Records Sorted by Amount (Highest → Lowest)
*/
SELECT * FROM sales
ORDER BY amount DESC;

/*
Q8. Show All Sales Made by Customer “Aditi”
*/
SELECT * FROM sales
WHERE customer_name = 'Aditi';

/*
Q9. What is the Difference Between a Primary Key and a Foreign Key?
*/
The primary key and foreign key are fundamental concepts in relational databases, serving distinct but related purposes in maintaining data integrity and establishing relationships between tables.
Primary Key:
•	Uniquely identifies rows: A primary key is a column or a set of columns that uniquely identifies each row in a table. No two rows in the table can have the same primary key value.
•	Ensures data integrity: It guarantees that each record can be uniquely identified and retrieved, preventing duplicate entries and ensuring data consistency within a single table.
•	Cannot be NULL: A primary key column cannot contain NULL values, as it must always have a value to uniquely identify a row.
•	One per table: A table can have only one primary key, although it can be composed of multiple columns (a composite primary key). 
Foreign Key:
•	Establishes relationships between tables: A foreign key is a column or a set of columns in one table (the "child" table) that refers to the primary key of another table (the "parent" or "referenced" table).
•	Enforces referential integrity: It ensures that the values in the foreign key column of the child table correspond to existing values in the primary key of the parent table. This prevents "orphan" records where a child record references a non-existent parent record.
•	Can accept NULL values: Unlike primary keys, foreign keys can accept NULL values, unless specifically restricted. This indicates that the relationship to the parent table is optional or not yet established.
•	Multiple per table: A table can have multiple foreign keys, each referencing a different parent table or even the same parent table multiple times. 
In essence:
•	A primary key focuses on the uniqueness and identification of records within a single table.
•	A foreign key focuses on establishing and enforcing relationships between two tables, ensuring that data across tables remains consistent and valid.
Example:
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

/*
Q10. What Are Constraints in SQL and Why Are They Used?
*/
Constraints in SQL are rules that are enforced on the data columns of a table. They are used to limit the type of data that can be entered into a table, ensuring the accuracy, integrity, and reliability of the data stored in the database. If any operation, such as an insert, update, or delete, violates a defined constraint, the operation will be aborted.
Constraints are used to:
•	Maintain Data Integrity: They prevent invalid or inconsistent data from being entered into the database, ensuring the data remains accurate and reliable.
•	Enforce Business Rules: Constraints can be used to implement specific business rules, like ensuring that a product ID is always unique or that a customer's age is within a valid range.
•	Establish Relationships Between Tables: Constraints like FOREIGN KEY are crucial for defining and maintaining relationships between different tables in a relational database, preventing orphaned records.
•	Improve Data Quality: By restricting the type and range of data allowed, constraints contribute to higher data quality, making the data more useful and dependable.
Common Types of SQL Constraints:
•	NOT NULL: Ensures that a column cannot store NULL values.
•	UNIQUE: Ensures that all values in a column are different.
•	PRIMARY KEY: A combination of NOT NULL and UNIQUE, uniquely identifying each row in a table.
•	FOREIGN KEY: Establishes a link between two tables, ensuring referential integrity.
•	CHECK: Ensures that all values in a column satisfy a specific condition.
•	DEFAULT: Provides a default value for a column when no value is specified during an INSERT operation.


-- END OF FILE