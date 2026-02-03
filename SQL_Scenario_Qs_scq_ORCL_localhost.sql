-- SQL Scenario Based Questions.

-- Create Database Tables:

CREATE TABLE scq_departments (
			department_id NUMBER PRIMARY KEY,
			name VARCHAR2(50)
		);

		CREATE TABLE scq_employees (
			employee_id NUMBER PRIMARY KEY,
			name VARCHAR2(100),
			job_title VARCHAR2(50),
			salary NUMBER(10,2),
			hire_date DATE,
			department_id NUMBER,
			department VARCHAR2(50),
			CONSTRAINT fk_scq_emp_dept
			  FOREIGN KEY (department_id)
			  REFERENCES scq_departments(department_id)
		);

		CREATE TABLE scq_customers (
			customer_id NUMBER PRIMARY KEY,
			name VARCHAR2(100),
			city VARCHAR2(50),
			total_spent NUMBER(12,2)
		);

		CREATE TABLE scq_products (
			product_id NUMBER PRIMARY KEY,
			name VARCHAR2(100),
			price NUMBER(10,2),
			stock NUMBER,
			discount NUMBER(5,2)
		);

		CREATE TABLE scq_orders (
			order_id NUMBER PRIMARY KEY,
			customer_id NUMBER,
			product_id NUMBER,
			order_date DATE,
			delivery_date DATE,
			total_amount NUMBER(12,2),
			sales NUMBER(12,2),
			CONSTRAINT fk_scq_ord_cust
			  FOREIGN KEY (customer_id)
			  REFERENCES scq_customers(customer_id),
			CONSTRAINT fk_scq_ord_prod
			  FOREIGN KEY (product_id)
			  REFERENCES scq_products(product_id)
		);

		CREATE TABLE scq_projects (
			project_id NUMBER PRIMARY KEY,
			project_name VARCHAR2(100),
			employee_id NUMBER,
			CONSTRAINT fk_scq_proj_emp
			  FOREIGN KEY (employee_id)
			  REFERENCES scq_employees(employee_id)
		);

		CREATE TABLE scq_regions (
			region_id NUMBER PRIMARY KEY,
			region_name VARCHAR2(50)
		);

		CREATE TABLE scq_sales_reps (
			rep_id NUMBER PRIMARY KEY,
			name VARCHAR2(100),
			region_id NUMBER,
			total_sales NUMBER(12,2),
			CONSTRAINT fk_scq_rep_region
			  FOREIGN KEY (region_id)
			  REFERENCES scq_regions(region_id)
		);

		CREATE TABLE scq_sales (
			sale_id NUMBER PRIMARY KEY,
			region_id NUMBER,
			rep_id NUMBER,
			order_date DATE,
			amount NUMBER(12,2),
			sales_amount NUMBER(12,2),
			CONSTRAINT fk_scq_sales_region
			  FOREIGN KEY (region_id)
			  REFERENCES scq_regions(region_id),
			CONSTRAINT fk_scq_sales_rep
			  FOREIGN KEY (rep_id)
			  REFERENCES scq_sales_reps(rep_id)
		);

		CREATE TABLE scq_transactions (
			transaction_id NUMBER PRIMARY KEY,
			customer_id NUMBER,
			amount NUMBER(12,2),
			CONSTRAINT fk_scq_tx_customer
			  FOREIGN KEY (customer_id)
			  REFERENCES scq_customers(customer_id)
		);
        
-- Check Tables Created:     
        select * from tab;
        
        
