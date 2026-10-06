-- A4: A1 and A2 rewritten WITHOUT GOTO (structured IF / ELSIF / CONTINUE)
SET SERVEROUTPUT ON

-- A1 rewritten
DECLARE
  v_num NUMBER := 15;
BEGIN
  IF v_num = 0 THEN
    DBMS_OUTPUT.PUT_LINE('The number is ZERO');
  ELSE
    IF v_num > 0 THEN
      DBMS_OUTPUT.PUT_LINE(v_num || ' is POSITIVE');
    ELSE
      DBMS_OUTPUT.PUT_LINE(v_num || ' is NEGATIVE');
    END IF;
    IF MOD(v_num, 2) = 0 THEN
      DBMS_OUTPUT.PUT_LINE(v_num || ' is EVEN');
    ELSE
      DBMS_OUTPUT.PUT_LINE(v_num || ' is ODD');
    END IF;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
/

-- A2 rewritten: CONTINUE replaces GOTO next_employee
DECLARE
  v_new NUMBER;
BEGIN
  FOR r IN (SELECT employee_id, first_name, salary
            FROM employees ORDER BY employee_id) LOOP

    IF r.salary IS NULL OR r.salary <= 0 THEN
      DBMS_OUTPUT.PUT_LINE(r.first_name || ': skipped (invalid salary)');
      CONTINUE;
    END IF;

    IF r.salary < 50000 THEN
      v_new := r.salary + r.salary * 0.10;
    ELSE
      v_new := r.salary + 5000;
    END IF;

    IF v_new > 100000 THEN
      v_new := 100000;
      DBMS_OUTPUT.PUT_LINE(r.first_name || ': Salary capped at 100,000');
    ELSE
      DBMS_OUTPUT.PUT_LINE(r.first_name || ': ' || r.salary || ' -> ' || v_new);
    END IF;
  END LOOP;
END;
/
