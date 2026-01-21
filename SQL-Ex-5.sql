-- SQL Exercises-3: SQL Practice with SALES Schema:
-- https://www.geeksforgeeks.org/sql/sql-exercises/ --


/*  
1. Sales Table
    The Sales table records information about product sales, 
    including the quantity sold, sale date, and total price for each sale. 
    It serves as a transactional data source for analyzing sales trends.

*/

-- Create Sales table

/*
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity_sold INT,
    sale_date DATE,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)

*/

CREATE TABLE SALES (
    SALE_ID INT PRIMARY KEY,
    PROD_ID INT,
    QTY_SOLD INT,
    SALE_DATE DATE,
    TOTAL_PRICE DECIMAL(10,2),
    FOREIGN KEY (PROD_ID) REFERENCES PRODUCTS(PROD_ID)
    );
    
 --   SHOW USER;
    -- RECD ORA-00942 AS PRODUCTS TABLE DOES NOT EXIST WHICH IS NEEDED FOR FOREIGN KEY REFERENCE.
    -- TO AVOID THIS ERROR FIRST CREATE PRODUCTS TABLE AND THEN CREATE SALES TABLE.
 /*   SELECT owner, table_name
    FROM all_tables
    WHERE table_name = 'PRODUCTS';
    
*/

-- Insert sample data into Sales table

/* Error report -
SQL Error: ORA-01861: literal does not match format string
QL Error: ORA-01843: not a valid month- FORMAT should be 01-jan-2024
DATE FORMAT ERROR: '2024-01-01'- '01-01-2024'
*/

INSERT INTO SALES (SALE_ID,PROD_ID,QTY_SOLD,SALE_DATE,TOTAL_PRICE) VALUES (1, 101, 5, '01-JAN-2024', 2500.00);

INSERT INTO SALES (SALE_ID,PROD_ID,QTY_SOLD,SALE_DATE,TOTAL_PRICE) VALUES (2, 102, 3,'02-JAN-2024', 900.00);

INSERT INTO SALES (SALE_ID,PROD_ID,QTY_SOLD,SALE_DATE,TOTAL_PRICE) VALUES (3, 103, 2, '02-JAN-2024', 60.00);

INSERT INTO SALES (SALE_ID,PROD_ID,QTY_SOLD,SALE_DATE,TOTAL_PRICE) VALUES (4, 104, 4, '03-JAN-2024', 80.00);

INSERT INTO SALES (SALE_ID,PROD_ID,QTY_SOLD,SALE_DATE,TOTAL_PRICE) VALUES (5, 105, 6, '03-JAN-2024', 90.00);
    

COMMIT;

-- 2. Products Table

/*
The Products table contains details about products, including their names, categories, and unit prices. 
It provides reference data for linking product information to sales transactions.

    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)

*/

-- Create Products table

    CREATE TABLE PRODUCTS (
        PROD_ID INT PRIMARY KEY,
        PROD_NAME VARCHAR2(100),
        CATEGORY VARCHAR2(50),
        UNIT_PRICE DECIMAL(10,2)
        );
        
    
  -- Insert sample data into Products table
  
INSERT INTO Products (prod_id, prod_name, category, unit_price) VALUES (101, 'Laptop', 'Electronics', 500.00);
INSERT INTO Products (prod_id, prod_name, category, unit_price) VALUES (102, 'Smartphone', 'Electronics', 300.00);
INSERT INTO Products (prod_id, prod_name, category, unit_price) VALUES (103, 'Headphones', 'Electronics', 30.00);
INSERT INTO Products (prod_id, prod_name, category, unit_price) VALUES (104, 'Keyboard', 'Electronics', 20.00);
INSERT INTO Products (prod_id, prod_name, category, unit_price) VALUES (105, 'Mouse', 'Electronics', 15.00);

COMMIT;

-- SQL Practice Exercises :

-- 1. Retrieve all columns from the Sales table.

    SELECT *
    FROM SALES;
    
-- 2. Retrieve the product_name and unit_price from the Products table.

    SELECT PROD_NAME "PRODUCT NAME", UNIT_PRICE "PRICE"
    FROM PRODUCTS;
    
-- 3. Retrieve the sale_id and sale_date from the Sales table.

    DESC SALES;
    
    SELECT SALE_ID "SALE ID", SALE_DATE "SALE DATE"
    FROM SALES;
    