-- Insert Data:

        INSERT INTO scq_departments VALUES (1,'HR');
		INSERT INTO scq_departments VALUES (2,'IT');
		INSERT INTO scq_departments VALUES (3,'FINANCE');

		INSERT INTO scq_employees VALUES
		(1,'John Doe','Manager',90000,DATE '2021-06-01',2,'IT');
		INSERT INTO scq_employees VALUES
		(2,'Alice','HR Exec',55000,DATE '2020-03-15',1,'HR');
		INSERT INTO scq_employees VALUES
		(3,'Bob','Developer',70000,DATE '2022-01-10',2,'IT');
		INSERT INTO scq_employees VALUES
		(4,'Charlie','Accountant',45000,DATE '2019-11-20',3,'FINANCE');
		INSERT INTO scq_employees VALUES
		(5,'David','Developer',80000,DATE '2023-02-01',2,'IT');

		INSERT INTO scq_customers VALUES
		(101,'Anil','Hyderabad',150000);
		INSERT INTO scq_customers VALUES
		(102,'Arjun','Bangalore',80000);
		INSERT INTO scq_customers VALUES
		(103,'Meera','Chennai',120000);
		INSERT INTO scq_customers VALUES
		(104,'Ravi','Hyderabad',40000);

		INSERT INTO scq_products VALUES
		(201,'Laptop',60000,10,5);
		INSERT INTO scq_products VALUES
		(202,'Mouse',500,0,0);
		INSERT INTO scq_products VALUES
		(203,'Keyboard',1500,25,10);
        INSERT INTO scq_products VALUES
		(204,'Cd-drive',7000,30,5);
        

		INSERT INTO scq_orders VALUES
		(301,101,201,SYSDATE-5,NULL,60000,60000);
		INSERT INTO scq_orders VALUES
		(302,101,202,SYSDATE-15,SYSDATE-10,500,500);
		INSERT INTO scq_orders VALUES
		(303,102,203,SYSDATE-40,SYSDATE-35,1500,1500);
		INSERT INTO scq_orders VALUES
		(304,103,201,SYSDATE-2,NULL,60000,60000);
		INSERT INTO scq_orders VALUES
		(305,103,201,SYSDATE-1,NULL,60000,60000);

		INSERT INTO scq_projects VALUES
		(401,'ERP Migration',1);
		INSERT INTO scq_projects VALUES
		(402,'Payroll System',2);

		INSERT INTO scq_regions VALUES (1,'South');
		INSERT INTO scq_regions VALUES (2,'North');

		INSERT INTO scq_sales_reps VALUES
		(501,'Raj',1,150000);
		INSERT INTO scq_sales_reps VALUES
		(502,'Kiran',2,0);

		INSERT INTO scq_sales VALUES
		(601,1,501,SYSDATE-5,60000,60000);
		INSERT INTO scq_sales VALUES
		(602,1,501,SYSDATE-2,50000,50000);

		INSERT INTO scq_transactions VALUES
		(701,101,60000);
		INSERT INTO scq_transactions VALUES
		(702,103,120000);

		COMMIT;
        
-- Check existing data:

SELECT * FROM scq_CUSTOMERS;   
SELECT * FROM scq_DEPARTMENTS; 
SELECT * FROM scq_EMPLOYEES;  
SELECT * FROM scq_ORDERS;  
SELECT * FROM scq_PRODUCTS;  
SELECT * FROM scq_PROJECTS;  
SELECT * FROM scq_REGIONS;
SELECT * FROM scq_SALES;  
SELECT * FROM scq_SALES_REPS;
SELECT * FROM scq_TRANSACTIONS;  


SELECT * 
FROM scq_orders
WHERE order_date >= TRUNC(SYSDATE) - 30;


--1 Retrieve all employees with a salary greater than ₹5000

SELECT * FROM SCQ_employees WHERE salary > 5000;

--2. Find customers who placed orders in the last 30 days.

SELECT * FROM scq_orders WHERE order_date >= TRUNC(SYSDATE) - 30;

--3. Get details of products that are out of stock.
    SELECT * FROM scq_products WHERE stock = 0;

--4. Find employees hired between 2020 and 2022.
    SELECT * FROM scq_employees WHERE hire_date BETWEEN DATE '2020-01-01' AND DATE '2022-12-31';

-- 5. Retrieve all customers whose names start with ‘A’

    SELECT * FROM scq_customers WHERE name LIKE 'A%';
     

--  6. Fetch unique job titles from the employees table.

    SELECT DISTINCT job_title FROM scq_employees;

--  7. Find all records where a column value is NULL.

    SELECT * FROM scq_orders WHERE delivery_date IS NULL;

-- 8. Get details of employees whose salary is between 40,000 and 70,000.

    SELECT * FROM scq_employees WHERE salary BETWEEN 40000 AND 70000;

