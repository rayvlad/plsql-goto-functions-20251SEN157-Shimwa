-- B2: Complete years of service from hire date (future hire date -> 0)
-- NOT deterministic: it uses SYSDATE, so the result changes over time.
CREATE OR REPLACE FUNCTION fn_years_of_service (p_hire_date IN DATE)
RETURN NUMBER
IS
BEGIN
  IF p_hire_date IS NULL THEN
    RAISE_APPLICATION_ERROR(-20002, 'Hire date cannot be NULL.');
  END IF;
  IF p_hire_date > SYSDATE THEN
    RETURN 0;
  END IF;
  RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, p_hire_date) / 12);
END fn_years_of_service;
/
SHOW ERRORS
