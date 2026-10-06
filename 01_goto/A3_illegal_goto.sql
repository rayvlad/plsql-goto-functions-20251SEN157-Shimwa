-- A3: Illegal GOTO and the fix
SET SERVEROUTPUT ON

-- PART 1: ILLEGAL. You cannot jump INTO an IF/LOOP/nested block from outside.
-- Expected error: PLS-00375: illegal GOTO statement; this GOTO cannot branch to label 'INSIDE_IF'
BEGIN
  GOTO inside_if;
  IF TRUE THEN
    <<inside_if>>
    DBMS_OUTPUT.PUT_LINE('This label is inside the IF block');
  END IF;
END;
/

-- PART 2: FIX. Put the label at the same level (or an enclosing level) as the GOTO.
DECLARE
  v_flag BOOLEAN := TRUE;
BEGIN
  IF v_flag THEN
    GOTO show_message;      -- jumping OUT of an IF to an outer label is allowed
  END IF;
  DBMS_OUTPUT.PUT_LINE('This line is skipped');

  <<show_message>>
  DBMS_OUTPUT.PUT_LINE('Fixed: label is in the enclosing block, so GOTO works');
END;
/

-- Other illegal GOTOs: into an exception handler, or out of a subprogram.
