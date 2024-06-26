SELECT last_name, DATEDIFF(MONTH, hire_date, getdate()) MONTHS_WORKED
FROM EMPLOYEES
ORDER BY MONTHS_WORKED

SELECT last_name, salary*3 AS "Dream Salaries"
FROM EMPLOYEES

SELECT last_name, RIGHT(REPLICATE('$', 15) + CAST(salary AS VARCHAR(15)), 15) AS SALARY
FROM employees;

SELECT last_name, hire_date, DATEPART(WEEKDAY, hire_date) DAY
FROM EMPLOYEES
ORDER BY DAY

SELECT last_name,
CASE 
    WHEN manager_id IS NULL THEN 1
    ELSE manager_id
END AS MANAGER_ID
FROM employees

SELECT last_name, REPLICATE('*', salary/1000) EMPLOYEES_AND_THEIR_SALARIES
FROM employees
ORDER BY salary DESC

SELECT e.employee_id, e.job_id, j.job_title, 
CASE
    WHEN j.job_title = 'President' THEN 'A'
    WHEN j.job_title = 'Stock Manager' THEN 'B'
    WHEN j.job_title = 'Programmer' THEN 'C'
    WHEN j.job_title = 'Sales Representative' THEN 'D'
    WHEN j.job_title = 'Stock Clerk' THEN 'E'
    ELSE '0'
END AS GRADE
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
