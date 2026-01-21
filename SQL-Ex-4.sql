CREATE TABLE sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(50) NOT NULL,
    rating INT,
    age INT
);

CREATE TABLE boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(50) NOT NULL,
    color VARCHAR(20)
);

CREATE TABLE reserves (
    sid INT,
    bid INT,
    rdate DATE,
    PRIMARY KEY (sid, bid, rdate),
    FOREIGN KEY (sid) REFERENCES sailors(sid),
    FOREIGN KEY (bid) REFERENCES boats(bid)
);



INSERT INTO sailors (sid, sname, rating, age) VALUES (101, 'John', 8, 25);
INSERT INTO sailors (sid, sname, rating, age) VALUES (102, 'Smith', 7, 30);
INSERT INTO sailors (sid, sname, rating, age) VALUES (103, 'Emily', 9, 22);
INSERT INTO sailors (sid, sname, rating, age) VALUES (104, 'Ravi', 5, 28);
INSERT INTO sailors (sid, sname, rating, age) VALUES (105, 'Maria', 6, 35);



INSERT INTO boats (bid, bname, color) VALUES
(201, 'Sea Breeze', 'Red');

INSERT INTO boats (bid, bname, color) VALUES
(202, 'Ocean Wave', 'Blue');

INSERT INTO boats (bid, bname, color) VALUES
(203, 'River Queen', 'Green');

INSERT INTO boats (bid, bname, color) VALUES
(204, 'Storm Rider', 'Yellow');



INSERT INTO reserves (sid, bid, rdate) VALUES
(101, 201, TO_DATE('2025-01-15', 'YYYY-MM-DD'));

INSERT INTO reserves (sid, bid, rdate) VALUES
(102, 202, TO_DATE('2025-02-10', 'YYYY-MM-DD'));

INSERT INTO reserves (sid, bid, rdate) VALUES
(103, 201, TO_DATE('2025-01-20', 'YYYY-MM-DD'));

INSERT INTO reserves (sid, bid, rdate) VALUES
(104, 203, TO_DATE('2025-03-01', 'YYYY-MM-DD'));

INSERT INTO reserves (sid, bid, rdate) VALUES
(105, 204, TO_DATE('2025-03-05', 'YYYY-MM-DD'));

INSERT INTO reserves (sid, bid, rdate) VALUES
(101, 202, TO_DATE('2025-04-10', 'YYYY-MM-DD'));

