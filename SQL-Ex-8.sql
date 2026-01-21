-- Group By and Having Functions:
-- =================================


-- DB: aks_PDB1_localhost:

--Group By .. Having cluase Practice

-- Group data with GROUP BY, and computing statistics using aggregate functions COUNT(), AVG(), SUM(), MIN(), and MAX()
-- Aggregate functions

-- Create table games:
CREATE TABLE games (
    title            VARCHAR2(100),
    company          VARCHAR2(100),
    type             VARCHAR2(50),
    production_year  NUMBER(4),
    system           VARCHAR2(20),
    production_cost  NUMBER(12),
    revenue          NUMBER(12),
    rating           NUMBER(2)
);



-- Insert Data:

INSERT INTO games VALUES (
    'Blasting Boxes',
    'Simone Games',
    'action adventure',
    1998,
    'PC',
    100000,
    200000,
    7
);

INSERT INTO games VALUES (
    'Run Run Run!',
    '13 Mad Bits',
    'shooter',
    2011,
    'PS3',
    3500000,
    650000,
    3
);

INSERT INTO games VALUES (
    'Duck n’Go',
    '13 Mad Bits',
    'shooter',
    2012,
    'Xbox',
    3000000,
    1500000,
    5
);

INSERT INTO games VALUES (
    'SQL Wars!',
    'Vertabelo',
    'wargames',
    2017,
    'Xbox',
    5000000,
    25000000,
    10
);

INSERT INTO games VALUES (
    'Tap Tap Hex!',
    'PixelGaming Inc.',
    'rhythm',
    2006,
    'PS2',
    2500000,
    3500000,
    7
);

INSERT INTO games VALUES (
    'NoRisk',
    'Simone Games',
    'action adventure',
    2004,
    'PS2',
    1400000,
    3400000,
    8
);

COMMIT;

desc games;
-- Total Revenue for Each Company

-- Obtain the name and total revenue for each company.

select company, sum(revenue)  as Total_Revenue
from games
Group by company,title
order by sum(revenue) desc;

-- Generate a report with the production year and the number of games released this year (named count), 
-- the average of production cost for all games produced in this year (named avg_cost) and the average revenue for that year (named avg_revenue).

desc games;

select production_year, count(Production_year)as number_of_games_released,avg(production_cost) as avg_cost, avg(revenue) as avg_revenue
from games
Group BY production_year;

-- Count how many games of a given type are profitable (i.e. the revenue was greater than the production cost). 
-- Show the game type and the number of profitable games (named number_of_games) for each type.

select type as game_type,count(type) as number_of_games
from games
group by type
having sum(revenue) >sum(production_cost);

-- Alternatively

SELECT   
  type,
  COUNT(*) AS number_of_games
FROM games
WHERE revenue > production_cost
GROUP BY type;

-- Exercise 4: Total Revenue per Game Type in PS2 and PS3 Systems

-- Obtain the type of games and the total revenue generated for games with a production_year after 2010 and with a PS2 or PS3 system. 
-- Order the result so the types with the highest revenue come first.

SELECT TYPE, SUM(REVENUE) AS "TOTAL_REVENUE"
FROM GAMES
WHERE PRODUCTION_YEAR>2010 AND SYSTEM IN ('PS2','PS3')
GROUP BY TYPE;


--Exercise 5: Total Gross Profit per Company
--Exercise:
--For all companies present in the table, obtain their names and the sum of gross profit over all years. 
-- (Assume that gross profit = revenue - cost of production). Name this column gross_profit_sum. 
-- Order the results by gross profit, in descending order.

DESC GAMES;

SELECT COMPANY, SUM(REVENUE-PRODUCTION_COST) AS GROSS_PROFIT_SUM
FROM GAMES
GROUP BY COMPANY
ORDER BY GROSS_PROFIT_SUM DESC;

--Exercise 6: Yearly Gross Profit per Company
--Exercise:
--Obtain the yearly gross profit of each company. In other words, we want a report with the company name, the year, and the gross profit for that year. Order the report by company name and year.

SELECT PRODUCTION_YEAR,COMPANY, SUM(REVENUE-PRODUCTION_COST) AS GROSS_PROFIT_SUM
FROM GAMES
GROUP BY PRODUCTION_YEAR,COMPANY
ORDER BY PRODUCTION_YEAR,COMPANY;

--Exercise 7: Difference Between Yearly Gross Profits
--Exercise:
--Generate report to show the yearly gross profit for each company, the gross profit of the previous year, and the difference between both years. 
-- I suggest using the previous query as a starting point.e

WITH company_gross_profit AS (
  SELECT
    company,
    production_year AS year,
    SUM(revenue - production_cost) AS gross_profit
  FROM games
  GROUP BY company, production_year
  ORDER BY company, production_year
)
SELECT
  cur.company,
  cur.year,
  cur.gross_profit,
  prev.gross_profit,
  cur.gross_profit - prev.gross_profit AS profit_delta
FROM company_gross_profit AS cur,
LEFT JOIN company_gross_profit AS prev
ON (cur.company = prev.company) AND (cur.year = prev.year + 1);

SELECT
    company,
    production_year,
    gross_profit,
    LAG(gross_profit) OVER (
        PARTITION BY company
        ORDER BY production_year
    ) AS prev_year_gross_profit,
    gross_profit
      - LAG(gross_profit) OVER (
            PARTITION BY company
            ORDER BY production_year
        ) AS profit_difference
FROM (
    SELECT
        company,
        production_year,
        SUM(revenue - production_cost) AS gross_profit
    FROM games
    GROUP BY company, production_year
)
ORDER BY company, production_year;

select * from sales;

select sum(case when mod(sale_id,2)=0 then sale_id else 0 end) as even_sum, sum(case when mod(sale_id,2)!=0 then sale_id else 0 end) as even_sum
from sales;

create table sample(id number(5),value number(5));

insert into sample values(1,1);
insert into sample values(1,-1);
insert into sample values(1,2);
insert into sample values(1,-2);
insert into sample values(1,3);
insert into sample values(1,-3);
insert into sample values(1,4);
insert into sample values(1,-4);
commit;
select * from sample;
select sum(case when value>0 then value else 0 end) pos_sum,sum(case when value<0 then value else 0 end) as neg_sum
from sample;

