-- 1

-- SELECT e.last_name, d.department_id, d.department_name
-- FROM employees e
-- JOIN departments d 
-- ON e.department_id=d.department_id


-- 2

-- SELECT DISTINCT j.job_title, d.department_id, d.department_name, l.city
-- FROM employees e
-- JOIN departments d
-- ON e.department_id = d.department_id
-- JOIN jobs j
-- ON j.job_id = e.job_id
-- join locations l
-- ON l.location_id = d.location_id
-- WHERE d.department_id = 8


-- 3

-- SELECT e.last_name, d.department_name, d.location_id, l.city
-- FROM employees e
-- JOIN departments d
-- ON e.department_id=d.department_id
-- JOIN locations l
-- ON d.location_id=l.location_id


-- 4

-- SELECT e.last_name, d.department_name
-- from employees e
-- JOIN departments d
-- ON e.department_id=d.department_id
-- WHERE last_name LIKE '%a%'


--5

-- SELECT e.last_name, j.job_title, d.department_id, d.department_name
-- FROM employees e
-- JOIN departments d
-- ON e.department_id=d.department_id
-- JOIN jobs j
-- ON e.job_id=j.job_id
-- JOIN locations l
-- ON l.location_id=d.location_id
-- WHERE l.city='Toronto'


-- 6

-- SELECT e.last_name Employee, e.employee_id Emp#, e.manager_id Mgr#, m.last_name Manager 
-- FROM employees e 
-- JOIN employees m 
-- ON e.manager_id=m.employee_id


-- 7

-- SELECT e.last_name Employee, e.employee_id Emp#, e.manager_id Mgr#, m.last_name Manager 
-- FROM employees e 
-- LEFT JOIN employees m 
-- ON e.manager_id=m.employee_id

-- 8



-- 10

-- SELECT last_name, hire_date
-- FROM employees
-- WHERE hire_date > (
--     SELECT hire_date
--     FROM employees
--     WHERE first_name='Daniel'
-- )


-- 11

-- SELECT e.last_name Emp, e.hire_date EmpHireDate, m.last_name Manager, m.hire_date 
-- FROM employees e 
-- JOIN employees m 
-- ON e.manager_id=m.employee_id
-- WHERE m.hire_date>e.hire_date


--12

-- TRUE
-- FALSE
-- FALSE


-- 13

-- SELECT MAX(salary) Maximum, MIN(salary) Minimum, ROUND(AVG(salary), 0) Average, SUM(salary) Sum
-- FROM employees

-- 14

-- SELECT MAX(salary) Maximum, MIN(salary) Minimum, ROUND(AVG(salary), 0) Average, SUM(salary) Sum, job_id
-- FROM employees
-- GROUP BY job_id

-- 15

-- SELECT COUNT(*), job_id
-- FROM employees
-- GROUP BY job_id


-- 16

-- SELECT COUNT(*) AS 'Number of Managers' 
-- FROM(
--     SELECT COUNT(DIStinct manager_id) AS ManagersCount
--     FROM employees
--     GROUP BY manager_id
-- ) AS ManagersGroup


-- 17

-- SELECT MAX(salary) - MIN(salary), job_id
-- FROM employees
-- GROUP BY job_id


-- 18

-- SELECT manager_id, MIN(salary) MinSalary
-- FROM employees
-- WHERE manager_id IS NOT NULL
-- GROUP BY manager_id
-- HAVING MIN(salary)>6000
-- ORDER BY MinSalary DESC


-- 19

-- SELECT d.department_name 'Name', d.location_id 'Location', count(*) 'Number of people', AVG(salary) Salary
-- FROM employees e
-- JOIN departments d
-- ON e.department_id=d.department_id
-- GROUP BY d.department_name, d.location_id


-- 20

-- SELECT j.job_title, sum(e.salary), sum(e.salary*12) JOB_ANN_SAL
-- FROM employees e
-- JOIN jobs j
-- ON e.job_id = j.job_id
-- WHERE e.department_id IN (2, 5, 8, 9)
-- GROUP BY j.job_title


-- 21

-- SELECT e.last_name, j.job_title, d.department_name
-- FROM employees e
-- JOIN departments d
-- ON e.department_id = d.department_id
-- JOIN locations l
-- ON l.location_id = d.location_id
-- JOIN jobs j
-- ON j.job_id = e.job_id
-- WHERE l.city = 'Oxford'


-- 22

-- SELECT d.department_name, e.last_name, e.hire_date, e.salary, e.salary*12 ANNSAL, l.city
-- FROM employees e
-- JOIN departments d
-- ON e.department_id = d.department_id
-- JOIN locations l
-- ON l.location_id = d.location_id
-- WHERE l.city = 'Toronto'