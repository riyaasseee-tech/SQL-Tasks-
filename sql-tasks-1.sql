

CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Borrow (
    borrow_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE
);

ALTER TABLE Books ADD COLUMN IF NOT EXISTS category VARCHAR(50);
ALTER TABLE Books ADD COLUMN IF NOT EXISTS quantity INT;
ALTER TABLE Members ADD COLUMN IF NOT EXISTS email VARCHAR(150);
ALTER TABLE Borrow ADD COLUMN IF NOT EXISTS return_date DATE;
ALTER TABLE Books MODIFY COLUMN price DECIMAL(10,2);
ALTER TABLE Books CHANGE COLUMN quantity stock_quantity INT;

DESCRIBE Books;
DESCRIBE Members;
DESCRIBE Borrow;

INSERT INTO Books (book_id, book_name, author, price, category, stock_quantity) VALUES
(101, 'SQL Basics', 'A. Kumar', 350.00, 'Technology', 12),
(102, 'Learning Python', 'R. Sharma', 650.00, 'Technology', 8),
(103, 'Database Systems', 'A. Kumar', 750.00, 'Technology', 15),
(104, 'English Grammar', 'S. Patel', 250.00, 'Education', 20),
(105, 'Science for All', 'M. Rao', 420.00, 'Education', 10),
(106, 'Modern History', 'P. Singh', 500.00, 'History', 6),
(107, 'Stories of India', 'N. Das', 300.00, 'Literature', 14),
(108, 'Advanced SQL', 'R. Sharma', 900.00, 'Technology', 4),
(109, 'School Mathematics', 'S. Patel', 480.00, 'Education', 0),
(110, 'Space and Beyond', 'M. Rao', 820.00, 'Science', 9);

INSERT INTO Members (member_id, member_name, city, phone, email) VALUES
(201, 'Ananya Rao', 'Chennai', '9876500001', 'ananya@example.com'),
(202, 'Bharat Kumar', 'Coimbatore', '9876500002', 'bharat@example.com'),
(203, 'Charu Das', 'Madurai', '9876500003', 'charu@example.com'),
(204, 'Deepak Singh', 'Salem', '9876500004', 'deepak@example.com'),
(205, 'Farah Ali', 'Trichy', '9876500005', 'farah@example.com'),
(206, 'Gokul Patel', 'Chennai', '9876500006', 'gokul@example.com'),
(207, 'Harini Shah', 'Vellore', '9876500007', 'harini@example.com'),
(208, 'Ishaan Roy', 'Erode', '9876500008', 'ishaan@example.com');

INSERT INTO Borrow (borrow_id, book_id, member_id, borrow_date, return_date) VALUES
(301, 101, 201, '2026-09-01', '2026-09-10'),
(302, 102, 202, '2026-09-03', '2026-09-12'),
(303, 103, 203, '2026-09-05', '2026-09-15'),
(304, 101, 204, '2026-09-07', '2026-09-17'),
(305, 104, 205, '2026-09-08', '2026-09-18'),
(306, 105, 206, '2026-09-10', '2026-09-20'),
(307, 103, 207, '2026-09-12', '2026-09-22'),
(308, 106, 201, '2026-09-14', '2026-09-24'),
(309, 108, 202, '2026-09-16', '2026-09-26'),
(310, 107, 203, '2026-09-18', '2026-09-28');

INSERT INTO Books (book_id, book_name, author, price, category, stock_quantity)
VALUES (111, 'MySQL in Practice', 'A. Kumar', 620.00, 'Technology', 11);

INSERT INTO Members (member_id, member_name, city, phone, email)
VALUES (209, 'Jaya Menon', 'Chennai', '9876500009', 'jaya@example.com');

INSERT INTO Borrow (borrow_id, book_id, member_id, borrow_date, return_date)
VALUES (311, 111, 209, '2026-09-20', '2026-09-30');

UPDATE Books SET price = 780.00 WHERE book_id = 103;
UPDATE Books SET price = price * 1.10 WHERE category = 'Technology';
UPDATE Books SET stock_quantity = stock_quantity + 5;
UPDATE Members SET city = 'Tirunelveli' WHERE member_id = 202;
UPDATE Members SET email = 'bharat.kumar@example.com' WHERE member_id = 202;
UPDATE Books SET category = 'Reference' WHERE book_id = 107;
UPDATE Borrow SET return_date = '2026-10-05' WHERE borrow_id = 301;

DELETE FROM Books WHERE book_id = 106;
DELETE FROM Members WHERE member_id = 208;
DELETE FROM Borrow WHERE borrow_id = 310;
DELETE FROM Books WHERE stock_quantity = 0;

