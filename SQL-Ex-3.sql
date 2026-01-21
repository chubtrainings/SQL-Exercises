-- Exercise -3
--------------

-- 1. Determine the structure of Departments and its contents:

    DESC DEPT;
    select * from DEPT;
    
-- 2. Determine the structure of EMP table and its contents:
-- TO DISPLAY THE STRUCTURE OF EMP TABLE.
    DESC EMP; 
	
    -- To Display the contents of EMP table.
    SELECT * FROM EMP;  

-- 3. Display lastname, jobid,hiredate and Employee ID for each employee with Employee ID appearing first.
--    Provide an alias START_DATE for hire_date column.
-- HERE in this table we have ename no last name firstname for employee name so dispaly ename
-- Oracle always stores DATE in an internal format, and displays it using NLS_DATE_FORMAT, which is why you are seeing DD-MON-YYYY.
-- You must use TO_CHAR, not TO_DATE.

    DESC EMP;
    
    SELECT ENAME "EMPLOYEE NAME", JOB "DESIGNATION", TO_CHAR(HIREDATE, 'DD-MM-YYYY') "START_DATE"
    FROM EMP;
    
-- 4. Display all unique JOBs from employee table.

    SELECT DISTINCT JOB "DESIGNATION"
    FROM EMP;
    
-- 5. Name the Column Headings for EMPNO AS EMP#,ENAME AS EMPLOYEE, JOB AS DESIGNATION, 

    SELECT EMPNO "EMP#", ENAME "EMPLOYEE", JOB "DESIGNATION"
    FROM EMP;

-- 6. HR Department requests  a report of all employees and their job ids. Display the ename concatenated 
--    with job id and name the result column as Employee and Title

    SELECT ENAME||', '||JOB "Employee and Title"
    FROM EMP;

-- 7. create a query to display all the data from emp table. Separate each column with a comma Name the column
--    as the OUTPUT.

    DESC EMP;
    SELECT EMPNO||', '||ENAME||', '||JOB||', '||MGR||', '||HIREDATE||', '||SAL||', '||COMM||', '||DEPTNO "OUTPUT"
    FROM EMP;

-- 8. Because of budget issues HR department needs a report that displays Employee name and salary of employees earning 
--    more than 2,000 

    SELECT ENAME "EMPLOYEE", SAL "SALARY"
    FROM EMP
    WHERE SAL >2000;
    
-- 9. Create a report that displays ename and deptno for employee no 7369

    SELECT ENAME "Employee", DEPTNO "DEPARTMENT"
    FROM EMP
    WHERE EMPNO=7369;

-- 10. HR department wants to find employees with high salary and low salary. 
--     Display ename and salary of the employees whose salary between 5,000 to 12,000.

         SELECT ENAME "EMPLOYEE", SAL "SALARY"
         FROM EMP
         WHERE SAL BETWEEN 5000 AND 12000;
         
         
-- 11. Create a report to display ename, jobid,hiredate for employees with names start with M and T
--     order result in ascending order by hiredate.

    SELECT ENAME "EMPLOYEES",JOB AS "DESIGNATION", HIREDATE AS "HIRE DATE"
    FROM EMP
    WHERE ENAME LIKE 'M%' OR ENAME LIKE 'T%' ORDER BY HIREDATE;
    
    
-- 12. Display ename, departmentid of all employees in departments 20 and 30 in ascending alphabetical order of ename

    SELECT E.ENAME "EMPLOYEE", D.DNAME "DEPARTMENT"
    FROM EMP E
    INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
    WHERE E.DEPTNO = 20 OR E.DEPTNO=30
    ORDER BY ENAME ASC;
    
    
-- 13.List the employees ename and salary who earn between 5,000 and 12,000 and in department 20 or 50.
--    Label the columns Employee and Monthly Salary

    SELECT ENAME "EMPLOYEE", SAL "SALARY", DEPTNO "DEPT NO"
    FROM EMP
    WHERE SAL >=5000 
    AND SAL <12000 AND DEPTNO IN (10,50) ;

-- AS THERE IS LIMITED DATA TO RETRIEVE THE RESULTS CHANGED THE QUERY AS DEPTNO TO 10  
  
-- 14.GENERATE A REPORT That Displays all employees who were hired in 1981

     SELECT ENAME, TO_CHAR(HIREDATE,'YYYY') "YEAR OF HIRING"
     FROM EMP
     WHERE TO_CHAR(HIREDATE,'YYYY')=1981;
     
     -- ALTERNATE
     
     SELECT ENAME, TO_CHAR(HIREDATE,'YYYY') "YEAR OF HIRING"
     FROM EMP
     WHERE HIREDATE LIKE '%81';

-- 15. Display the ename and job of employees who do not have a manager

      SELECT ENAME, JOB 
      FROM EMP
      WHERE MGR IS NULL;
      
-- 16. Display ename, salary and commission for all employees who can earn commissions.

    SELECT ENAME "EMPLOYEE",SAL "SALARY", COMM "COMMISSION"
    FROM EMP
    WHERE COMM IS NOT NULL AND COMM <>0;
    
    DESC EMP;
    
    SELECT * FROM EMP;
    
