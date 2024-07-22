1. Write a PL/SQL block to declare a variable named "salary" of type NUMBER and assign a value of 5000 to it. Display the value of the salary variable.
SET SERVEROUTPUT ON;
DECLARE
 V_SALARY NUMBER(7, 2) := 5000;
BEGIN
 DBMS_OUTPUT.PUT_LINE('Salary is '||5000);
END;
2. Write a PL/SQL block to declare two variables, "length" and "width", both of type NUMBER. Assign values of 10 and 5 to the variables, respectively. Calculate and display the area of a rectangle using these variables.
SET SERVEROUTPUT ON;
DECLARE
 V_LENGTH NUMBER(5,2) := 10;
 V_WIDTH  NUMBER(5,2) := 5;
BEGIN
 DBMS_OUTPUT.PUT_LINE('Area is '|| V_LENGTH*V_WIDTH);
END;
3. Write a PL/SQL block to declare a variable named "message" of type VARCHAR2(100). Prompt the user to enter a message and assign it to the variable. Display the message in uppercase letters.
SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET DEFINE ON;
DECLARE
V_MESSAGE VARCHAR(100);
BEGIN
V_MESSAGE := '&Please_enter_a_message_to_display!';
DBMS_OUTPUT.PUT_LINE(UPPER(V_MESSAGE));
END;
4. Write a PL/SQL block to declare two variables, "num1" and "num2", both of type NUMBER. Prompt the user to enter values for num1 and num2. Swap the values of the variables and display the new values.
SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET DEFINE ON;
DECLARE
V_NUM1 NUMBER(10,0);
V_NUM2 NUMBER(10,0);
BEGIN
V_NUM1 := TO_NUMBER('&Enter_NUM1');
V_NUM2 := TO_NUMBER('&Enter_NUM2');
V_NUM1 := V_NUM1 - V_NUM2;
V_NUM2 := V_NUM1 + V_NUM2;
V_NUM1 := V_NUM2 - V_NUM1;
DBMS_OUTPUT.PUT_LINE('NUM1 = ' || V_NUM1 || ' NUM2 = ' || V_NUM2);
END;
5. Write a PL/SQL block to declare a variable named "emp_count" of type NUMBER and initialize it to 0. Retrieve the count of employees from the HR schema's "employees" table and assign it to the "emp_count" variable. Display the value of "emp_count".
SET SERVEROUTPUT ON;

DECLARE
V_EMP_COUNT NUMBER(10) := 0;
BEGIN
SELECT COUNT(*)
INTO V_EMP_COUNT
FROM EMPLOYEES;

DBMS_OUTPUT.PUT_LINE('Total employee count is ' || V_EMP_COUNT);

END;
6. Create a PL/SQL block to declare a variable named "dept_name" of type VARCHAR2(50). Prompt the user to enter a department name and assign it to the "dept_name" variable. Use the HR schema's "departments" table and display the details of the department entered.
SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET DEFINE ON;

DECLARE
V_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
V_DEPT_ID DEPARTMENTS.DEPARTMENT_ID%TYPE;
V_LOCATION_ID DEPARTMENTS.LOCATION_ID%TYPE;
BEGIN
V_DEPT_NAME := '&Please_enter_department_name_to_fetch_details.';

SELECT DEPARTMENT_NAME, DEPARTMENT_ID, LOCATION_ID
INTO V_DEPT_NAME, V_DEPT_ID, V_LOCATION_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = V_DEPT_NAME;
DBMS_OUTPUT.PUT_LINE('Department_id : ' || V_DEPT_ID || ' Department_name : ' || V_DEPT_NAME || ' Location_id : ' || V_LOCATION_ID );
END;
7. Write a PL/SQL block to declare a variable named "avg_salary" of type NUMBER(10,2). Calculate the average salary of all employees in the HR schema's "employees" table and assign it to the "avg_salary" variable. Display the value of "avg_salary".
SET SERVEROUTPUT ON;
DECLARE
V_AVG_SALARY NUMBER(10,2);
BEGIN
SELECT AVG(SALARY)
INTO V_AVG_SALARY
FROM EMPLOYEES;
DBMS_OUTPUT.PUT_LINE('Average salary of the employees is ' || V_AVG_SALARY);
END;
8. Create a PL/SQL block to declare a variable named "employee_name" of type VARCHAR2(100). Prompt the user to enter an employee ID and assign it to a bind variable ":emp_id". Retrieve the name of the employee with the entered ID from the HR schema's "employees" table and assign it to the "employee_name" variable. Display the value of "employee_name".
SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET DEFINE ON;

DECLARE
V_EMP_NAME EMPLOYEES.FIRST_NAME%TYPE;
V_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN

V_EMP_ID := TO_NUMBER('&Please_enter_the_employee_id.');
SELECT FIRST_NAME
INTO V_EMP_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID = V_EMP_ID;

DBMS_OUTPUT.PUT_LINE('Name of the employee corresponding to employee id '|| V_EMP_ID || ' is ' || V_EMP_NAME);

END;
9. Write a PL/SQL block to declare a variable named "new_salary" of type NUMBER(8,2). Prompt the user to enter an employee ID and a new salary value. Assign the new salary value to the employee with the entered ID in the HR schema's "employees" table. Use bind variables ":emp_id" and ":salary". Display a message indicating the successful update.
SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET DEFINE ON;

DECLARE
V_NEW_SALARY EMPLOYEES.SALARY%TYPE;
V_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
BEGIN

V_EMP_ID := TO_NUMBER('&ENTER_EMPLOYEE_ID');
V_NEW_SALARY := TO_NUMBER('&ENTER_NEW_SALARY');
UPDATE EMPLOYEES
SET SALARY=V_NEW_SALARY
WHERE EMPLOYEE_ID = V_EMP_ID;

DBMS_OUTPUT.PUT_LINE('UPDATE SUCCESSFUL!');

END;