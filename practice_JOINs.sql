--1. AUTHOR TABLE
--Create table

CREATE TABLE author (
    id          NUMBER PRIMARY KEY,
    name        VARCHAR2(100) NOT NULL,
    birth_year  NUMBER(4),
    death_year  NUMBER(4)
);

--Insert data

INSERT INTO author VALUES (1, 'Marcella Cole', 1983, NULL);
INSERT INTO author VALUES (2, 'Lisa Mullins', 1891, 1950);
INSERT INTO author VALUES (3, 'Dennis Stokes', 1935, 1994);
INSERT INTO author VALUES (4, 'Randolph Vasquez', 1957, 2004);
INSERT INTO author VALUES (5, 'Daniel Branson', 1965, 1990);

--2. BOOK TABLE
--Create table
CREATE TABLE book (
    id                NUMBER PRIMARY KEY,
    author_id         NUMBER,
    title             VARCHAR2(200) NOT NULL,
    publish_year      NUMBER(4),
    publishing_house  VARCHAR2(150),
    rating            NUMBER(3,1),
    CONSTRAINT fk_book_author
        FOREIGN KEY (author_id) REFERENCES author(id)
);

-- Insert data
INSERT INTO book VALUES (1, NULL, 'Soulless girl', 2008, 'Golden Albatros', 4.3);
INSERT INTO book VALUES (2, NULL, 'Weak Heart', 1980, 'Diarmud Inc.', 3.8);
INSERT INTO book VALUES (3, 4, 'Faith Of Light', 1995, 'White Cloud Press', 4.3);
INSERT INTO book VALUES (4, NULL, 'Memory Of Hope', 2000, 'Rutis Enterprises', 2.7);
INSERT INTO book VALUES (5, 6, 'Warrior Of Wind', 2005, 'Maverick', 4.6);

--Note: author_id = 6 does not exist in the author table.
--If you want to avoid FK errors, either:
--insert author with id = 6, or
--temporarily drop the foreign key.

--Example fix:

INSERT INTO author VALUES (6, 'Claudia Johnson', 1970, NULL);

--3. ADAPTATION TABLE
--Create table
CREATE TABLE adaptation (
    book_id       NUMBER,
    type          VARCHAR2(50),
    title         VARCHAR2(200),
    release_year  NUMBER(4),
    rating        NUMBER(3,1),
    CONSTRAINT fk_adaptation_book
        FOREIGN KEY (book_id) REFERENCES book(id)
);
--Insert data
INSERT INTO adaptation VALUES (1, 'movie', 'Gone With The Wolves: The Beginning', 2008, 3);
INSERT INTO adaptation VALUES (3, 'movie', 'Companions Of Tomorrow', 2001, 4.2);
INSERT INTO adaptation VALUES (5, 'movie', 'Homeless Warrior', 2008, 4);
INSERT INTO adaptation VALUES (2, 'movie', 'Blacksmith With Silver', 2014, 4.3);
INSERT INTO adaptation VALUES (4, 'movie', 'Patrons And Bearers', 2004, 3.2);
-- 4. ️BOOK_REVIEW TABLE
--Create table

CREATE TABLE book_review (
    book_id  NUMBER,
    review   VARCHAR2(400),
    author   VARCHAR2(100),
    CONSTRAINT fk_review_book
        FOREIGN KEY (book_id) REFERENCES book(id)
);
-- Insert data
INSERT INTO book_review VALUES (1, 'An incredible book', 'Sylvia Jones');
INSERT INTO book_review VALUES (1, 'Great, although it has some flaws', 'Jessica Parker');
INSERT INTO book_review VALUES (2, 'Dennis Stokes takes the reader for a ride full of emotions', 'Thomas Green');
INSERT INTO book_review VALUES (3, 'Incredible craftsmanship of the author', 'Martin Freeman');
INSERT INTO book_review VALUES (4, 'Not the best book by this author', 'Jude Falth');
INSERT INTO book_review VALUES (5, 'Claudia Johnson at her best!', 'Joe Marqiz');
INSERT INTO book_review VALUES (6, 'I cannot recall more captivating plot', 'Alexander Durham');

--✅ Optional: Verify data

SELECT * FROM authors;
SELECT * FROM book;
SELECT * FROM adaptation;
SELECT * FROM book_review;


