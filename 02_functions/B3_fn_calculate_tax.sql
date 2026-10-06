-- B3: Progressive tax on ANNUAL salary.
-- ASSUMED brackets (replace with the ones given in class if different):
--   0 - 720,000           : 0%
--   720,001 - 1,200,000   : 10%
--   1,200,001 - 2,400,000 : 20%
--   above 2,400,000       : 30%
-- DETERMINISTIC: depends only on the input.
CREATE OR REPLACE FUNCTION fn_calculate_tax (p_annual_salary IN NUMBER)
RETURN NUMBER
DETERMINISTIC
IS
  v_tax NUMBER;
BEGIN
  IF p_annual_salary IS NULL OR p_annual_salary < 0 THEN
    RAISE_APPLICATION_ERROR(-20003, 'Annual salary must be a non-negative number.');
  END IF;

  IF p_annual_salary <= 720000 THEN
    v_tax := 0;
  ELSIF p_annual_salary <= 1200000 THEN
    v_tax := (p_annual_salary - 720000) * 0.10;
  ELSIF p_annual_salary <= 2400000 THEN
    v_tax := (1200000 - 720000) * 0.10 + (p_annual_salary - 1200000) * 0.20;
  ELSE
    v_tax := (1200000 - 720000) * 0.10 + (2400000 - 1200000) * 0.20
             + (p_annual_salary - 2400000) * 0.30;
  END IF;
  RETURN ROUND(v_tax, 2);
END fn_calculate_tax;
/
SHOW ERRORS
