-- Setup: DEPARTMENTS and EMPLOYEES tables with sample data
-- Column names follow the lecture (employee_id, salary, first_name ...).
-- "salary" is the MONTHLY salary. hire_date was added for B2 (years of service).
BEGIN EXECUTE IMMEDIATE 'DROP TABLE employees PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE departments PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE departments (
  department_id   NUMBER PRIMARY KEY,
  department_name VARCHAR2(50) NOT NULL
);

CREATE TABLE employees (
  employee_id   NUMBER PRIMARY KEY,
  first_name    VARCHAR2(50) NOT NULL,
  last_name     VARCHAR2(50) NOT NULL,
  salary        NUMBER(12,2),
  hire_date     DATE,
  department_id NUMBER REFERENCES departments(department_id)
);

INSERT INTO departments VALUES (10, 'Finance');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'HR');

INSERT INTO employees VALUES (1, 'Alice',   'Uwase',     120000, DATE '2015-06-01', 10);
INSERT INTO employees VALUES (2, 'Jean',    'Mugisha',    60000, DATE '2020-03-15', 20);
INSERT INTO employees VALUES (3, 'Grace',   'Ingabire',   45000, DATE '2023-09-01', 10);
INSERT INTO employees VALUES (4, 'Eric',    'Habimana',   30000, DATE '2026-05-10', 30);
INSERT INTO employees VALUES (7, 'Sandra',  'Uwimana',    98000, DATE '2018-11-05', NULL);
-- Intentionally "bad" rows so the payroll validator (C1) has something to catch
INSERT INTO employees VALUES (5, 'Diane',   'Mukamana',       0, DATE '2022-01-10', 20);
INSERT INTO employees VALUES (6, 'Patrick', 'Niyonzima',  70000, DATE '2027-01-01', 30);
COMMIT;

SELECT * FROM employees ORDER BY employee_id;
