-- A1: Number Classifier (uses GOTO)
-- Classifies a number as positive / negative / zero, then (if not zero) even / odd.
SET SERVEROUTPUT ON
DECLARE
  v_num NUMBER := 15;   -- change this value to test: 15, -8, 0, 22
BEGIN
  IF v_num = 0 THEN
    GOTO zero_case;
  ELSIF v_num < 0 THEN
    GOTO negative_case;
  END IF;

  DBMS_OUTPUT.PUT_LINE(v_num || ' is POSITIVE');
  GOTO check_parity;

  <<negative_case>>
  DBMS_OUTPUT.PUT_LINE(v_num || ' is NEGATIVE');
  GOTO check_parity;

  <<zero_case>>
  DBMS_OUTPUT.PUT_LINE('The number is ZERO');
  GOTO finish;

  <<check_parity>>
  IF MOD(v_num, 2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE(v_num || ' is EVEN');
  ELSE
    DBMS_OUTPUT.PUT_LINE(v_num || ' is ODD');
  END IF;

  <<finish>>
  DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
/
