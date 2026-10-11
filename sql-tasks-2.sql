
USE LibraryDB;

SELECT b.book_name, m.member_name
FROM Borrow br
INNER JOIN Books b ON br.book_id = b.book_id
INNER JOIN Members m ON br.member_id = m.member_id;

SELECT b.book_name, m.member_name, br.borrow_date
FROM Borrow br
INNER JOIN Books b ON br.book_id = b.book_id
INNER JOIN Members m ON br.member_id = m.member_id;

SELECT b.book_name, b.author, m.member_name, m.city
FROM Borrow br
INNER JOIN Books b ON br.book_id = b.book_id
INNER JOIN Members m ON br.member_id = m.member_id;

SELECT b.book_name, m.member_name, m.city
FROM Borrow br
INNER JOIN Books b ON br.book_id = b.book_id
INNER JOIN Members m ON br.member_id = m.member_id
WHERE m.city = 'Chennai';

SELECT b.book_name, br.borrow_date
FROM Borrow br
INNER JOIN Books b ON br.book_id = b.book_id
WHERE br.member_id = 201;

SELECT DISTINCT m.member_name
FROM Borrow br
INNER JOIN Books b ON br.book_id = b.book_id
INNER JOIN Members m ON br.member_id = m.member_id
WHERE b.category = 'Technology';

SELECT b.book_name, m.member_name AS borrower
FROM Borrow br
INNER JOIN Books b ON br.book_id = b.book_id
INNER JOIN Members m ON br.member_id = m.member_id;

SELECT br.*, b.book_name, m.member_name
FROM Borrow br
INNER JOIN Books b ON br.book_id = b.book_id
INNER JOIN Members m ON br.member_id = m.member_id
ORDER BY br.borrow_date;

SELECT b.book_name, m.member_name
FROM Books b
LEFT JOIN Borrow br ON b.book_id = br.book_id
LEFT JOIN Members m ON br.member_id = m.member_id;

SELECT b.*
FROM Books b
LEFT JOIN Borrow br ON b.book_id = br.book_id
WHERE br.borrow_id IS NULL;

SELECT m.member_name, b.book_name
FROM Members m
LEFT JOIN Borrow br ON m.member_id = br.member_id
LEFT JOIN Books b ON br.book_id = b.book_id;

SELECT m.*
FROM Members m
LEFT JOIN Borrow br ON m.member_id = br.member_id
WHERE br.borrow_id IS NULL;

SELECT b.*
FROM Books b
LEFT JOIN Borrow br ON b.book_id = br.book_id
WHERE br.borrow_id IS NULL;

SELECT m.*
FROM Members m
LEFT JOIN Borrow br ON m.member_id = br.member_id
WHERE br.borrow_id IS NULL;

SELECT br.*, b.book_name
FROM Books b
RIGHT JOIN Borrow br ON b.book_id = br.book_id;

SELECT br.*, m.member_name
FROM Members m
RIGHT JOIN Borrow br ON m.member_id = br.member_id;

SELECT m.member_id, m.member_name,
       br.borrow_id, br.book_id, br.borrow_date
FROM Borrow br
RIGHT JOIN Members m ON br.member_id = m.member_id;

SELECT b.book_name, m.member_name
FROM Books b
CROSS JOIN Members m;

SELECT COUNT(*) AS total_combinations
FROM Books b
CROSS JOIN Members m;

SELECT b.book_name, m.member_name
FROM Books b
CROSS JOIN Members m
WHERE b.category = 'Technology';

SELECT m.member_id, m.member_name,
       COUNT(br.borrow_id) AS books_borrowed
FROM Members m
LEFT JOIN Borrow br ON m.member_id = br.member_id
GROUP BY m.member_id, m.member_name;

SELECT b.book_id, b.book_name,
       COUNT(br.borrow_id) AS borrower_count
FROM Books b
LEFT JOIN Borrow br ON b.book_id = br.book_id
GROUP BY b.book_id, b.book_name;

SELECT b.book_id, b.book_name,
       COUNT(br.borrow_id) AS borrow_count
FROM Books b
JOIN Borrow br ON b.book_id = br.book_id
GROUP BY b.book_id, b.book_name
ORDER BY borrow_count DESC
LIMIT 1;

SELECT m.member_id, m.member_name,
       COUNT(br.borrow_id) AS books_borrowed
FROM Members m
JOIN Borrow br ON m.member_id = br.member_id
GROUP BY m.member_id, m.member_name
HAVING COUNT(br.borrow_id) > 2;

SELECT b.category,
       COUNT(br.borrow_id) AS borrow_count
FROM Books b
JOIN Borrow br ON b.book_id = br.book_id
GROUP BY b.category;

SELECT b.category,
       COUNT(br.borrow_id) AS total_borrowed
FROM Books b
JOIN Borrow br ON b.book_id = br.book_id
GROUP BY b.category;