/*

List of Exercises

Exercise 1: List All Books and Their Authors
Exercise 2: List Authors and Books Published After 2005
Exercise 3: Show Books Adapted Within 4 Years and Rated Lower Than the Adaptation
Exercise 4: Show All Books and Their Adaptations (If Any)
Exercise 5: Show All Books and Their Movie Adaptations
Exercise 6: Show All Books with Their Reviews (If Any)
Exercise 7: List All the Books and All the Authors
Exercise 8: Show Products Under 150 Calories and Their Department
Exercise 9: List All Products with Their Producers, Departments, and Carbs
Exercise 10: Show All the Products, Prices, Producers, and Departments
Exercise 11: List All Workers and Their Direct Supervisors
Exercise 12: Show Cars with Higher Mileage Than a Specific Car

*/



--Exercise 1: List All Books and Their Authors
    SELECT * 
    FROM BOOK B
    JOIN AUTHORS A ON B.AUTHOR_ID = A.ID;
    
--Exercise 2: List Authors and Books Published After 2005

    SELECT * 
    FROM BOOK B
    JOIN AUTHORS A ON B.AUTHOR_ID = A.ID
    WHERE B.PUBLISH_YEAR >2005;
    
    
--Exercise 3: Show Books Adapted Within 4 Years and Rated Lower Than the Adaptation

    SELECT A.TITLE 
    FROM ADAPTATION A
    JOIN BOOK B ON A.BOOK_ID = B.ID
    WHERE A.RELEASE_YEAR - B.PUBLISH_YEAR < 4 AND A.RATING <= B.RATING;


-- Exercise 4: Show All Books and Their Adaptations (If Any) -- To use left join 
    -- Note: SQL accepts both LEFT JOIN and LEFT OUTER JOIN. They are the same command.

    SELECT B.TITLE "TITLE",A.TITLE AS "ADAPTED TITLE",A.RELEASE_YEAR AS "ADAPTED ON"
    FROM BOOK B
    LEFT JOIN ADAPTATION A ON A.BOOK_ID = B.ID;

--Exercise 5: Show All Books and Their Movie Adaptations

    SELECT B.TITLE "BOOK",PUBLISHING_HOUSE "PUBLISHING HOUSE", A.TITLE "ADAPTATION TITLE",A.TYPE "ADAPTATION TYPE"
    FROM BOOK B
    LEFT JOIN ADAPTATION A ON A.BOOK_ID = B.ID 
    WHERE UPPER(A.TYPE)='MOVIE' OR TYPE IS NULL;

--Exercise 6: Show All Books with Their Reviews (If Any)

    SELECT B.ID, B.TITLE, R.REVIEW, R.AUTHOR
    FROM BOOK_REVIEW R
    RIGHT JOIN BOOK B ON B.ID = R.BOOK_ID;
    
 /*   SELECT
  book.title,
  book_review.review,
  book_review.author
FROM book_review
RIGHT JOIN book
  ON book.id = book_review.book_id; */
        
--Exercise 7: List All the Books and All the Authors

    SELECT B.ID, A.NAME "AUTHOR",B.TITLE "BOOK TITLE", BIRTH_YEAR, DEATH_YEAR, PUBLISH_YEAR,PUBLISHING_HOUSE,RATING
    FROM AUTHORS A
    FULL JOIN BOOK B ON A.ID = B.AUTHOR_ID;


-----------------------
-- creating DB 

CREATE TABLE department (
    id   NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL
);
-- insert data
INSERT INTO department (id, name) VALUES (1, 'fruits');
INSERT INTO department (id, name) VALUES (2, 'vegetables');
INSERT INTO department (id, name) VALUES (3, 'seafood');
INSERT INTO department (id, name) VALUES (4, 'deli');
INSERT INTO department (id, name) VALUES (5, 'bakery');
INSERT INTO department (id, name) VALUES (6, 'meat');
INSERT INTO department (id, name) VALUES (7, 'dairy');




CREATE TABLE product (
    id             NUMBER PRIMARY KEY,
    name           VARCHAR2(100) NOT NULL,
    department_id  NUMBER NOT NULL,
    shelf_id       NUMBER,
    producer_id    NUMBER,
    price          NUMBER(10,2),

    CONSTRAINT fk_product_department
        FOREIGN KEY (department_id)
        REFERENCES department(id)
);


INSERT INTO product VALUES (101, 'Apple',        1, 10, 1001, 1.50);
INSERT INTO product VALUES (102, 'Banana',       1, 11, 1002, 0.80);
INSERT INTO product VALUES (103, 'Carrot',       2, 20, 1003, 0.60);
INSERT INTO product VALUES (104, 'Salmon',       3, 30, 1004, 12.50);
INSERT INTO product VALUES (105, 'Cheese',       7, 40, 1005, 4.75);
INSERT INTO product VALUES (106, 'Bread',        5, 50, 1006, 2.20);
INSERT INTO product VALUES (107, 'Chicken',      6, 60, 1007, 6.90);
INSERT INTO product VALUES (108, 'Ham',          4, 41, 1008, 5.30);

