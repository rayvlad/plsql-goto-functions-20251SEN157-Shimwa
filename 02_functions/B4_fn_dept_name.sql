-- B4: Department name from department_id ('Unknown' if NULL or not found)
-- NOT deterministic: it reads a table whose data can change (lecture slide 13).
CREATE OR REPLACE FUNCTION fn_dept_name (p_department_id IN NUMBER)
RETURN VARCHAR2
IS
  v_name departments.department_name%TYPE;
BEGIN
  IF p_department_id IS NULL THEN
    RETURN 'Unknown';
  END IF;
  SELECT department_name INTO v_name
  FROM   departments
  WHERE  department_id = p_department_id;
  RETURN v_name;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'Unknown';
END fn_dept_name;
/
SHOW ERRORS