-- 4. Filter the Sales table to show only sales with a total_price greater than ₹100.
-- ₹  - for rupee symbal use Alt+CTRL+4

    SELECT '₹' || TO_CHAR(total_price) AS "Total Amount" 
    FROM SALES
    WHERE TOTAL_PRICE > 100;

-- 5. Filter the Products table to show only products in the 'Electronics' category.

    SELECT PROD_NAME
    FROM PRODUCTS
    WHERE CATEGORY = 'Electronics';
    
    SELECT * 
    FROM PRODUCTS;
    
-- Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.

    DESC PRODUCTS;
    
    SELECT SALE_ID, TOTAL_PRICE 
    FROM SALES
    WHERE SALE_DATE = '03-JAN-2024';
    
    -- MODIFIED
    
    SELECT SALE_ID,PROD_NAME, TOTAL_PRICE 
    FROM SALES S
    JOIN PRODUCTS P ON S.PROD_ID = P.PROD_ID
    WHERE SALE_DATE = '03-JAN-2024';
    
    
-- 7. Retrieve the product_id and product_name from the Products table for products with a unit_price greater than ₹100.

    SELECT PROD_ID "PRODUCT ID",PROD_NAME "PRODUCT NAME"
    FROM PRODUCTS
    WHERE UNIT_PRICE > 100;
    
-- 8. Calculate the total revenue generated from all sales in the Sales table.

    SELECT SUM(TOTAL_PRICE) "TOTAL REVENUE"
    FROM SALES;
    
-- 9. Calculate the average unit_price of products in the Products table.

    SELECT AVG(UNIT_PRICE) "AVERAGE UNIT PRICE"
    FROM PRODUCTS;
    
-- 10. Calculate the total quantity_sold from the Sales table.

    SELECT SUM(QTY_SOLD)
    FROM SALES;
    
-- 11. Count Sales Per Day from the Sales table

    SELECT COUNT(SALE_DATE) "SALES",SALE_DATE "DATE"
    FROM SALES
    GROUP BY SALE_DATE
    ORDER BY SALE_DATE;
    
-- 12. Retrieve product_name and unit_price from the Products table with the Highest Unit Price
/*
ORA-00933: SQL command not properly ended
This error happens because Oracle does NOT support LIMIT (that’s MySQL / PostgreSQL syntax).

In Oracle, you must use FETCH FIRST or ROWNUM, depending on version.


    SELECT  UNIT_PRICE
    FROM PRODUCTS
    ORDER BY UNIT_PRICE DESC
    LIMIT 1;
    */

-- 1ST WAY
  SELECT unit_price
FROM (
    SELECT unit_price
    FROM products
    ORDER BY unit_price DESC
)
WHERE ROWNUM = 1;

--modified:
SELECT prod_id, unit_price
FROM (
    SELECT prod_id, unit_price
    FROM products
    ORDER BY unit_price DESC
)
WHERE ROWNUM = 1;

-- 2nd WAY
SELECT prod_id, unit_price
FROM products
ORDER BY unit_price DESC
FETCH FIRST 1 ROW ONLY;


-- 13. Retrieve the sale_id, product_id, and total_price from the Sales table for sales with a quantity_sold greater than 4.

    SELECT SALE_ID,PROD_ID,TOTAL_PRICE
    FROM SALES
    WHERE QTY_SOLD >4;
    
    SELECT * 
    FROM SALES;
    
-- 14. Retrieve the product_name and unit_price from the Products table, ordering the results by unit_price in descending order.

    SELECT PROD_NAME "PRODUCT",UNIT_PRICE "PRICE"
    FROM PRODUCTS
    ORDER BY UNIT_PRICE DESC;
    
--15. Retrieve the total_price of all sales, rounding the values to two decimal places.

    SELECT ROUND(SUM(TOTAL_PRICE),2)
    FROM SALES;
    
    SELECT SUM(TOTAL_PRICE) 
    FROM SALES;
    
--    16. Calculate the average total_price of sales in the Sales table.

    SELECT AVG(TOTAL_PRICE)
    FROM SALES;
    
-- 17. Retrieve the sale_id and sale_date from the Sales table, formatting the sale_date as 'YYYY-MM-DD'.

    SELECT SALE_ID, TO_CHAR(SALE_DATE,'YYYY-MM-DD')
    FROM SALES;
    
