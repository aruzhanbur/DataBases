CREATE DATABASE lab8;

CREATE TABLE customers(
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100),
    grade INTEGER,
    salesman_id INTEGER
);

CREATE TABLE orders(
    ord_no INTEGER PRIMARY KEY,
    purchase_amt DOUBLE PRECISION,
    ord_date DATE,
    customer_id INTEGER,
    salesman_id INTEGER,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(salesman_id) REFERENCES salesmen(salesman_id)
);

CREATE TABLE salesmen (
    salesman_id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    commission DOUBLE PRECISION
);

INSERT INTO customers VALUES(3002, 'Rick Rimando', 'New York', 100, 5001);
INSERT INTO customers VALUES(3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customers VALUES(3001, 'Brad Guzan', 'London', null, 5005);
INSERT INTO customers VALUES(3004, 'Fabian Johns', 'Paris', 300, 5006);
INSERT INTO customers VALUES(3007, 'Brad Davis', 'New York', 200, 5003);
INSERT INTO customers VALUES(3009, 'Geoff Camero', 'Berlin', 100, 5003);
INSERT INTO customers VALUES(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);

INSERT INTO salesmen (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Berlin', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

CREATE ROLE junior_dev LOGIN; --3

CREATE VIEW ny_salesmen AS
SELECT salesmen.salesman_id, salesmen.name, salesmen.city
FROM salesmen
WHERE city = 'New York'; --4

CREATE VIEW salesman_customer AS
SELECT o.ord_no, o.purchase_amt, c.customer_name, s.name
FROM orders o
JOIN customers c on o.customer_id = c.customer_id
JOIN salesmen s on o.salesman_id = s.salesman_id;

GRANT ALL PRIVILEGES ON salesman_customer TO junior_dev; --5

CREATE VIEW customers_highest_grade AS
SELECT customer_name, customer_id, city, grade
FROM customers
WHERE grade = (SELECT MAX(grade) FROM customers);

GRANT SELECT ON customers_highest_grade TO junior_dev; --6

CREATE VIEW num_of_salesman AS
SELECT city, COUNT(salesman_id) AS salesman_num
FROM salesmen
GROUP BY city; --7

CREATE VIEW salesmen_customer AS
SELECT s.salesman_id, s.name AS salesmen_name
FROM salesmen s
JOIN customers c on s.salesman_id = c.salesman_id
GROUP BY s.salesman_id
HAVING COUNT(c.customer_id) > 1; --8

CREATE ROLE intern;

GRANT junior_dev To intern; --9