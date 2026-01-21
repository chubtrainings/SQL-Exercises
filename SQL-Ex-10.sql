select * from user_constraints where table_name = upper('boats');

select * from Reserves;

select * from Boats;

CREATE TABLE authors (
			id          NUMBER PRIMARY KEY,
			name        VARCHAR2(100) NOT NULL,
			birth_year  NUMBER(4) NOT NULL,
			death_year  NUMBER(4) NULL
		);
        
        
        INSERT INTO authors (id, name, birth_year, death_year) 
		VALUES (1, 'Marcella Cole', 1983, NULL);

		INSERT INTO authors (id, name, birth_year, death_year) 
		VALUES (2, 'Lisa Mullins', 1891, 1950);

		INSERT INTO authors (id, name, birth_year, death_year) 
		VALUES (3, 'Dennis Stokes', 1935, 1994);

		INSERT INTO authors (id, name, birth_year, death_year) 
		VALUES (4, 'Randolph Vasquez', 1957, 2004);

		INSERT INTO authors (id, name, birth_year, death_year) 
		VALUES (5, 'Daniel Branson', 1965, 1990);
        
        INSERT INTO authors (id, name, birth_year, death_year) 
		VALUES (5, 'Daniel Branson', 1965, 1990);
		
        
         INSERT INTO authors (id, name, birth_year, death_year) 
		VALUES (6, 'Daniel Smith', 1967, NULL);
        
		COMMIT;

		
		SELECT * FROM authors;    
       CREATE TABLE book (
			id                NUMBER PRIMARY KEY,
			author_id         NUMBER,
			title             VARCHAR2(200) NOT NULL,
			publish_year      NUMBER(4) NOT NULL,
			publishing_house  VARCHAR2(150) NOT NULL,
			rating            NUMBER(2,1),
			CONSTRAINT fk_book_author
				FOREIGN KEY (author_id)
				REFERENCES authors(id)
		); 
        
        
        INSERT INTO book (id, author_id, title, publish_year, publishing_house, rating)
		VALUES (1, NULL, 'Soulless girl', 2008, 'Golden Albatros', 4.3);

		INSERT INTO book (id, author_id, title, publish_year, publishing_house, rating)
		VALUES (2, NULL, 'Weak Heart', 1980, 'Diarmud Inc.', 3.8);

		INSERT INTO book (id, author_id, title, publish_year, publishing_house, rating)
		VALUES (3, 4, 'Faith Of Light', 1995, 'White Cloud Press', 4.3);

		INSERT INTO book (id, author_id, title, publish_year, publishing_house, rating)
		VALUES (4, NULL, 'Memory Of Hope', 2000, 'Rutis Enterprises', 2.7);

		INSERT INTO book (id, author_id, title, publish_year, publishing_house, rating)
		VALUES (6, 6, 'Rich Dad Poor Dad', 2005, 'Visalandhra', 4.6);
		
		COMMIT;


		SELECT * FROM book;
        
    CREATE TABLE adaptation (
			book_id        NUMBER NOT NULL,
			type           VARCHAR2(50) NOT NULL,
			title          VARCHAR2(200) NOT NULL,
			release_year   NUMBER(4) NOT NULL,
			rating         NUMBER(3,1),
			CONSTRAINT adaptation_pk PRIMARY KEY (book_id, title),
			CONSTRAINT fk_adaptation_book
				FOREIGN KEY (book_id)
				REFERENCES book(id)
		);
        
  INSERT INTO adaptation (book_id, type, title, release_year, rating)
		VALUES (1, 'movie', 'Gone With The Wolves: The Beginning', 2008, 3);

		INSERT INTO adaptation (book_id, type, title, release_year, rating)
		VALUES (3, 'movie', 'Companions Of Tomorrow', 2001, 4.2);

		INSERT INTO adaptation (book_id, type, title, release_year, rating)
		VALUES (5, 'movie', 'Homeless Warrior', 2008, 4);

		INSERT INTO adaptation (book_id, type, title, release_year, rating)
		VALUES (2, 'movie', 'Blacksmith With Silver', 2014, 4.3);

		INSERT INTO adaptation (book_id, type, title, release_year, rating)
		VALUES (4, 'movie', 'Patrons And Bearers', 2004, 3.2);  
        
        
        COMMIT;
		
		SELECT * FROM adaptation;
        
        CREATE TABLE book_review (
			book_id   NUMBER NOT NULL,
			review    VARCHAR2(500) NOT NULL,
			author    VARCHAR2(150) NOT NULL,
			CONSTRAINT book_review_pk PRIMARY KEY (book_id, author),
			CONSTRAINT fk_review_book
				FOREIGN KEY (book_id)
				REFERENCES book(id)
		);
		
        
INSERT INTO book_review (book_id, review, author)
		VALUES (1, 'An incredible book', 'Sylvia Jones');

		INSERT INTO book_review (book_id, review, author)
		VALUES (1, 'Great, although it has some flaws', 'Jessica Parker');

		INSERT INTO book_review (book_id, review, author)
		VALUES (2, 'Dennis Stokes takes the reader for a ride full of emotions', 'Thomas Green');

		INSERT INTO book_review (book_id, review, author)
		VALUES (3, 'Incredible craftsmanship of the author', 'Martin Freeman');

		INSERT INTO book_review (book_id, review, author)
		VALUES (4, 'Not the best book by this author', 'Jude Falth');

		INSERT INTO book_review (book_id, review, author)
		VALUES (5, 'Claudia Johnson at her best!', 'Joe Marqiz');

		INSERT INTO book_review (book_id, review, author)
		VALUES (6, 'I cannot recall more captivating plot', 'Alexander Durham');
		
		COMMIT;

		SELECT * FROM book_review;
        
        
 -- List all books and their authors:
 
 
 select b.title, a.name 
 from book b
 inner join authors a on b.author_id = a.id;
 
 --List Authors and Books Published After 2005
 desc book;
 
 
 select a.name, b.title,b.publish_year
 from book b
 inner join authors a on b.author_id = a.id where PUBLISH_YEAR >2005;
 
 
 --- 	Exercise 3: Show Books Adapted Within 4 Years and Rated Lower Than the Adaptation
 
 
 SELECT 
    b.id AS book_id,
    b.title AS book_title,
    b.publish_year AS book_publish_year,
    b.rating AS book_rating,
    a.title AS adaptation_title,
    a.release_year AS adaptation_release_year,
    a.rating AS adaptation_rating,
    a.type AS adaptation_type
FROM book b
JOIN adaptation a
    ON b.id = a.book_id
WHERE 
    (a.release_year - b.publish_year) <= 4
    AND a.rating > b.rating;
