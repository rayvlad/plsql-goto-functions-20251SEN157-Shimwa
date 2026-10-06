# PL/SQL GOTO Statements and Functions

- **Course:** Database Development with PL/SQL (INSY 8311)
- **Student:** Shimwa Ray Vladan  | **ID:** 20251SEN157
- **Assignment:** Individual Assignment III

## Contents
| Folder | Files |
|---|---|
| `00_setup` | `create_tables.sql` (EMPLOYEES, DEPARTMENTS + sample data) |
| `01_goto` | A1 classifier, A2 salary review, A3 illegal GOTO + fix, A4 rewrite without GOTO |
| `02_functions` | B1 annual salary, B2 years of service, B3 tax, B4 dept name, C1 payroll validator |
| `03_tests` | B5 functions in SELECT, function tests, payroll validator tests |
| `screenshots` | Output screenshots for A1, A2, A3, A4, B5, C1 |
| `docs` | `REFLECTION.md` |

## How to run
1. Run `00_setup/create_tables.sql`
2. Run the functions in `02_functions/` (B1 -> B4, then C1)
3. Run the programs in `01_goto/`
4. Run the tests in `03_tests/`
5. Verify results and take screenshots

## Assumptions
- Table and column names follow the Lecture 06 slides (`employee_id`, `salary`, `first_name`). `hire_date` and `department_id` were added because B2 and B4 need them. `salary` is monthly.
- A2 uses the salary-adjustment rules from the lecture (under 50,000: 10% bonus; otherwise +5,000; cap at 100,000).
- B3 tax brackets are assumed (see comments in the file).
- Sample data includes deliberately invalid rows to test C1.

## Notes (AI use)
 "Used Claude to generate a first draft of the SQL files after creating and populating the tables; I then reviewed, ran, and tested everything myself and can explain every line."

