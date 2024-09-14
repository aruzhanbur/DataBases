CREATE TABLE users(
    id integer,
    firstName varchar(50),
    lastName varchar(50)
);

ALTER TABLE users ADD COLUMN isAdmin INTEGER;

ALTER TABLE users ALTER COLUMN isAdmin TYPE BOOLEAN;

ALTER TABLE users ALTER COLUMN isAdmin SET DEFAULT 0;

ALTER TABLE users ADD PRIMARY KEY(id);

CREATE TABLE tasks(
    id integer,
    name varchar(50),
    user_id integer
);

DROP TABLE users;
DROP TABLE tasks;