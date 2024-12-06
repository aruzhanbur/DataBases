CREATE TABLE Books (
book_id SERIAL PRIMARY KEY,
title VARCHAR(100),
author VARCHAR(100),
price DECIMAL(10, 2),
quantity INTEGER
);

CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100)
);

CREATE TABLE Orders (
order_id SERIAL PRIMARY KEY,
book_id INTEGER,
customer_id INTEGER,
order_date DATE,
quantity INTEGER,
FOREIGN KEY (book_id) REFERENCES Books(book_id),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Books (book_id, title, author, price, quantity) VALUES
    (1, 'Database 101', 'A. Smith', 40.00, 10),
    (2, 'Learn SQL', 'B. Johnson', 35.00, 15),
    (3, 'Advanced DB', 'C. Lee', 50.00, 5);

INSERT INTO Customers (customer_id, name, email) VALUES
    (101, 'John Doe', 'johndoe@example.com'),
    (102, 'Jane Doe', 'janedoe@example.com');

BEGIN; --task1

INSERT INTO Orders (book_id, customer_id, order_date, quantity)
VALUES (1, 101, CURRENT_DATE, 2);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;

COMMIT;

BEGIN; --task2
DO $$
BEGIN
    IF (SELECT quantity FROM Books WHERE book_id = 3) < 2 THEN
        RAISE EXCEPTION 'Not enough stock';
    ELSE
        INSERT INTO Orders (order_id, book_id, customer_id, order_date, quantity)
        VALUES (2, 3, 102, CURRENT_DATE, 10);

        UPDATE Books
        SET quantity = quantity - 2
        WHERE book_id = 3;
    END IF;
END $$;

ROLLBACK;


SET TRANSACTION ISOLATION LEVEL READ COMMITTED; --task3

BEGIN;

UPDATE Books
SET price = price * 2
WHERE book_id = 3;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN;

SELECT price FROM Books WHERE book_id = 3;

COMMIT;

BEGIN; --task4

UPDATE Customers
SET email = 'newemail@example.com'
WHERE customer_id = 102;

COMMIT;

SELECT * FROM Customers WHERE customer_id = 101;