-- 9. Count the number of customers from each city.
    SELECT city, COUNT(*) AS customer_count FROM scq_customers GROUP BY city;

-- 10. Retrieve records where both conditions must be true.

    SELECT * FROM scq_employees WHERE department = 'HR' AND salary > 50000;

-- Il. Calculate the total sales for each product.
    SELECT product_id, SUM(sales) AS total_sales FROM scq_orders GROUP BY product_id;

-- 12. Find the highest salary in the employees table.
    SELECT MAX(salary) AS highest_salary FROM scq_employees;

-- 13. Calculate the average salary by department.
    SELECT department, AVG(salary) AS avg_salary FROM scq_employees GROUP BY department;

-- 14. Count the total number of orders placed

    SELECT COUNT (*) AS total_orders FROM scq_orders;

-- 15. Get the department with the maximum number of employees.

   SELECT department, COUNT(*) AS emp_count 
   FROM scq_employees
    GROUP BY department
      ORDER BY emp_count DESC
        FETCH FIRST 1 ROW ONLY;

-- 16. Calculate the total revenue generated by each customer.

    SELECT customer_id, SUM(amount) AS total_revenue FROM scq_transactions GROUP BY customer_id;

-- 17. Find products that have been ordered less than 100 times.

    SELECT product_id, COUNT(*) AS order_count FROM
    scq_orders GROUP BY product_id HAVING COUNT(*) < 100;

-- 18. Retrieve the earliest and latest order dates.
    SELECT MIN(order_date) AS earliest, MAX(order_date) AS latest FROM scq_orders;

-- 19. List all customers who have placed at least 5 orders.

    SELECT customer_id, count(*) FROM scq_orders GROUP BY customer_id HAVING COUNT(*) <= 5;

-- 20. Calculate the average order value.
    SELECT AVG(total_amount) AS avg_order_value FROM scq_orders;

-- 21. Calculate the average order value.
    SELECT AVG(total_amount) AS avg_order_value FROM scq_orders;

-- 22. Retrieve customer details along with their order details.

    SELECT c.*,o.* FROM scq_customers c JOIN scq_orders o ON c.customer_id = o.customer_id;

-- 23. Find employees and their department names.
    SELECT e.*, d.name AS department_name FROM scq_employees e JOIN scq_departments d ON e.department_id = d.department_id;

-- 24. Get all orders, including those without customer information.

SELECT o.*, c.name FROM scq_orders o LEFT JOIN scq_customers c ON o.customer_id = c.customer_id;


-- 25. Fetch employees who haven't been assigned a project.

 SELECT e.* FROM scq_employees e LEFT JOIN scq_projects p ON e.employee_id = p.employee_id WHERE p.employee_id IS NULL;

-- 26. List customers who have made purchases along with their cities.

    SELECT DISTINCT c.name, c.city FROM scq_customers c JOIN scq_orders o ON c.customer_id = o.customer_id;

-- 27. Get the total sales per region by joining sales and regions tables.

    SELECT r.region_name, SUM(s.amount) AS total_sales FROM scq_sales s JOIN scq_regions r ON s.region_id = r.region_id GROUP BY r.region_name;

-- 28.Fetch orders placed on weekends along with customer names.
/*
    SELECT o.*, c.name FROM scq_orders o
    JOIN scq_customers c ON o.customer_id =
    c.customer_id WHERE DAYOFWEEK(o.order_date) IN (1, 7);
    
    this works in sql server.
    
    SELECT o.*, c.name
        FROM scq_orders o
        JOIN scq_customers c
          ON o.customer_id = c.customer_id
        WHERE TO_CHAR(o.order_date, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH')
              IN ('SAT', 'SUN');
    */
    
    SELECT o.*, c.name
    FROM scq_orders o
    JOIN scq_customers c
        ON o.customer_id = c.customer_id
            WHERE TO_CHAR(o.order_date, 'DY')
                IN ('SAT', 'SUN');

-- 29. List all projects with the names of employees assigned to them.

    SELECT p.project_name, e.name FROM scq_projects p JOIN scq_employees e ON p.employee_id = e.employee_id;