SELECT * FROM Books;
SELECT book_name, author FROM Books;
SELECT book_name, category, price FROM Books;
SELECT * FROM Books WHERE price > 500;
SELECT * FROM Books WHERE price < 500;
SELECT * FROM Books WHERE price BETWEEN 300 AND 800;
SELECT * FROM Books WHERE category = 'Technology';
SELECT * FROM Books WHERE author = 'A. Kumar';
SELECT * FROM Books WHERE book_name LIKE 'S%';
SELECT * FROM Books WHERE book_name LIKE '%SQL%';
SELECT * FROM Books WHERE category IN ('Technology', 'Education');
SELECT * FROM Books WHERE price <> 500;
SELECT * FROM Books WHERE stock_quantity > 10;
SELECT * FROM Books WHERE stock_quantity BETWEEN 5 AND 15;

CREATE USER IF NOT EXISTS 'library_user'@'localhost' IDENTIFIED BY 'Library@123';
GRANT SELECT ON LibraryDB.Books TO 'library_user'@'localhost';
GRANT INSERT ON LibraryDB.Books TO 'library_user'@'localhost';
GRANT UPDATE ON LibraryDB.Books TO 'library_user'@'localhost';
SHOW GRANTS FOR 'library_user'@'localhost';
REVOKE INSERT ON LibraryDB.Books FROM 'library_user'@'localhost';
REVOKE UPDATE ON LibraryDB.Books FROM 'library_user'@'localhost';
GRANT SELECT ON LibraryDB.* TO 'library_user'@'localhost';
REVOKE SELECT ON LibraryDB.Books FROM 'library_user'@'localhost';
SHOW GRANTS FOR 'library_user'@'localhost';

SELECT * FROM Books ORDER BY price ASC;
SELECT * FROM Books ORDER BY price DESC;
SELECT * FROM Books ORDER BY book_name ASC;
SELECT * FROM Books ORDER BY category ASC, price ASC;
SELECT * FROM Books ORDER BY price DESC LIMIT 3;
SELECT * FROM Books ORDER BY price ASC LIMIT 3;
SELECT * FROM Books ORDER BY stock_quantity DESC LIMIT 5;
SELECT * FROM Members ORDER BY member_name ASC LIMIT 5;
SELECT * FROM Borrow ORDER BY borrow_date DESC, borrow_id DESC LIMIT 5;

SELECT COUNT(*) AS total_books FROM Books;
SELECT COUNT(*) AS total_members FROM Members;
SELECT COUNT(*) AS total_borrow_records FROM Borrow;
SELECT SUM(stock_quantity) AS total_stock_quantity FROM Books;
SELECT SUM(price) AS total_book_price FROM Books;
SELECT AVG(price) AS average_book_price FROM Books;
SELECT MAX(price) AS highest_book_price FROM Books;
SELECT MIN(price) AS lowest_book_price FROM Books;
SELECT MAX(price) - MIN(price) AS price_difference FROM Books;
SELECT AVG(stock_quantity) AS average_stock_quantity FROM Books;

SELECT category, COUNT(*) AS number_of_books
FROM Books GROUP BY category;
SELECT category, AVG(price) AS average_price
FROM Books GROUP BY category;
SELECT category, MAX(price) AS highest_price
FROM Books GROUP BY category;
SELECT category, MIN(price) AS lowest_price
FROM Books GROUP BY category;
SELECT category, SUM(stock_quantity) AS total_stock_quantity
FROM Books GROUP BY category;
SELECT category, SUM(price * stock_quantity) AS total_value
FROM Books GROUP BY category;
SELECT category, COUNT(*) AS number_of_books
FROM Books GROUP BY category HAVING COUNT(*) > 2;
SELECT category, AVG(price) AS average_price
FROM Books GROUP BY category HAVING AVG(price) > 500;
SELECT author, COUNT(*) AS books_written
FROM Books GROUP BY author;
SELECT author, AVG(price) AS average_price
FROM Books GROUP BY author;

SELECT category, COUNT(*) AS number_of_books
FROM Books GROUP BY category HAVING COUNT(*) > 2;
SELECT category, AVG(price) AS average_price
FROM Books GROUP BY category HAVING AVG(price) > 500;
SELECT author, COUNT(*) AS books_written
FROM Books GROUP BY author HAVING COUNT(*) > 1;
SELECT category, SUM(stock_quantity) AS total_stock_quantity
FROM Books GROUP BY category HAVING SUM(stock_quantity) > 20;
SELECT author, AVG(price) AS average_price
FROM Books GROUP BY author HAVING AVG(price) > 600;
