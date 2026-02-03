--SQL Scenario Based Questions

-- ---------------------------------
    Database:
-- ------------------------------
-- create schema

--Step 1: Create the SCQS schema (user)

        CREATE USER scqs IDENTIFIED BY scqs
        DEFAULT TABLESPACE users
        TEMPORARY TABLESPACE temp
        QUOTA UNLIMITED ON users;
        
        GRANT CONNECT, RESOURCE TO scqs;

-- Step 2: Connect as SCQS
    
    CONNECT scqs/scqs;
    
-- Step 3: Create tables (ALL prefixed with SCQS_)

    

-- ------------------------------------
-- SCQS_DEPARTMENTS
CREATE TABLE scqs_departments (
    department_id NUMBER PRIMARY KEY,
    name          VARCHAR2(50)
);
--SCQS_EMPLOYEES
CREATE TABLE scqs_employees (
    employee_id   NUMBER PRIMARY KEY,
    name          VARCHAR2(100),
    job_title     VARCHAR2(50),
    salary        NUMBER(10,2),
    hire_date     DATE,
    department_id NUMBER,
    department    VARCHAR2(50),
    CONSTRAINT fk_scqs_emp_dept
        FOREIGN KEY (department_id)
        REFERENCES scqs_departments(department_id)
);

--SCQS_CUSTOMERS
CREATE TABLE scqs_customers (
    customer_id NUMBER PRIMARY KEY,
    name        VARCHAR2(100),
    city        VARCHAR2(50),
    total_spent NUMBER(12,2)
);

--SCQS_PRODUCTS
CREATE TABLE scqs_products (
    product_id NUMBER PRIMARY KEY,
    name       VARCHAR2(100),
    price      NUMBER(10,2),
    stock      NUMBER,
    discount   NUMBER(5,2)
);
--SCQS_ORDERS

CREATE TABLE scqs_orders (
    order_id      NUMBER PRIMARY KEY,
    customer_id   NUMBER,
    product_id    NUMBER,
    order_date    DATE,
    delivery_date DATE,
    total_amount  NUMBER(12,2),
    sales         NUMBER(12,2),
    CONSTRAINT fk_scqs_ord_cust
        FOREIGN KEY (customer_id)
        REFERENCES scqs_customers(customer_id),
    CONSTRAINT fk_scqs_ord_prod
        FOREIGN KEY (product_id)
        REFERENCES scqs_products(product_id)
);

--SCQS_PROJECTS
CREATE TABLE scqs_projects (
    project_id   NUMBER PRIMARY KEY,
    project_name VARCHAR2(100),
    employee_id  NUMBER,
    CONSTRAINT fk_scqs_proj_emp
        FOREIGN KEY (employee_id)
        REFERENCES scqs_employees(employee_id)
);

--SCQS_REGIONS
CREATE TABLE scqs_regions (
    region_id   NUMBER PRIMARY KEY,
    region_name VARCHAR2(50)
);

--SCQS_SALES_REPS
CREATE TABLE scqs_sales_reps (
    rep_id      NUMBER PRIMARY KEY,
    name        VARCHAR2(100),
    region_id   NUMBER,
    total_sales NUMBER(12,2),
    CONSTRAINT fk_scqs_rep_region
        FOREIGN KEY (region_id)
        REFERENCES scqs_regions(region_id)
);

--SCQS_SALES
CREATE TABLE scqs_sales (
    sale_id      NUMBER PRIMARY KEY,
    region_id    NUMBER,
    rep_id       NUMBER,
    order_date   DATE,
    amount       NUMBER(12,2),
    sales_amount NUMBER(12,2),
    CONSTRAINT fk_scqs_sales_region
        FOREIGN KEY (region_id)
        REFERENCES scqs_regions(region_id),
    CONSTRAINT fk_scqs_sales_rep
        FOREIGN KEY (rep_id)
        REFERENCES scqs_sales_reps(rep_id)
);

