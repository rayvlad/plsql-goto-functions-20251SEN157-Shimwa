-- Tests for B1-B4
SET SERVEROUTPUT ON
SELECT fn_annual_salary(450000)  AS annual_450k   FROM dual;   -- 5,400,000
SELECT fn_calculate_tax(500000)  AS tax_500k      FROM dual;   -- 0
SELECT fn_calculate_tax(1000000) AS tax_1m        FROM dual;   -- 28,000
SELECT fn_calculate_tax(2000000) AS tax_2m        FROM dual;   -- 208,000
SELECT fn_calculate_tax(3000000) AS tax_3m        FROM dual;   -- 468,000
SELECT fn_years_of_service(DATE '2020-03-15') AS yrs FROM dual;
SELECT fn_years_of_service(DATE '2099-01-01') AS yrs_future FROM dual; -- 0
SELECT fn_dept_name(20)  AS known_dept   FROM dual;            -- IT
SELECT fn_dept_name(999) AS unknown_dept FROM dual;            -- Unknown

-- Exception tests (each should print the expected error)
BEGIN
  DBMS_OUTPUT.PUT_LINE(fn_annual_salary(-5));
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('B1 error caught: ' || SQLERRM);
END;
/
BEGIN
  DBMS_OUTPUT.PUT_LINE(fn_years_of_service(NULL));
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('B2 error caught: ' || SQLERRM);
END;
/
BEGIN
  DBMS_OUTPUT.PUT_LINE(fn_calculate_tax(-1));
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('B3 error caught: ' || SQLERRM);
END;
/