--    SELECT sale_id, DATE_FORMAT(sale_date, '%Y-%m-%d') AS formatted_date FROM Sales; doesn't work in oracle

-- 18. Calculate the total revenue generated from sales of products in the 'Electronics' category.

    SELECT SUM(S.TOTAL_PRICE) "REVENUE"
    FROM PRODUCTS P
    JOIN SALES S ON P.PROD_ID = S.PROD_ID
    WHERE P.CATEGORY = 'Electronics';
    
     
-- 19. Retrieve the product_name and unit_price from the Products table, filtering the unit_price to show only values between ₹20 and ₹600.

    SELECT PROD_NAME, UNIT_PRICE
    FROM PRODUCTS
    WHERE UNIT_PRICE BETWEEN 20 AND 600;
    
-- 20. Retrieve the product_name and category from the Products table, ordering the results by category in ascending order.

    SELECT PROD_NAME,CATEGORY
    FROM PRODUCTS
    ORDER BY CATEGORY;
    
-- SQL Practice Exercises for Intermediate

-- 1. Calculate the total quantity_sold of products in the 'Electronics' category.

    SELECT SUM(QTY_SOLD) "QTY SOLD"
    FROM PRODUCTS P
    JOIN SALES S ON P.PROD_ID = S.PROD_ID    
    WHERE P.CATEGORY = 'Electronics';
    
-- 2. Retrieve the product_name and total_price from the Sales table, calculating the total_price as quantity_sold multiplied by unit_price.

    SELECT P.PROD_NAME "PRODUCT", S.QTY_SOLD*P.UNIT_PRICE "TOTAL PRICE"
    FROM SALES S
    JOIN PRODUCTS P ON P.PROD_ID=S.PROD_ID;
    
-- 3. Identify the Most Frequently Sold Product from Sales table

    SELECT PROD_ID, COUNT(*)
    FROM SALES
    GROUP BY PROD_ID
    ORDER BY PROD_ID
    FETCH FIRST 1 ROW ONLY;
    
-- 4. Find the Products Not Sold from Products table

    SELECT PROD_ID,PROD_NAME
    FROM PRODUCTS
    WHERE PROD_ID NOT IN (SELECT PROD_ID FROM SALES);
    
-- 5. Calculate the total revenue generated from sales for each product category.

    SELECT SUM(TOTAL_PRICE) "REVENUE",CATEGORY
    FROM PRODUCTS P
    JOIN SALES S ON P.PROD_ID=S.PROD_ID
    GROUP BY CATEGORY;
    
-- 6. Find the product category with the highest average unit price.
--  FETCH FIRST 1 ROW ONLY; here in this table we only have electronics as the category.

    SELECT CATEGORY,AVG(UNIT_PRICE)
    FROM PRODUCTS
    GROUP BY CATEGORY
    ORDER BY AVG(UNIT_PRICE) DESC
     FETCH FIRST 1 ROW ONLY;
     
     
-- 7. Identify products with total sales exceeding 30.  

   
    SELECT p.prod_name
    FROM Sales s
    JOIN Products p ON s.prod_id = p.prod_id
    GROUP BY p.prod_name
    HAVING SUM(s.total_price) > 30;
    
-- 8. Count the number of sales made in each month.

    SELECT TO_CHAR(SALE_DATE,'MON') FROM SALES;
    
    SELECT COUNT(*)
    FROM SALES
    GROUP BY TO_CHAR(SALE_DATE,'MON');
    
-- 9. Retrieve Sales Details for Products with 'Smart' in Their Name

    SELECT *
    FROM SALES S
    JOIN PRODUCTS P ON P.PROD_ID=S.PROD_ID
    WHERE P.PROD_NAME LIKE 'Smart%';
    
    SELECT P.PROD_ID,P.PROD_NAME,S.TOTAL_PRICE
    FROM SALES S
    LEFT JOIN PRODUCTS P ON P.PROD_ID=S.PROD_ID
    WHERE P.PROD_NAME LIKE 'Smart%';
    
-- 10. Determine the average quantity sold for products with a unit price greater than ₹100.


     SELECT AVG(QTY_SOLD)
     FROM SALES S
     JOIN PRODUCTS P ON P.PROD_ID=S.PROD_ID
     WHERE P.UNIT_PRICE > 100;
     
