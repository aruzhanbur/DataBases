CREATE DATABASE lab6;

CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);

INSERT INTO locations (street_address, postal_code, city, state_province) VALUES
('Abay St 34', '010000', 'Nur-Sultan', 'Akmola'),
('Al-Farabi Ave 19', '050000', 'Almaty', 'Almaty'),
('Satpayev St 77', '090000', 'Atyrau', 'Atyrau'),
('Respublika Ave 15', '130000', 'Aktau', 'Mangystau'),
('Tole Bi St 48', '060000', 'Shymkent', 'Turkistan'),
('Pushkin St 11', '070000', 'Taraz', 'Zhambyl'),
('Auezov St 23', '140000', 'Oskemen', 'East Kz'),
('Abaya St 91', '080000', 'Kyzylorda', 'Kzlrd'),
('Baitursynov St 35', '120000', 'Karagandy', 'Krgnd'),
('Mira St 25', '100000', 'Kostanay', 'Kstn');

INSERT INTO departments (department_name, budget, location_id) VALUES
('Finance', 200000, 1),
('Marketing', 150000, 2),
('Sales', 120000, 3),
('Human Resources', 100000, 4),
('IT', 180000, 5),
('Customer Service', 110000, 6),
('R&D', 250000, 7),
('Logistics', 130000, 8),
('Legal', 90000, 9),
('Public Relations', 80000, 10);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id) VALUES
('Aidos', 'Akhmetov', 'aidos.akhmetov@example.com', '+7 701 123 4567', 75000, 1),
('Aruzhan', 'Baimagambetova', 'aruzhan.baimagambetova@example.com', '+7 702 123 4567', 72000, 2),
('Saniya', 'Dauletova', 'saniya.dauletkyzy@example.com', '+7 703 123 4567', 68000, 3),
('Amina', 'Kusainova', 'amina.kusainova@example.com', '+7 704 123 4567', 71000, 4),
('Zhandos', 'Saparov', 'aslan.saparov@example.com', '+7 705 123 4567', 90000, 5),
('Pakita', 'Nurpeisova', 'pakita.nurpeisova@example.com', '+7 706 123 4567', 67000, 6),
('Zhanbolat', 'Rakhimzhanov', 'zhanbolat.rakhimzhanov@example.com', '+7 707 123 4567', 86000, 7),
('Madina', 'Utegenova', 'madina.utegenova@example.com', '+7 708 123 4567', 69000, 8),
('Nursultan', 'Mansurov', 'nurs.mansurov@example.com', '+7 709 123 4567', 64000, 9),
('Aboba', 'Yeleussizova', 'aboba.yeleussizova@example.com', '+7 710 123 4567', 71000, 10);

SELECT --3
    employees.first_name, employees.last_name, employees.department_id, d.department_name
FROM employees
JOIN departments d on employees.department_id = d.department_id

SELECT --4
    employees.first_name, employees.last_name, employees.department_id, d.department_name
FROM employees
JOIN departments d on employees.department_id = d.department_id
WHERE employees.department_id IN (40, 80);

SELECT --5
    employees.first_name, employees.last_name, departments.department_name, locations.city, locations.state_province
FROM employees
JOIN departments ON employees.department_id = departments.department_id
JOIN locations ON departments.location_id = locations.location_id;

SELECT --6
    departments.department_id, departments.department_name, employees.first_name, employees.last_name
FROM departments
LEFT JOIN employees ON departments.department_id = employees.department_id;

SELECT --7
    employees.first_name, employees.last_name, employees.department_id, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;