CREATE TABLE scqs_sales (
    sale_id      NUMBER PRIMARY KEY,
    region_id    NUMBER,
    rep_id       NUMBER,
    order_date   DATE,
    amount       NUMBER(12,2),
    sales_amount NUMBER(12,2),
    CONSTRAINT fk_scqs_sales_region
        FOREIGN KEY (region_id)
        REFERENCES scqs_regions(region_id),
    CONSTRAINT fk_scqs_sales_rep
        FOREIGN KEY (rep_id)
        REFERENCES scqs_sales_reps(rep_id)
);

--SCQS_TRANSACTIONS
CREATE TABLE scqs_transactions (
    transaction_id NUMBER PRIMARY KEY,
    customer_id    NUMBER,
    amount         NUMBER(12,2),
    CONSTRAINT fk_scqs_tx_customer
        FOREIGN KEY (customer_id)
        REFERENCES scqs_customers(customer_id)
);

-- To Query:

--SELECT * FROM scqs_employees;
--SELECT * FROM scqs_orders;
--SELECT * FROM scqs_customers;
-- SELECT * FROM scqs.scqs_orders;



---------------------------------------


--1 Retrieve all employees with a salary greater than ₹5000

SELECT * FROM employees WHERE salary > 5000;

--2. Find customers who placed orders in the last 30 days.

SELECT * FROM orders WHERE order_date >= currentdate() - 30;

3. Get details of products that are out of stock.
SELECT * FROM products WHERE stock = 0;

4. Find employees hired between 2020 and 2022.
SELECT * FROM employees WHERE hire_date BETWEEN
2020-01-01 AND '2022-12-31;

5. Retrieve all customers whose names start with ‘A’.
SELECT * FROM customers WHERE name LIKE 'A%’;

6. Fetch unique job titles from the employees table.
SELECT DISTINCT job_title FROM employees;

7. Find all records where a column value is NULL.
SELECT * FROM orders WHERE delivery_date IS NULL;

8. Get details of employees whose salary is between
40,000 and 70,000.

SELECT * FROM employees WHERE salary BETWEEN
40000 AND 70000;

9. Count the number of customers from each city.
SELECT city, COUNT(*) AS customer_count FROM
customers GROUP BY city;

10. Retrieve records where both conditions must be
true.

SELECT * FROM employees WHERE department = ‘HR’
AND salary > 50000;

Il. Calculate the total sales for each product.
SELECT product_id, SUM(sales) AS total_sales FROM
orders GROUP BY product_id;

12. Find the highest salary in the employees table.
SELECT MAX(salary) AS highest_salary FROM
employees;

13. Calculate the average salary by department.
SELECT department, AVG(salary) AS avg_salary FROM
employees GROUP BY department;

14. Count the total number of orders placed

SELECT COUNT (*) AS total_orders FROM orders;

15. Get the department with the maximum number of
employees.

SELECT department, COUNT(*) AS emp_count FROM
employees GROUP BY department ORDER BY
emp_count DESC LIMIT 1;

16. Calculate the total revenue generated by each
customer.

SELECT customer_id, SUM(amount) AS total_revenue
FROM transactions GROUP BY customer _id;

17. Find products that have been ordered more than
100 times.

SELECT product_id, COUNT(*) AS order_count FROM
orders GROUP BY product_id HAVING COUNT(*) > 100;

18. Retrieve the earliest and latest order dates.
SELECT MIN(order_date) AS earliest, MAX(order_date)
AS latest FROM orders;

19. List all customers who have placed at least 5
orders.

SELECT customer_id FROM orders GROUP BY
customer_id HAVING COUNT(*) >= 5;

20. Calculate the average order value.
SELECT AVG(total_amount) AS avg_order_value FROM
orders;

21. Calculate the average order value.
SELECT AVG(total_amount) AS avg_order_value FROM
orders;

22. Retrieve customer details along with their order
details.

SELECT customers.*, orders.* FROM customers

JOIN orders ON customers.customer_id =
orders.customer_id;

23. Find employees and their department names.
SELECT employees.*, departments.name AS
department_name FROM employees

JOIN departments ON employees.department_id =
departments.department_id;

24. Get all orders, including those without customer
information.

SELECT orders.*, customers.name FROM orders
LEFT JOIN customers ON orders.customer_id =
customers.customer_id;


25. Fetch employees who haven't been assigned a
project.

SELECT employees.* FROM employees

LEFT JOIN projects ON employees.employee_id =
projects.employee_id