-- 11. Retrieve the product name and total sales revenue for each product.

    SELECT P.PROD_NAME, SUM(S.TOTAL_PRICE) "TOTAL REVENUE"
    FROM SALES S
    JOIN PRODUCTS P ON P.PROD_ID=S.PROD_ID
    GROUP BY P.PROD_NAME;
    
--  12. List all sales along with the corresponding product names.

    SELECT P.PROD_NAME,P.PROD_ID,S.SALE_ID,QTY_SOLD,SALE_DATE,TOTAL_PRICE,CATEGORY,UNIT_PRICE
    FROM SALES S
    LEFT JOIN PRODUCTS P ON P.PROD_ID=S.PROD_ID;
    
-- 13. Retrieve the product name and total sales revenue for each product.

    SELECT PROD_NAME "PRODUCT", SUM(TOTAL_PRICE) "TOTAL PRICE",(SUM(s.total_price) / (SELECT SUM(total_price) FROM Sales)) * 100 AS revenue_percentage
    FROM SALES S
    JOIN PRODUCTS P ON P.PROD_ID=S.PROD_ID
    GROUP BY PROD_NAME;
    
-- 14. Rank products based on total sales revenue.


    SELECT p.prod_name, SUM(s.total_price) AS total_revenue,
       RANK() OVER (ORDER BY SUM(s.total_price) DESC) AS revenue_rank
    FROM Sales s
    JOIN Products p ON s.prod_id = p.prod_id
    GROUP BY p.prod_name;
    
-- 15. Calculate the running total revenue for each product category.**
-- running total- add total-price and previous total.




    SELECT CATEGORY, SUM(S.TOTAL_PRICE) AS "REVENUE"
    FROM SALES S
    JOIN PRODUCTS P ON S.PROD_ID=P.PROD_ID
    GROUP BY CATEGORY;
    
    SELECT p.category, p.prod_name, s.sale_date, s.total_price,
       SUM(s.total_price) OVER (PARTITION BY p.category ORDER BY s.sale_date) AS running_total_revenue
    FROM Sales s
    JOIN Products p ON s.prod_id = p.prod_id;
    
-- 16. Categorize sales as "High", "Medium", or "Low" based on total price (e.g., > ₹200 is High, ₹100-₹200 is Medium, < ₹100 is Low).
    
    SELECT SALE_ID,
        CASE
            WHEN TOTAL_PRICE>200 THEN 'HIGH'
            WHEN TOTAL_PRICE>100 AND TOTAL_PRICE<200 THEN 'MEDIUM' 
            WHEN TOTAL_PRICE<200 THEN 'LOW'   
        END AS SALE_CATEGORY
    FROM SALES;
  -- OTHER WAY  
    SELECT sale_id, 
       CASE 
           WHEN total_price > 200 THEN 'High'
           WHEN total_price BETWEEN 100 AND 200 THEN 'Medium'
           ELSE 'Low'
       END AS sales_category
FROM Sales;

-- 17. Identify sales where the quantity sold is greater than the average quantity sold.

    SELECT SALE_ID
    FROM SALES
    WHERE QTY_SOLD>(SELECT AVG(QTY_SOLD) FROM SALES);
    
-- 18. Extract the month and year from the sale date and count the number of sales for each month.

    SELECT COUNT(*) "NUMBER OF SALES", TO_CHAR(SALE_DATE,'MON') "MONTH",TO_CHAR(SALE_DATE,'YYYY') "YEAR"
    FROM SALES
    GROUP BY SALE_DATE;
    


-- Oracle Date,Time,TimeStamp functions:
    SELECT current_date, SYSDATE
    FROM DUAL;
    
    SELECT CURRENT_TIMESTAMP FROM DUAL;
    
