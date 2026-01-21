-- Functions:
-----           Single Row Functions:
-----           =====================

-- round:

    select round(5435.7878) from dual;
    
    select round(5435.3878) from dual;
    
    select round(5435.7878,2) from dual;
    
    select round(5435.9978,2) from dual;
    
    select round(5435.783258,3) from dual;
    
    select round(5435.783258,4) from dual;
    
    select round(5435.7878,2) from dual;

-- trunc  - always returns the base value.

    select trunc(0.7878) from dual;
    
    select trunc(5435.7878) from dual;
    
    select trunc(5435.3878) from dual;
    
    select trunc(5435.7878,2) from dual;
    
    select trunc(5435.9978,2) from dual;
    
    select trunc(5435.783258,3) from dual;
    
    select trunc(5435.783258,4) from dual;
    
    select trunc(5435.7878,-2) from dual;
    
-- SYSTIMESTAMP

    select systimestamp from dual;
-- trunc will remove timestamp from datetime and will give date part alone.
    select trunc(systimestamp) from dual;
    
    
-- ceil  - always top value (next value)
-- floor - always base value

--difference between trunc,floor,ceil and round

--trunc - we can have two arguments like trunc(5435.783258,4) i.e..- and +.
-- ceil and floow will take one argumnet only.

select floor(5.99999999) from dual;

select floor(5.000000999) from dual;
select ceil(5.99999999) from dual;

select ceil(5.00000001) from dual;

-- mod : returns the reminder of the mod(55,4) --> 55 divided by 4 what is the reminder, given by mod

-- select alternate record.

select employee_id
from employees
where mod(employee_id,2) = 0;

-- list all employees hired on leap year.

select employee_id, first_name,Last_name,hire_date
from employees
where mod(EXTRACT(YEAR FROM hire_date),2) = 0;

-- To get year from hiredate -- extract(year from hire_date)
-- once got the year divide it by 2.
--In Oracle, EXTRACT always returns a NUMBER.

select EXTRACT(YEAR   FROM sysdate) from dual;   /* NUMBER */
select EXTRACT(MONTH  FROM sysdate) from dual;   /* NUMBER */
select EXTRACT(DAY    FROM date) from dual;   /* NUMBER */
select EXTRACT(HOUR   FROM systimestamp) from dual;     /* NUMBER (TIMESTAMP only) */
select EXTRACT(MINUTE FROM systimestamp) from dual;     /* NUMBER */
--syntax:
select EXTRACT(SECOND FROM systimestamp) from dual; 
select EXTRACT(SECOND FROM ts) from dual; /* NUMBER (can be fractional) */
SELECT TO_CHAR(SYSDATE, 'MONTH') AS month_char FROM dual;

SELECT TRIM(TO_CHAR(hire_date, 'MONTH')) AS month_char FROM employees;
select extract(year from hire_date) as year_num from employees;  /* returns year */
select extract(day from hire_date) as year_num from employees;  /* returns day-date */
select extract(month from hire_date) as year_num from employees;  /* returns month as number */
SELECT TO_CHAR(HIRE_DATE, 'MONTH') AS month_char FROM employees; /* returns month in char*/

SELECT CAST(hire_date AS TIMESTAMP) AS hire_ts FROM employees;

--Using TO_TIMESTAMP (when DATE is in character form)
SELECT TO_TIMESTAMP(hire_date, 'DD-MON-YYYY HH24:MI:SS') FROM employees;

-- mod

-- leap year of hire date
select * from employees where mod(to_char (hire_date, 'yyyy'),4)=0;

select * from employees where mod(to_char(hire_date, 'yyyy'), 4)!=0;

select * from employees where mod (extract (year from hire_date), 4)=0;

select * from employees where mod(to_char(hire_date, 'yyyy'), 4) !=0;

-- even number of employee_id
ect * from employees where mod(employee_id,3)=1 and mod(employee_id, 4)=0;

-- 112, 136, 148, ..... MoD
    select * From employees where mod(employee_id,12)=4 and employee_id!=100;

-- Alternatively
        select *
        from employees
        where employee_id >=112 and mod(employee_id-112,12)=0;

-- odd number of employees id
select * from employees where mod(employee_id,3)=1;


--- Months Between

select months_between(TO_DATE ('2020/01/01', 'yyyy/mm/dd'), TO_DATE ('2010/01/01', 'yyyy/mm/dd')) total_months from dual;

select hire_date hiredate,TO_DATE (hire_date, 'yyyy/mm/dd'), round(months_between(TO_DATE (hire_date, 'yyyy/mm/dd'), TO_DATE (sysdate, 'yyyy/mm/dd'))) total_months from employees;


-- days between two dates

select date2 - datel total days from dual;



--      STRING FUNCTIONS:
--          -- UPPER(),LOWER(),INITCAP(),LENGTH(),REVERSE()
select first_name,upper(first_name),lower(first_name),initcap(first_name),
length(first_name),reverse(first_name) from employees;

select * from employees where first_name='John';
select * from employees where first_name='john';
select * from employees where lower(first_name)='john';
select * from employees where UPPER(first_name)='JOHN';
select address,lower(address) from customer_details;
select address from customer_details where lower(ADDRESS)='chennai';
select * from customer_details where address ='chennai';
select * from customer_details where lower(address) ='chennai';
select * from customer_details where upper(address) ='CHENNAI';
-- Substr --sub string
substr(string,from_position,no_of_char); -- 3 argument
substr(string,from_position); -- 2 argument