-- 17. a report that displays ename and salary of emplaoyees who earn more that the salary which was given as input at the time of query execution

    SELECT ENAME "EMPLOYEE", SAL "SALARY"
    FROM EMP
    WHERE SAL>&SAL_AMT;
    
    
-- 18. generate a report which takes input mgr id and sorts by the input column and gives ename, salary, department for that managerid
--   SAMBLE INPUT  - 7566, ENAME
    SELECT ENAME, SAL, DEPTNO
    FROM EMP
    WHERE MGR = &mgr_id
    ORDER BY &COL;
    
-- 19. Display all employees ename in which third letter of the name is 'a'

SELECT ENAME "EMPLOYEE"
FROM EMP
WHERE substr(ename,3,1)='A';

SELECT SUBSTR(ENAME,3,1)  "THIRD LETTER OF EMP NAME"
FROM EMP;

SELECT * FROM EMP;

-- 20. Display names of all employees who have an 'A' and 'E' in their name.

    SELECT ENAME "EMPLOYEE"
    FROM EMP
    WHERE ENAME LIKE '%A%'
    AND ENAME LIKE '%E%';
    
-- 21. Display ename, job, salary of employees whose job is sales rep or clerk and salary not equal to 2,500,3,500 and 7,000

    SELECT ENAME, JOB, SAL
    FROM EMP
    WHERE JOB ='SALESMAN' OR JOB='CLERK' 
    AND (SAL!=2500 AND SAL!=3500 AND SAL!=7000);
    
    -- Alternatively
    
    SELECT ENAME, JOB, SAL
    FROM EMP 
    WHERE JOB IN ('SALESMAN','CLERK')
    AND SAL NOT IN (2500,3500,7000)
    ORDER BY JOB;
    
    SELECT JOB FROM EMP;

-- 22. List all employees whose commission is 20% of their salaries
        
    SELECT ENAME "EMPLOYEE", COMM "COMMISSION"
    FROM EMP 
    WHERE COMM= (SAL*0.20);
    
    
-- PRACTICE 8

--   SET OPERATORS

--23. List Department that do not contain the job as clerk


SELECT DEPTNO, DNAME
FROM DEPT
WHERE DEPTNO IN (
SELECT DEPTNO "DEPT"
FROM DEPT
MINUS
SELECT DEPTNO 
FROM EMP
WHERE JOB !='CLERK');

-- gives the department ids whose employees are not clerks
SELECT e.DEPTNO, d.dname
FROM EMP e
inner join dept d on e.deptno = d.deptno
WHERE e.JOB = 'CLERK';

select * from emp order by job;
select deptno,dname from dept;
    
    
-- 24. List all countries that have no departments located in them. Display the countryid and country name.
-- for this adding country table and modifying records in department table for the countries

    CREATE TABLE COUNTRY (
    COUNTRY_ID   NUMBER PRIMARY KEY,
    COUNTRY_NAME VARCHAR2(50)
);

DESC COUNTRY;

-- INSERTING SOME Sample records
INSERT INTO country VALUES (1, 'INDIA');
INSERT INTO country VALUES (2, 'USA');
INSERT INTO country VALUES (3, 'UK');
INSERT INTO country VALUES (4, 'GERMANY');
INSERT INTO country VALUES (5, 'FRANCE');

COMMIT;

-- display records

SELECT * FROM COUNTRY;

-- Modify SCOTT.DEPT table to link countries

-- Assume SCOTT DEPT table structure:

DESC dept;


-- We’ll add a country_id column: 

ALTER TABLE dept ADD country_id NUMBER;

-- Sample DEPT data mapping to countries
UPDATE dept SET country_id = 1 WHERE deptno = 10; -- INDIA
UPDATE dept SET country_id = 2 WHERE deptno = 20; -- USA
UPDATE dept SET country_id = 1 WHERE deptno = 30; -- INDIA
-- dept 40 has no country or NULL

COMMIT;
DESC DEPT;

SELECT * FROM DEPT;

-- List all countries that have no departments located in them
-- Display country_id and country_name

SELECT COUNTRY_ID, COUNTRY_NAME
FROM COUNTRY
WHERE COUNTRY_ID
MINUS
SELECT COUNTRY_ID 
ROM DEPT 
WHERE COUNTRY_ID IS NOT NULL;


-- Creating a sequence in oracle

CREATE SEQUENCE emp_id_seq1
START WITH (SELECT (MAX(EMPNO) FROM EMP).toNumber()+1
INCREMENT BY 1
MAXVALUE 1000;

-- 1. Determine the structure of Departments and its contents:
-- 1. Determine the structure of and its contents:
-- 1. Determine the structure of Departments and its contents:
-- 1. Determine the structure of and its contents:
-- 1. Determine the structure of Departments and its contents:
-- 1. Determine the structure of and its contents:
-- 1. Determine the structure of Departments and its contents:
    
