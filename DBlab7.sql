CREATE INDEX country_name_idx ON countries (name); --1

CREATE INDEX full_name_idx ON employees (name, surname); --2

CREATE UNIQUE INDEX unique_salary_idx ON employees (salary); --3

CREATE INDEX employee_name_prefix_idx ON employees (substring(name FROM 1 FOR 4)); --4

CREATE INDEX employee_dep_id_ix ON employees (department_id);
CREATE INDEX depart_department_id_idx ON departments (department_id);
CREATE INDEX dept_budget_idx ON departments (budget);
CREATE INDEX emp_salary_idx ON employees (salary); --5