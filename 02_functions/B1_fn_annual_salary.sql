-- B1: Annual salary = monthly salary x 12
-- DETERMINISTIC: the same input always gives the same output (lecture slides 11-13).
CREATE OR REPLACE FUNCTION fn_annual_salary (p_salary IN NUMBER)
RETURN NUMBER
DETERMINISTIC
IS
BEGIN
  IF p_salary IS NULL OR p_salary < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Salary must be a non-negative number.');
  END IF;
  RETURN p_salary * 12;
END fn_annual_salary;
/
SHOW ERRORS