-- 30. Find sales representatives who haven't made a sale.

    SELECT * FROM scq_sales_reps;

    SELECT s.* FROM scq_sales_reps sp LEFT JOIN scq_sales s ON sp.rep_id = s.rep_id WHERE s.rep_id IS NULL;  -- NO MATCHING RECORDS 

-- 31. Find employees earning more than the department average salary.

    SELECT * FROM scq_employees WHERE salary > (SELECT AVG(salary) FROM scq_employees);

--32. Get the customer who placed the highest order.
    SELECT * FROM scq_customers WHERE customer_id = (SELECT customer_id FROM scq_orders ORDER BY total_amount DESC FETCH first 1 ROW ONLY);

-- 33. List products that have never been ordered.

--    select * from scq_products;
--    select * from scq_orders;
    
    SELECT * FROM scq_products WHERE product_id NOT IN
    (SELECT product_id FROM scq_orders);

-- 34. Find employees working in the same department as ‘John Doe’.

        SELECT * FROM scq_employees WHERE department_id = (SELECT department_id FROM scq_employees WHERE name = 'John Doe');

-- 35. Get the top 3 highest-paid employees.
    SELECT * FROM scq_employees ORDER BY salary DESC FETCH FIRST 3 ROWS ONLY;

-- 36. Retrieve orders where the total amount is above the average order amount.

        SELECT * FROM scq_orders WHERE total_amount > (SELECT AVG(total_amount) FROM scq_orders);

-- 37. Fetch departments with more than 5 employees.
        SELECT department_id FROM scq_employees GROUP BY department_id HAVING COUNT(*) > 5;  -- no rows selected-- no records

-- 38. List customers who haven't placed any orders in 2023.

      SELECT *
        FROM scq_customers
        WHERE customer_id NOT IN (
            SELECT customer_id
            FROM scq_orders
            WHERE EXTRACT(YEAR FROM order_date) = 2023
        );

-- 39. Get the second-highest salary in the company.

        SELECT MAX(salary) FROM scq_employees WHERE salary < (SELECT MAX(salary) FROM employees);

-- 40. Find products that are more expensive than the average price.

    SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);

-- 41. Create a new table for archived orders.

        CREATE TABLE archived_orders1 AS SELECT * FROM
        scq_orders WHERE order_date > DATE '2022-01-01';
  
        
        select trunc('2022-01-01') from dual;

-- 42. Update salaries by 10% for employees in ‘IT’ department.
    UPDATE scq_employees SET salary = salary * 1.1 WHERE department = 'IT';

-- 43. Delete orders placed before 2020.

/*

SELECT * 
    FROM scq_orders
    WHERE order_Date BETWEEN TO_DATE('2026-01-18', 'YYYY-MM-DD') AND TO_DATE('2026-12-01', 'YYYY-MM-DD');
    
    
     SELECT * FROM scq_orders;
    
*/

    DELETE FROM scq_orders WHERE order_date < DATE '2020-01-01';

-- 44. Add a new column for discount in the products table.

    ALTER TABLE scq_products ADD disc DECIMAL(5,2);

-- 45. Find the cumulative sales amount for each region.

    SELECT region_id, SUM(sales_amount) OVER (PARTITION BY region_id) AS cumulative_sales FROM sales;

-- 46. Rank employees based on their salaries.
    SELECT name, salary, RANK() OVER (ORDER BY salary DESC) AS rank FROM scq_employees;

-- 47. Find orders with duplicate product IDs.
    SELECT product_id, COUNT(*) FROM scq_orders GROUP BY product_id HAVING COUNT(*) > 1;

-- 48. Split customers into quartiles based on their total spending.

    SELECT customer_id, NTILE(4) OVER (ORDER BY total_spent DESC) AS quartile FROM customers;

-- 49. Fetch the top-performing sales representatives by region.

        SELECT region_id, rep_id, RANK() OVER (PARTITION BY
        region_id ORDER BY total_sales DESC) AS rank FROM SCQ_sales_reps;

-- 50. Calculate the running total of sales by date.
        SELECT order_date, SUM(sales) OVER (ORDER BY order_date) AS running_total FROM scq_orders;


        