-- SQL-Ex-1:
-- ======

  --Give the following queries in SQL: (based on table emp)
------------------------------------------------------------------
--1.  List the employees whose salary is greater than 2800.

    SELECT ENAME,SAL 
    FROM EMP 
    WHERE SAL>2800;

--2.  List the employees working on department 10 or 20.
    SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO=10 OR DEPTNO =20;
    
--3.  List the employees whose commission is greater than 600.
    SELECT ENAME EMPNAME,SAL SALARY 
    FROM EMP 
    WHERE COMM >600;
    
--4.  List the employees whose commission is NOT greater than 600.
    SELECT ENAME EMPLOYEE, SAL SALARY 
    FROM EMP 
    WHERE COMM <600;
    
--5.  List the employees whose commission is not known (that is NULL).  **
    SELECT ENAME, SAL,COMM 
    FROM EMP 
    WHERE COMM IS NULL;
    
--6.  List the jobs of the employees (with/without duplication).
    SELECT ENAME,JOB 
    FROM EMP;

--7.  Give the name and double salary of employees working on department 10.
    SELECT ENAME, SAL*2 
    FROM EMP 
    WHERE DEPTNO = 10;
     
--8.  List the employees whose hiredate is greater than 1982.01.01.
    SELECT ENAME,HIREDATE 
    FROM EMP 
    WHERE HIREDATE > '01-JAN-1982';
    
--9.  List the employees who doesn't have a manager.
    SELECT ENAME 
    FROM EMP 
    WHERE MGR IS NULL;
    
--10. List the employees whose name contains a letter 'A'.
    SELECT ENAME 
    FROM EMP 
    WHERE ENAME LIKE 'A%';
--11. List the employees whose name contains two letters 'L'.
   SELECT *
    FROM emp
    WHERE REGEXP_COUNT(UPPER(ename), 'L') >= 2;

    -- Alternatively:
        SELECT *
        FROM emp
        WHERE UPPER(ename) LIKE '%LL%';

--12. List the employees whose salary is between 2000 and 3000.
    SELECT ENAME, SAL AS SALARY
    FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;

--13. List the name and salary of employees ordered by salary.
    SELECT ENAME, SAL AS SALARY 
    FROM EMP
    ORDER BY SAL ASC;
--14. List the name and salary of employees ordered by salary in descending order and 
--    within that order, ordered by name in ascending order.
      SELECT ename, sal
    FROM emp
    ORDER BY sal DESC, ename ASC;

    
--15. List the employees whose manager is KING. (reading empno of KING from monitor)
   SELECT e.ename   AS employee_name,
       e.mgr     AS employee_mgr_code,
       m.empno   AS manager_emp_id,
       m.ename   AS manager_name
FROM emp e
LEFT JOIN emp m
ON e.mgr = m.empno;

---------------------

--FUNCTIONS & EXPRESSIONS

--Display employee name, salary, and annual salary.
    SELECT ENAME,SAL,SAL*12 AS ANNUAL_SALARY
    FROM EMP;
    
    -- option 2
    SELECT ename,
       sal,
       (sal * 12) + NVL(comm, 0) AS annual_salary
    FROM emp;

--Display employee name and salary rounded to nearest 100.

  SELECT ENAME,ROUND(SAL,2)
  FROM EMP;

--Display employee name and salary + commission (handle NULL).
    SELECT ENAME AS EMPLOYEE_NAME, NVL(SAL+COMM,0) AS SALARY
    FROM EMP;

--Display employee names in upper case.
  SELECT UPPER(ENAME)
  FROM EMP;
  
--Display length of each employee name.
  SELECT ENAME, LENGTH(ENAME)
  FROM EMP;


