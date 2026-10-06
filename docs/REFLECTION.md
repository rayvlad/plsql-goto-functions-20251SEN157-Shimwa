# Reflection (C2)

1. **GOTO:** GOTO felt useful in A1 and A2 because it allowed the program to jump directly to a specific part of the code when a condition was met. However, it made the code harder to read because you have to keep looking around to see where the program is jumping.

2. **Illegal GOTO (A3):** In A3, I got an error because the GOTO was trying to jump to a label that was outside its allowed scope. This showed me that in PL/SQL, a GOTO cannot just jump inside an if statement. 

3. **Without GOTO (A4):** I found the IF/CONTINUE version easier to understand than the GOTO version. It was more straightforward because the program follows the normal order of the code instead of jumping to different places.

4. **Functions:** A function is better than repeating the same calculation because I can write the calculation once and use it whenever I need it. A function returns a value, while a procedure mainly performs an action and does not have to return a value.

5. **Functions in SQL (B5):** I noticed that functions can be called directly inside a SELECT statement, which makes it easy to use the result of a calculation with table data. A function that performs INSERT or UPDATE cannot normally be used in a SELECT because those operations change data instead of just returning a result.

6. **DETERMINISTIC:** A function can be DETERMINISTIC when it gives the same result every time it receives the same input. B2 uses SYSDATE, so its result can change depending on the current date and should not be DETERMINISTIC. B4 reads data from a table, so its result can also change when the table data changes and should not be DETERMINISTIC

7. **Challenges & learning:** The hardest part for me was understanding how GOTO, functions, and exception handling work together. I solved this by going through the code step by step, testing it, looking at the errors, and fixing them. This helped me understand not just how to write the code, but also why it works.

