-- A2: Salary Review (uses GOTO to skip invalid employees)
-- Rules (from the lecture's salary adjustment task):
--   salary < 50,000   -> increase by a bonus (10% of salary)
--   salary >= 50,000  -> increase by 5,000
--   adjusted > 100,000 -> cap at 100,000 and notify
-- Employees with a missing/zero salary are skipped with GOTO.
-- (Display only; nothing is updated in the table.)
SET SERVEROUTPUT ON
DECLARE
  v_bonus NUMBER;
  v_new   NUMBER;
BEGIN
  FOR r IN (SELECT employee_id, first_name, salary
            FROM employees ORDER BY employee_id) LOOP

    IF r.salary IS NULL OR r.salary <= 0 THEN
      DBMS_OUTPUT.PUT_LINE(r.first_name || ': skipped (invalid salary)');
      GOTO next_employee;
    END IF;

    IF r.salary < 50000 THEN
      v_bonus := r.salary * 0.10;      -- same idea as calculate_bonus in the lecture
      v_new   := r.salary + v_bonus;
    ELSE
      v_new   := r.salary + 5000;
    END IF;

    IF v_new > 100000 THEN
      v_new := 100000;
      DBMS_OUTPUT.PUT_LINE(r.first_name || ': Salary capped at 100,000');
    ELSE
      DBMS_OUTPUT.PUT_LINE(r.first_name || ': ' || r.salary || ' -> ' || v_new);
    END IF;

    <<next_employee>>
    NULL;   -- a label must be followed by a statement
  END LOOP;
END;
/