COMMIT;

SELECT * FROM department;
SELECT * FROM product;

ALTER TABLE product ADD calories NUMBER;

UPDATE product SET calories = 95  WHERE id = 101;  -- Apple
UPDATE product SET calories = 105 WHERE id = 102;  -- Banana
UPDATE product SET calories = 41  WHERE id = 103;  -- Carrot
UPDATE product SET calories = 208 WHERE id = 104;  -- Salmon
UPDATE product SET calories = 113 WHERE id = 105;  -- Cheese
UPDATE product SET calories = 120 WHERE id = 106;  -- Bread
UPDATE product SET calories = 239 WHERE id = 107;  -- Chicken
UPDATE product SET calories = 145 WHERE id = 108;  -- Ham

commit;

ALTER TABLE product DROP COLUMN calories;
desc product;

CREATE TABLE nutrition_data (
    product_id    NUMBER PRIMARY KEY,
    calories      NUMBER,
    fat           NUMBER(6,2),
    carbohydrate  NUMBER(6,2),
    protein       NUMBER(6,2),

    CONSTRAINT fk_nutrition_product
        FOREIGN KEY (product_id)
        REFERENCES product(id)
);

INSERT INTO nutrition_data VALUES (101,  95,  0.30, 25.00,  0.50); -- Apple
INSERT INTO nutrition_data VALUES (102, 105,  0.40, 27.00,  1.30); -- Banana
INSERT INTO nutrition_data VALUES (103,  41,  0.20, 10.00,  0.90); -- Carrot
INSERT INTO nutrition_data VALUES (104, 208, 13.00,  0.00, 20.40); -- Salmon
INSERT INTO nutrition_data VALUES (105, 113,  9.30,  0.40,  7.00); -- Cheese
INSERT INTO nutrition_data VALUES (106, 120,  1.10, 23.00,  4.00); -- Bread
INSERT INTO nutrition_data VALUES (107, 239, 14.00,  0.00, 27.30); -- Chicken
INSERT INTO nutrition_data VALUES (108, 145,  6.50,  1.50, 18.00); -- Ham

-- CREATE PRODUCER TABLE:

CREATE TABLE producer (
    id   NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL
);

INSERT INTO producer (id, name) VALUES (1001, 'Fresh Farms');
INSERT INTO producer (id, name) VALUES (1002, 'Tropical Foods');
INSERT INTO producer (id, name) VALUES (1003, 'Green Valley');
INSERT INTO producer (id, name) VALUES (1004, 'Ocean Catch');
INSERT INTO producer (id, name) VALUES (1005, 'Dairy Best');
INSERT INTO producer (id, name) VALUES (1006, 'Bake House');
INSERT INTO producer (id, name) VALUES (1007, 'Farm Pride');
INSERT INTO producer (id, name) VALUES (1008, 'Meat Masters');

COMMIT;

-- ADD FOREIGN KEY TO PRODUCT:

ALTER TABLE product
ADD CONSTRAINT fk_product_producer
FOREIGN KEY (producer_id)
REFERENCES producer(id);

SELECT * FROM producer;



--Exercise 8: Show Products Under 150 Calories and Their Department

    SELECT P.NAME PRODUCT, CALORIES,D.NAME DEPARTMENT
    FROM PRODUCT p
    JOIN DEPARTMENT D ON P.DEPARTMENT_ID=D.ID
    JOIN NUTRITION_DATA N ON p.id  = N.product_id
    WHERE N.CALORIES < 150;
    


--Exercise 9: List All Products with Their Producers, Departments, and Carbs

    DESC PRODUCT;
    DESC DEPARTMENT;
    desc nutrition_data;

    SELECT P.NAME PRODUCT,R.NAME PRODUCERS,D.NAME DEPARTMENT,N.CARBOHYDRATE CARBS
    FROM PRODUCT p
    JOIN DEPARTMENT D ON P.DEPARTMENT_ID=D.ID
    JOIN NUTRITION_DATA N ON p.id  = N.product_id
    JOIN PRODUCER R ON R.ID = P.PRODUCER_ID;
 

--Exercise 10: Show All the Products, Prices, Producers, and Departments

    SELECT P.NAME PRODUCT,PRICE, R.NAME PRODUCERS,D.NAME DEPARTMENT
    FROM PRODUCT p
    JOIN DEPARTMENT D ON P.DEPARTMENT_ID=D.ID
    JOIN NUTRITION_DATA N ON p.id  = N.product_id
    JOIN PRODUCER R ON R.ID = P.PRODUCER_ID;
    
-- DATASET#3:

CREATE TABLE workshop_workers (
    id             NUMBER PRIMARY KEY,
    name           VARCHAR2(100) NOT NULL,
    specialization VARCHAR2(50),
    master_id      NUMBER,
    experience     NUMBER,
    project_id     NUMBER,

    CONSTRAINT fk_worker_master
        FOREIGN KEY (master_id)
        REFERENCES workshop_workers(id)
);

-- INSERT DATA:

INSERT INTO workshop_workers VALUES
(1, 'Mathew Conn', 'woodworking', NULL, 20, 1);

INSERT INTO workshop_workers VALUES
(2, 'Kate Brown', 'woodworking', 1, 4, 1);

INSERT INTO workshop_workers VALUES
(3, 'John Doe', 'incrusting', 5, 3, 1);

INSERT INTO workshop_workers VALUES
(4, 'John Kowalsky', 'watchmaking', 7, 2, 3);

INSERT INTO workshop_workers VALUES
(5, 'Suzan Gregowitch', 'incrusting', NULL, 15, 4);

COMMIT;

-- VERIFY DATA:
SELECT * FROM WORKSHOP_WORKERS;
 
--Exercise 11: List All Workers and Their Direct Supervisors
-- to check the table columns:
    SELECT column_name
    FROM user_tab_columns
    WHERE table_name = 'PRODUCT';
    
    
-- SELF JOIN:

SELECT
  apprentice.name AS apprentice_name,
  master.name AS master_name
FROM workshop_workers apprentice
JOIN workshop_workers master
  ON apprentice.master_id = master.id;
    
-- Non-Equi Joins
/* The final topic we’ll tackle in this SQL joins practice are non-equi joins. 
The joins we used so far are called equi-joins because they use the equality sign (=) in the joining condition. 
Non-equi are all other joins that use any other operators – comparison operators (<, >, <=, >=, !=, <>), the BETWEEN operator, 
or any other logical condition – to join tables.
*/

-- DATASET #4:
CREATE TABLE car (
    id              NUMBER PRIMARY KEY,
    model           VARCHAR2(50) NOT NULL,
    brand           VARCHAR2(50) NOT NULL,
    original_price  NUMBER(10,2),
    mileage         NUMBER,
    prod_year       NUMBER(4)
);

-- INSERT DATA:
INSERT INTO car VALUES (1, 'Speedster',  'Teiko',  80000, 150000, 1999);
INSERT INTO car VALUES (2, 'Roadmaster', 'Teiko', 110000,  30000, 1980);
INSERT INTO car VALUES (3, 'Sundry',     'Teiko',  40000,  25000, 1991);
INSERT INTO car VALUES (4, 'Furu',       'Domus',  50000,  10000, 2002);
INSERT INTO car VALUES (5, 'Emperor',    'Domus',  65000, 140000, 2005);
INSERT INTO car VALUES (6, 'King',       'Domus', 200000,   6000, 1981);
INSERT INTO car VALUES (7, 'Empress',    'Domus',  60000,   7600, 1997);
INSERT INTO car VALUES (8, 'Fury',       'Tatsu', 150000,  13000, 1993);

COMMIT;

-- VERIFY DATA:
SELECT * FROM car ORDER BY id;



-- Exercise 12: Show Cars with Higher Mileage Than a Specific Car

CREATE TABLE charity_auction (
    car_id         NUMBER PRIMARY KEY,
    initial_price  NUMBER(10,2),
    final_price    NUMBER(10,2),
    buyer_id       NUMBER,

    CONSTRAINT fk_auction_car
        FOREIGN KEY (car_id)
        REFERENCES car(id)
);

-- INSERT DATA:

INSERT INTO charity_auction VALUES (1,  65000,   NULL,    NULL);
INSERT INTO charity_auction VALUES (3,  35000,  50000,       1);
INSERT INTO charity_auction VALUES (5,  50000, 120000,       3);
INSERT INTO charity_auction VALUES (6, 350000, 410000,       4);
INSERT INTO charity_auction VALUES (7,  65000,   NULL,    NULL);

COMMIT;

--VERIFY

SELECT * FROM charity_auction ORDER BY car_id;


-- Exercise 12: Show Cars with Higher Mileage Than a Specific Car
SELECT
    c.model,
    c.brand,
    ca.final_price
FROM car c
JOIN charity_auction ca
    ON c.id = ca.car_id
JOIN car c2
    ON c.mileage > c2.mileage
WHERE c2.id = 4
  AND ca.final_price IS NOT NULL;




-------  ARTISTS DB

CREATE TABLE artists (
    artist_id INTEGER PRIMARY KEY,
    artist_name VARCHAR(255),
    label_owner VARCHAR(255)
);