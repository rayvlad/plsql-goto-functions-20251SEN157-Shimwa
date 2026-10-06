-- C1: Payroll validator (combines a function, GOTO, and exception handling)
-- Returns 'VALID' or 'INVALID: <reason>'. The first failed check jumps (GOTO) to the end.
CREATE OR REPLACE FUNCTION fn_validate_payroll (p_employee_id IN NUMBER)
RETURN VARCHAR2
IS
  v_emp      employees%ROWTYPE;
  v_dept_cnt NUMBER;
  v_result   VARCHAR2(200) := 'VALID';
BEGIN
  SELECT * INTO v_emp FROM employees WHERE employee_id = p_employee_id;

  IF v_emp.salary IS NULL OR v_emp.salary <= 0 THEN
    v_result := 'INVALID: salary must be greater than 0';
    GOTO done;
  END IF;

  IF v_emp.hire_date IS NULL OR v_emp.hire_date > SYSDATE THEN
    v_result := 'INVALID: hire date is missing or in the future';
    GOTO done;
  END IF;

  IF v_emp.department_id IS NULL THEN
    v_result := 'INVALID: employee has no department';
    GOTO done;
  END IF;

  SELECT COUNT(*) INTO v_dept_cnt
  FROM   departments
  WHERE  department_id = v_emp.department_id;
  IF v_dept_cnt = 0 THEN
    v_result := 'INVALID: department does not exist';
    GOTO done;
  END IF;

  <<done>>
  RETURN v_result;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'INVALID: employee not found';
  WHEN OTHERS THEN
    RETURN 'ERROR: ' || SQLERRM;
END fn_validate_payroll;
/
SHOW ERRORS
