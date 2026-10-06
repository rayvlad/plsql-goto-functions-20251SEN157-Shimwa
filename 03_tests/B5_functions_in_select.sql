-- B5: Using the functions inside SQL (SELECT, WHERE)
SET LINESIZE 200
COL first_name FORMAT A10
COL dept FORMAT A10

SELECT employee_id,
       first_name,
       salary,
       fn_annual_salary(salary)                   AS annual_salary,
       fn_years_of_service(hire_date)             AS years_service,
       fn_calculate_tax(fn_annual_salary(salary)) AS annual_tax,
       fn_dept_name(department_id)                AS dept
FROM   employees
ORDER  BY employee_id;

-- Functions also work in WHERE / ORDER BY
SELECT first_name, fn_dept_name(department_id) AS dept
FROM   employees
WHERE  fn_dept_name(department_id) = 'IT';
