--Write a query to calculate the average salary for each department and rank the departments based on their average salary. 

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY), 0) AVG_SAL, RANK() OVER(
ORDER BY AVG(SALARY) DESC
) AS RN
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY AVG_SAL DESC

--Write a query to calculate the tenure of each employee in years and rank employees by their tenure within each department 

SELECT EMPLOYEE_ID, DEPARTMENT_ID, HIRE_DATE, ROUND((SYSDATE-HIRE_DATE)/365, 0) AS YEARS,
DENSE_RANK() OVER (
PARTITION BY DEPARTMENT_ID
ORDER BY HIRE_DATE
) AS RN
FROM EMPLOYEES

--Write a query to calculate the difference in salary between each employee and the next hired employee. 

SELECT EMPLOYEE_ID, HIRE_DATE, SALARY,
LAG (SALARY, 1) OVER(
ORDER BY HIRE_DATE
) AS PREV_EMP_SAL,
ABS(SALARY-LAG (SALARY, 1) OVER(
ORDER BY HIRE_DATE
)) AS DIFF
FROM EMPLOYEES

--Write a query to find the largest salary increase between consecutive hires. 

SELECT MAX(DIFF)
FROM(SELECT (SALARY-LAG (SALARY, 1) OVER(
ORDER BY HIRE_DATE
)) AS DIFF FROM EMPLOYEES)

--Write a query to track the salary changes over time for each employee, showing the current and previous salary with the change in percentage. 