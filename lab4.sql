CREATE DATABASE lab4;

CREATE TABLE Warehouses(
    code INTEGER PRIMARY KEY,
    location VARCHAR(255),
    capacity INTEGER
);

CREATE TABLE Boxes(
    code VARCHAR(4) PRIMARY KEY,
    contents VARCHAR(255),
    value_real INTEGER,
    warehouse INTEGER,
    FOREIGN KEY (warehouse) REFERENCES Warehouses(code)
);

INSERT INTO Warehouses(code, location, capacity) VALUES(1, 'Chicago', 3);
INSERT INTO Warehouses(code, location, capacity) VALUES(2, 'Chicago', 4);
INSERT INTO Warehouses(code, location, capacity) VALUES(3, 'New York', 7);
INSERT INTO Warehouses(code, location, capacity) VALUES(4, 'Los Angles', 2);
INSERT INTO Warehouses(code, location, capacity) VALUES(5, 'San Fransisco', 8);

INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES('OMN7', 'Rocks', 180, 3);
INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES('4H8P', 'Rocks', 250, 1);
INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES('4RT3', 'Scissors', 190, 4);
INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES('7G3H', 'Rocks', 200, 1);
INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES('8JN6', 'Papers', 75, 1);
INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES('8Y6U', 'Papers', 50, 3);
INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES('9J6F', 'Papers', 175, 2);
INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES('LLO8', 'Rocks', 140, 4);
INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES('POH6', 'Scissors', 125, 1);
INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES('P2T6', 'Scissors', 150, 2);
INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES('TU55', 'Papers', 90, 5);

SELECT * FROM Warehouses;

SELECT * FROM Boxes WHERE value_real > 150;

SELECT DISTINCT contents FROM Boxes;

SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse;

SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse
HAVING COUNT(*) > 2;

INSERT INTO Warehouses(code, location, capacity)  VALUES (6, 'New York', 3);

INSERT INTO Boxes(code, contents, value_real, warehouse) VALUES ('H5RT', 'Papers', 200, 2);

UPDATE Boxes
SET value_real = value_real * 0.85
WHERE code = (SELECT code
              FROM Boxes
              ORDER BY value_real DESC
              LIMIT 1 OFFSET 2
);

DELETE FROM Boxes
WHERE value_real < 150;

DELETE FROM Boxes
USING Warehouses
WHERE warehouse = Warehouses.code
AND Warehouses.location = 'New York'
RETURNING Boxes.*;