WHERE projects.employee _id IS NULL;

26. List customers who have made purchases along
with their cities.

SELECT DISTINCT customers.name, customers.city
FROM customers

JOIN orders ON customers.customer_id =
orders.customer_id;

27. Get the total sales per region by joining sales and
regions tables.

SELECT regions.region_name, SUM(sales.amount) AS
total_sales FROM sales

JOIN regions ON sales.region_id = regions.region_id
GROUP BY regions.region_name;

28.Fetch orders placed on weekends along with
customer names.

SELECT orders.*, customers.name FROM orders
JOIN customers ON orders.customer_id =
customers.customer_id WHERE
DAYOFWEEK(orders.order_date) IN (1, 7);

29. List all projects with the names of employees
assigned to them.

SELECT projects.project_name, employees.name FROM
projects

JOIN employees ON projects.employee_id =
employees.employee_id;

30. Find sales representatives who haven't made a
sale.

SELECT sales_reps.* FROM sales_reps

LEFT JOIN sales ON sales_reps.rep_id = sales.rep_id
WHERE sales.rep_id IS NULL;

31. Find employees earning more than the
department average salary.

SELECT * FROM employees WHERE salary > (SELECT
AVG(salary) FROM employees);

32. Get the customer who placed the highest order.
SELECT * FROM customers WHERE customer_id =
(SELECT customer_id FROM orders ORDER BY
total_amount DESC LIMIT 1);

33. List products that have never been ordered.
SELECT * FROM products WHERE product_id NOT IN
(SELECT product_id FROM orders);

34. Find employees working in the same department
as ‘John Doe’.

SELECT * FROM employees WHERE department_id =
(SELECT department_id FROM employees WHERE
name = ‘John Doe’);

35. Get the top 3 highest-paid employees.
SELECT * FROM employees ORDER BY salary DESC LIMIT
3;

36. Retrieve orders where the total amount is above
the average order amount.

SELECT * FROM orders WHERE total_amount > (SELECT
AVG(total_amount) FROM orders);

37. Fetch departments with more than 5 employees.
SELECT department_id FROM employees GROUP BY
department_id HAVING COUNT(*) > 5;

38. List customers who haven't placed any orders in
2023.

SELECT * FROM customers WHERE customer_id NOT IN
(SELECT customer_id FROM orders WHERE
YEAR(order_date) = 2023);

39. Get the second-highest salary in the company.
SELECT MAX(salary) FROM employees WHERE salary <
(SELECT MAX(salary) FROM employees);

40. Find products that are more expensive than the
average price.

SELECT * FROM products WHERE price > (SELECT
AVG(price) FROM products);

41. Create a new table for archived orders.
CREATE TABLE archived_orders AS SELECT * FROM
orders WHERE order_date < ‘2022-01-01;

42. Update salaries by 10% for employees in ‘IT’
department.

UPDATE employees SET salary = salary * 1.1 WHERE
department = 'IT;

43. Delete orders placed before 2020.
DELETE FROM orders WHERE order_date < ‘2020-01-01;

44. Add a new column for discount in the products
table.

ALTER TABLE products ADD COLUMN discount DECIMAL(5,
2);

45. Find the cumulative sales amount for each region.

SELECT region_id, SUM(sales_amount) OVER (PARTITION
BY region_id) AS cumulative_sales FROM sales;

46. Rank employees based on their salaries.
SELECT name, salary, RANK() OVER (ORDER BY salary
DESC) AS rank FROM employees;

47. Find orders with duplicate product IDs.
SELECT product_id, COUNT(*) FROM orders GROUP BY
product_id HAVING COUNT(*) > 1;

48. Split customers into quartiles based on their total
spending.

SELECT customer_id, NTILE(4) OVER (ORDER BY
total_spent DESC) AS quartile FROM customers;

49. Fetch the top-performing sales representatives
by region.

SELECT region_id, rep_id, RANK() OVER (PARTITION BY
region_id ORDER BY total_sales DESC) AS rank FROM
sales_reps;

50. Calculate the running total of sales by date.
SELECT order_date, SUM(sales) OVER (ORDER BY
order_date) AS running_total FROM orders;




