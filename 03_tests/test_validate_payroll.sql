-- Tests for C1
SET SERVEROUTPUT ON
SET LINESIZE 200
COL result FORMAT A55

SELECT employee_id, first_name, fn_validate_payroll(employee_id) AS result
FROM   employees
ORDER  BY employee_id;
-- Expected: 1-4 VALID | 5 salary invalid | 6 future hire date | 7 no department

SELECT fn_validate_payroll(999) AS result FROM dual;   -- employee not found
