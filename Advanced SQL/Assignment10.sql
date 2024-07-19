SET SERVEROUTPUT ON;
--1. Write a PL/SQL trigger named "update_salary_trigger" that automatically updates the "new_salary" column in the "employee"
--table with a 10% increase whenever a new record is inserted into the "salary_change" table.
--CREATE TABLE SALARY_CHANGE
--  (
--    EMPLOYEE_ID NUMBER PRIMARY KEY,
--    INC_DATE DATE DEFAULT SYSDATE
--  );
--BEGIN
--  INSERT INTO salary_change
--    (employee_id
--    ) VALUES
--    (108
--    );
--END;
--/
--CREATE OR REPLACE TRIGGER UPDATE_SALARY_TRIGGER AFTER
--  INSERT ON SALARY_CHANGE FOR EACH ROW BEGIN
--  UPDATE EMPLOYEES
--  SET salary        = (salary * 1.1)
--  WHERE employee_id = :NEW.employee_id;
--END;
--/
--2. Create a trigger named "check_inventory_trigger" that prevents the insertion of a new order into the "orders" table
--if the ordered quantity exceeds the available quantity in the "products" table.
--CREATE TABLE PRODUCTS (
--    PRODUCT_ID NUMBER PRIMARY KEY,
--    QUANTITY NUMBER
--);
--
--CREATE TABLE ORDERS (
--    ORDER_ID NUMBER PRIMARY KEY,
--    PRODUCT_ID NUMBER,
--    ORDERED_QUANTITY NUMBER,
--    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
--);
--CREATE OR REPLACE TRIGGER CHECK_INVENTORY_TRIGGER
--BEFORE INSERT ON ORDERS
--FOR EACH ROW
--DECLARE
--    CURR_QUANTITY NUMBER;
--BEGIN
--    SELECT QUANTITY
--    INTO CURR_QUANTITY
--    FROM PRODUCTS
--    WHERE PRODUCT_ID = :NEW.PRODUCT_ID;
--    IF CURR_QUANTITY < :NEW.ORDERED_QUANTITY THEN
--        RAISE_APPLICATION_ERROR(-20201, 'NOT ENOUGH QUANTITY AVAILABLE');
--    END IF;
--END;
--/
--INSERT INTO PRODUCTS (PRODUCT_ID, QUANTITY) VALUES (101, 8);
--INSERT INTO PRODUCTS (PRODUCT_ID, QUANTITY) VALUES (102, 5);
--
--INSERT INTO ORDERS (ORDER_ID, PRODUCT_ID, ORDERED_QUANTITY) VALUES (1, 101, 5);
--INSERT INTO orders (ORDER_ID, PRODUCT_ID, ORDERED_QUANTITY) VALUES (2, 101, 10);
--3. Develop a trigger called "audit_inserts_trigger" that logs the details of every INSERT statement executed on the "customer" table
-- into an "audit_log" table.
--CREATE OR REPLACE TRIGGER AUDIT_INSERTS_TRIGGER
--AFTER INSERT ON EMPLOYEES
--FOR EACH ROW
--BEGIN
--
--DBMS_OUTPUT.PUT_LINE(:NEW.EMPLOYEE_ID || ' ' || :NEW.FIRST_NAME || ' ' || :NEW.LAST_NAME || ' ' || :NEW.EMAIL || ' ' || :NEW.PHONE_NUMBER || ' ' || :NEW.HIRE_DATE || ' ' || :NEW.JOB_ID || ' ' || :NEW.SALARY || ' ' || :NEW.MANAGER_ID || ' ' || :NEW.DEPARTMENT_ID);
--
--END;
--/
--4. Write a trigger named "discount_trigger" that automatically updates the "discount" column in the "orders" table.
--   If the total order amount is greater than $1000, set the discount to 15%; otherwise, set it to 5%.
--CREATE TABLE PRODUCTS (
--    PRODUCT_ID NUMBER PRIMARY KEY,
--    QUANTITY NUMBER,
--    PRICE NUMBER
--);
--
--CREATE TABLE ORDERS (
--    ORDER_ID NUMBER PRIMARY KEY,
--    PRODUCT_ID NUMBER,
--    ORDERED_QUANTITY NUMBER,
--    TOTAL_ORDER_AMOUNT NUMBER,
--    DISCOUNT NUMBER,
--    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
--);
--
--CREATE OR REPLACE TRIGGER DISCOUNT_TRIGGER
--BEFORE INSERT OR UPDATE ON ORDERS
--FOR EACH ROW
--BEGIN
--    IF :NEW.TOTAL_ORDER_AMOUNT > 1000 THEN
--        :NEW.DISCOUNT := 15;
--    ELSE
--        :NEW.DISCOUNT := 5;
--    END IF;
--END;
--/
--
--
--INSERT INTO PRODUCTS(PRODUCT_ID, QUANTITY, PRICE) VALUES(101, 100, 5);
--INSERT INTO PRODUCTS(PRODUCT_ID, QUANTITY, PRICE) VALUES(102, 50, 10);
--INSERT INTO PRODUCTS(PRODUCT_ID, QUANTITY, PRICE) VALUES(103, 80, 25);
--INSERT INTO ORDERS(ORDER_ID, PRODUCT_ID, ORDERED_QUANTITY, TOTAL_ORDER_AMOUNT) VALUES(1, 103, 50, 1250);
--INSERT INTO ORDERS(ORDER_ID, PRODUCT_ID, ORDERED_QUANTITY, TOTAL_ORDER_AMOUNT) VALUES(2, 101, 50, 250);
--5. Create a trigger named "update_total_trigger" that automatically updates the "total_amount" column in the "orders" table
--   whenever a new order item is inserted or updated. Handle the "mutating table" error appropriately.
--6. Design a trigger named "update_manager_salary" that automatically updates the "salary" of the manager
--   whenever an employee's salary in the "employee" table is updated.
--
--7. Write a trigger named "check_credit_limit_trigger" that prevents inserting a new order into the "orders" table
--   if the customer's total order amount would exceed their predefined credit limit.
--
--8. Create a trigger named "employee_history_trigger" that captures the previous values of the "salary" and "job_title"
--   columns in the "employee_history" table whenever an update occurs in the "employee" table.
--CREATE TABLE EMP_HISTORY(
--  EMPLOYEE_ID NUMBER,
--  OLD_SALARY NUMBER(8,2),
--  NEW_SALARY NUMBER(8,2),
--  OLD_JOB_ID NUMBER,
--  NEW_JOB_ID NUMBER
--)
--CREATE OR REPLACE TRIGGER EMPLOYEE_HISTORY_TRIGGGER
--AFTER UPDATE ON EMPLOYEES
--FOR EACH ROW
--BEGIN
--INSERT INTO EMP_HISTORY VALUES(:OLD.EMPLOYEE_ID, :OLD.SALARY, :NEW.SALARY, :OLD.JOB_ID, :NEW.JOB_ID);
--END;
--/
--
--BEGIN
--UPDATE EMPLOYEES
--SET SALARY = 15000, JOB_ID = 9
--WHERE EMPLOYEE_ID = 102;
--END;
--/
--9. Develop a trigger named "update_product_stock_trigger" that automatically updates the "stock_quantity" in the "products" table
--   when a new order is inserted into the "order_details" table.
--CREATE OR REPLACE TRIGGER UPDATE_PRODUCT_STOCK_TRIGGER
--AFTER INSERT ON ORDERS
--FOR EACH ROW
--BEGIN
--    UPDATE PRODUCTS
--    SET QUANTITY = QUANTITY - :NEW.ORDERED_QUANTITY
--    WHERE PRODUCT_ID = :NEW.PRODUCT_ID;
--END;
--/
--INSERT INTO ORDERS(ORDER_ID, PRODUCT_ID, ORDERED_QUANTITY, TOTAL_ORDER_AMOUNT) VALUES(3, 101, 50, 250);
--10. Write a script that deactivates the "discount_trigger" from exercise 4 and then reactivates it after a specified period.