-- To check the current default date format in your Oracle SQL session
    
    SELECT VALUE FROM NLS_SESSION_PARAMETERS WHERE PARAMETER = 'NLS_DATE_FORMAT';
    
    SELECT TO_DATE('18-SEP-25', 'DD-MON-RR') FROM dual;
    
    /*
    
        It’s a special Oracle-specific year format
            Use YYYY instead in modern systems
            
            What RR actually means
        
                RR is simply an Oracle date format model
                
                It represents a 2-digit year with rolling century logic
                
                Oracle introduced it to handle Y2K and legacy date input
                
                So:
                
                ❌ It does not stand for Relative Year, Rolling Range, Round Robin, etc.
                
                ✅ It is just called “RR date format”
                
                Oracle documentation refers to it as:
                
                RR — Two-digit year (rolling century)
    
    */
   
    /*
    
    Change for Current Session (Most Common):
        ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
        SELECT SYSDATE FROM dual;
    Change for Specific User (Persistent):
       -- Applies whenever that user logs in
       -- Requires ALTER USER privilege
       
       ALTER USER aks SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
       -- Takes effect on next login this Requires database restart:
            SHUTDOWN IMMEDIATE;
            STARTUP;

       Check Current NLS_DATE_FORMAT:
       Session level:
        SELECT value
        FROM nls_session_parameters
        WHERE parameter = 'NLS_DATE_FORMAT';
      Database level:
        SELECT value
        FROM nls_database_parameters
        WHERE parameter = 'NLS_DATE_FORMAT';
        
    Best Practice (Very Important):
    --> Do NOT rely on NLS_DATE_FORMAT in queries
    --> Always use explicit format models
            SELECT TO_DATE('2026-01-08', 'YYYY-MM-DD') FROM dual;
            SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM dual;
    Why relying on NLS is dangerous:
    --> Different users → different formats
    --> Breaks apps when moved environments
    --> Causes ORA-01843 / ORA-01861 errors
    
    | Level   | Command         | Scope                |
    | ------- | --------------- | -------------------- |
    | Session | `ALTER SESSION` | Current session only |
    | User    | `ALTER USER`    | Persistent for user  |
    | System  | `ALTER SYSTEM`  | Whole database       |

Most Used in Real Projects

    ✔ SYSDATE
    ✔ ADD_MONTHS
    ✔ LAST_DAY
    ✔ TO_CHAR / TO_DATE
    ✔ TRUNC(date)
    ✔ EXTRACT
    
    */
    
    
-- 19. Calculate the number of days between the current date and the sale date for each sale.  

    SELECT SYSDATE-SALE_DATE "NO. OF DAYS"
    FROM SALES;

-- WITH TRUNC FUNCTION

    SELECT TRUNC(SYSDATE-SALE_DATE) "NO. OF DAYS"
    FROM SALES;

-- WITH ROUND FUNCTION
    SELECT ROUND(SYSDATE-SALE_DATE) "NO. OF DAYS"
    FROM SALES;
-- WITH FLOOR FUNCTION  
    SELECT FLOOR(SYSDATE - sale_date) AS no_of_days
    FROM sales;
    
-- Show exact days, hours, minutes
    SELECT
    TRUNC(SYSDATE - sale_date) AS days,
    TRUNC(MOD((SYSDATE - sale_date) * 24, 24)) AS hours,
    TRUNC(MOD((SYSDATE - sale_date) * 24 * 60, 60)) AS minutes,
    TRUNC(MOD((SYSDATE - sale_date) * 24 * 60*60, 60)) AS seconds
    FROM sales;
    
/*
        | Requirement      | Query                               |
        | ---------------- | ----------------------------------- |
        | Exact difference | `SYSDATE - sale_date`               |
        | Whole days       | `TRUNC(SYSDATE) - TRUNC(sale_date)` |
        | Rounded          | `ROUND(...)`                        |
        | Always down      | `FLOOR(...)`                        |


*/


--20. Identify sales made during weekdays versus weekends.


    SELECT sale_id,
       CASE
           WHEN TRIM(TO_CHAR(sale_date, 'DAY')) IN ('SATURDAY', 'SUNDAY')
           THEN 'WEEKEND'
           ELSE 'WEEKDAY'
       END AS day_type
    FROM sales;
    
    
-- Best & Safest Method (Recommended)
-- Use ISO day number (ID):


    SELECT sale_id,
       CASE
           WHEN TO_CHAR(sale_date, 'ID') IN ('6','7') THEN 'WEEKEND'
           ELSE 'WEEKDAY'
       END AS day_type
    FROM sales;
    
-- SQL Practice Exercises for Advanced: 


    
    
    


  
    
    

    
    

    
    
    
