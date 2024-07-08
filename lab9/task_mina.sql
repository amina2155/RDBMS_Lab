-- TASK 01

/*
A procedure or function is similar to a miniature program. It has an optional 
declarative part, an executable part, and an optional exception-handling part. 
A procedure is a subprogram that performs a specific action. You specify the 
name of the procedure, its parameters, its local variables, and the BEGIN-END 
block that contains its code and handles any exceptions. A function is a 
subprogram that computes and returns a value. Functions and procedures are 
structured alike, except that functions return a value.
*/

-- TASK 02

DROP TABLE PURCHASE;

DROP TABLE PRODUCTS;

DROP TABLE EMPLOYEES;

DROP TABLE MEMBERS;

CREATE TABLE MEMBERS (
    MEMBER_ID INTEGER,
    NAME VARCHAR2(20),
    PHONE VARCHAR2(20),
    EMAIL VARCHAR2(50),
    DISCOUNTS NUMBER,
    CONSTRAINT MM_PK PRIMARY KEY (MEMBER_ID)
);

CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID INTEGER,
    NAME VARCHAR2(20),
    JOB_TITLE VARCHAR2(50),
    CONSTRAINT EM_PK PRIMARY KEY (EMPLOYEE_ID)
);

CREATE TABLE PRODUCTS (
    PRODUCT_ID INTEGER,
    NAME VARCHAR2(20),
    PRICE NUMBER,
    DESCRIPTION VARCHAR2(50),
    CONSTRAINT PD_PK PRIMARY KEY (PRODUCT_ID)
);

CREATE TABLE PURCHASE (
    PURCHASE_ID INTEGER,
    EMPLOYEE_ID INTEGER REFERENCES EMPLOYEES(EMPLOYEE_ID),
    MEMBER_ID INTEGER REFERENCES MEMBERS(MEMBER_ID),
    PRODUCT_ID INTEGER REFERENCES PRODUCTS(PRODUCT_ID),
    QUANTITY NUMBER,
    CONSTRAINT PC_PK PRIMARY KEY (PURCHASE_ID),
    CONSTRAINT PC_EM_FK FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES (EMPLOYEE_ID),
    CONSTRAINT PC_MM_FK FOREIGN KEY (MEMBER_ID) REFERENCES MEMBERS (MEMBER_ID),
    CONSTRAINT PC_PD_FK FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID)
);

INSERT INTO MEMBERS (
    NAME,
    PHONE,
    EMAIL,
    DISCOUNTS
) VALUES (
    'John Doe',
    '123-456-7890',
    'john@example.com',
    0.1
);

INSERT INTO MEMBERS (
    NAME,
    PHONE,
    EMAIL,
    DISCOUNTS
) VALUES (
    'Jane Smith',
    '987-654-3210',
    'jane@example.com',
    0.05
);

INSERT INTO MEMBERS (
    NAME,
    PHONE,
    EMAIL,
    DISCOUNTS
) VALUES (
    'Alice Johnson',
    '555-123-4567',
    'alice@example.com',
    0.2
);

INSERT INTO MEMBERS (
    NAME,
    PHONE,
    EMAIL,
    DISCOUNTS
) VALUES (
    'Bob Brown',
    '444-567-8901',
    'bob@example.com',
    0.15
);

INSERT INTO MEMBERS (
    NAME,
    PHONE,
    EMAIL,
    DISCOUNTS
) VALUES (
    'Eva White',
    '333-678-9012',
    'eva@example.com',
    0.3
);

INSERT INTO MEMBERS (
    NAME,
    PHONE,
    EMAIL,
    DISCOUNTS
) VALUES (
    'Chris Evans',
    '222-789-0123',
    'chris@example.com',
    0.25
);

INSERT INTO MEMBERS (
    NAME,
    PHONE,
    EMAIL,
    DISCOUNTS
) VALUES (
    'Grace Wilson',
    '111-890-1234',
    'grace@example.com',
    0.05
);

INSERT INTO MEMBERS (
    NAME,
    PHONE,
    EMAIL,
    DISCOUNTS
) VALUES (
    'David Miller',
    '999-901-2345',
    'david@example.com',
    0.2
);

INSERT INTO MEMBERS (
    NAME,
    PHONE,
    EMAIL,
    DISCOUNTS
) VALUES (
    'Sophia Lee',
    '888-012-3456',
    'sophia@example.com',
    0.1
);

INSERT INTO MEMBERS (
    NAME,
    PHONE,
    EMAIL,
    DISCOUNTS
) VALUES (
    'James Taylor',
    '777-123-4567',
    'james@example.com',
    0.15
);

INSERT INTO EMPLOYEES (
    NAME,
    JOB_TITLE
) VALUES (
    'Manager Name',
    'Manager'
);

INSERT INTO EMPLOYEES (
    NAME,
    JOB_TITLE
) VALUES (
    'Salesperson 1',
    'Salesperson'
);

INSERT INTO EMPLOYEES (
    NAME,
    JOB_TITLE
) VALUES (
    'Salesperson 2',
    'Salesperson'
);

INSERT INTO EMPLOYEES (
    NAME,
    JOB_TITLE
) VALUES (
    'Cashier 1',
    'Cashier'
);

INSERT INTO EMPLOYEES (
    NAME,
    JOB_TITLE
) VALUES (
    'Cashier 2',
    'Cashier'
);

INSERT INTO EMPLOYEES (
    NAME,
    JOB_TITLE
) VALUES (
    'Stock Clerk 1',
    'Stock Clerk'
);

INSERT INTO EMPLOYEES (
    NAME,
    JOB_TITLE
) VALUES (
    'Stock Clerk 2',
    'Stock Clerk'
);

INSERT INTO EMPLOYEES (
    NAME,
    JOB_TITLE
) VALUES (
    'Security Guard 1',
    'Security Guard'
);

INSERT INTO EMPLOYEES (
    NAME,
    JOB_TITLE
) VALUES (
    'Security Guard 2',
    'Security Guard'
);

INSERT INTO EMPLOYEES (
    NAME,
    JOB_TITLE
) VALUES (
    'Cleaner',
    'Cleaning Staff'
);

INSERT INTO PRODUCTS VALUES (
    1,
    'Product A',
    19.99,
    'Description for Product A'
);

INSERT INTO PRODUCTS VALUES (
    2,
    'Product B',
    29.99,
    'Description for Product B'
);

INSERT INTO PRODUCTS VALUES (
    3,
    'Product C',
    9.99,
    'Description for Product C'
);

INSERT INTO PRODUCTS VALUES (
    4,
    'Product D',
    14.99,
    'Description for Product D'
);

INSERT INTO PRODUCTS VALUES (
    5,
    'Product E',
    39.99,
    'Description for Product E'
);

INSERT INTO PRODUCTS VALUES (
    6,
    'Product F',
    49.99,
    'Description for Product F'
);

INSERT INTO PRODUCTS VALUES (
    7,
    'Product G',
    24.99,
    'Description for Product G'
);

INSERT INTO PRODUCTS VALUES (
    8,
    'Product H',
    17.99,
    'Description for Product H'
);

INSERT INTO PRODUCTS VALUES (
    9,
    'Product I',
    7.99,
    'Description for Product I'
);

INSERT INTO PRODUCTS VALUES (
    10,
    'Product J',
    32.99,
    'Description for Product J'
);

INSERT INTO PURCHASE VALUES (
    1,
    1,
    1,
    1,
    2
);

INSERT INTO PURCHASE VALUES (
    2,
    2,
    2,
    2,
    1
);

INSERT INTO PURCHASE VALUES (
    3,
    3,
    3,
    3,
    3
);

INSERT INTO PURCHASE VALUES (
    4,
    4,
    4,
    4,
    2
);

INSERT INTO PURCHASE VALUES (
    5,
    5,
    5,
    5,
    1
);

INSERT INTO PURCHASE VALUES (
    6,
    6,
    6,
    6,
    4
);

INSERT INTO PURCHASE VALUES (
    7,
    7,
    7,
    7,
    2
);

INSERT INTO PURCHASE VALUES (
    8,
    8,
    8,
    8,
    1
);

INSERT INTO PURCHASE VALUES (
    9,
    9,
    9,
    9,
    3
);

INSERT INTO PURCHASE VALUES (
    10,
    10,
    10,
    10,
    2
);

-- (A)

DROP SEQUENCE MEMBERS_SEQ;

CREATE SEQUENCE MEMBERS_SEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER MEMBERSIDTRIGGER BEFORE
    INSERT ON MEMBERS FOR EACH ROW
BEGIN
    SELECT
        MEMBERS_SEQ.NEXTVAL INTO :NEW.MEMBER_ID
    FROM
        DUAL;
END;
/

DROP SEQUENCE EMPLOYEES_SEQ;

CREATE SEQUENCE EMPLOYEES_SEQ
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER EMPLOYEESIDTRIGGER BEFORE
    INSERT ON EMPLOYEES FOR EACH ROW
BEGIN
    SELECT
        EMPLOYEES_SEQ.NEXTVAL INTO :NEW.EMPLOYEE_ID
    FROM
        DUAL;
END;
/

-- (B)

CREATE OR REPLACE FUNCTION UPDATEMEMBERDISCOUNT(
    PURCHASE_ID IN INTEGER,
    MEMBER_ID IN INTEGER
) RETURN NUMBER IS
    BILL         NUMBER;
    MODDISCOUNT  NUMBER;
    CURRDISCOUNT NUMBER;
BEGIN
    SELECT
        (PC.QUANTITY * PD.PRICE) INTO BILL
    FROM
        PURCHASE PC,
        PRODUCTS PD
    WHERE
        PC.PRODUCT_ID = PD.PRODUCT_ID
        AND PC.PURCHASE_ID = PURCHASE_ID;
    SELECT
        MM.DISCOUNTS INTO CURRDISCOUNT
    FROM
        MEMBERS MM
    WHERE
        MM.MEMBER_ID = MEMBER_ID;
    IF BILL >= CURRDISCOUNT THEN
        BILL := BILL - CURRDISCOUNT;
        MODDISCOUNT := TRUNC(BILL / 10) * 0.1;
    ELSE
        MODDISCOUNT := CURRDISCOUNT - BILL;
    END IF;

    RETURN MODDISCOUNT;
END UPDATEMEMBERDISCOUNT;
/

CREATE OR REPLACE TRIGGER UPDATEDISCOUNTTRIGGER AFTER
    INSERT ON PURCHASE FOR EACH ROW
DECLARE
    UPDDISCOUNT NUMBER;
BEGIN
    IF :NEW.MEMBER_ID IS NOT NULL THEN
        UPDDISCOUNT = UPDATEMEMBERDISCOUNT(:NEW.PURCHASE_ID, :NEW.MEMBER_ID);
        UPDATE MEMBERS
        SET
            DISCOUNTS = UPDDISCOUNT
        WHERE
            MEMBER_ID = :NEW.MEMBER_ID;
    END IF;
END;
/

-- (C)

SET SERVEROUTPUT ON

DECLARE
    CURSOR MEMBERINFO IS
    SELECT
        ID,
        NAME
    FROM
        (
            SELECT
                MM.MEMBER_ID                AS ID,
                MAX(MM.NAME)                AS NAME,
                SUM(PD.PRICE * PC.QUANTITY) AS TOTAL
            FROM
                PRODUCTS PD,
                PURCHASE PC,
                MEMBERS  MM
            WHERE
                MM.MEMBER_ID = PC.MEMBER_ID
                AND PD.PRODUCT_ID = PC.PRODUCT_ID
            GROUP BY
                MM.MEMBER_ID
        )
    WHERE
        TOTAL = (
            SELECT
                MAX(TOTAL)
            FROM
                (
                    SELECT
                        MM.MEMBER_ID                AS ID,
                        SUM(PD.PRICE * PC.QUANTITY) AS TOTAL
                    FROM
                        PRODUCTS PD,
                        PURCHASE PC,
                        MEMBERS  MM
                    WHERE
                        MM.MEMBER_ID = PC.MEMBER_ID
                        AND PD.PRODUCT_ID = PC.PRODUCT_ID
                    GROUP BY
                        MM.MEMBER_ID
                )
        );
    CURSOR PRODUCTINFO IS
    SELECT
        PID,
        PNAME
    FROM
        (
            SELECT
                PD.PRODUCT_ID    AS PID,
                MAX(PD.NAME)     AS PNAME,
                SUM(PC.QUANTITY) AS PQUANTITY
            FROM
                PRODUCTS PD,
                PURCHASE PC,
                MEMBERS  MM
            WHERE
                PD.PRODUCT_ID = PC.PRODUCT_ID
                AND MM.MEMBER_ID = PC.MEMBER_ID
                AND MM.MEMBER_ID = (
                    SELECT
                        ID
                    FROM
                        (
                            SELECT
                                MM.MEMBER_ID                AS ID,
                                SUM(PD.PRICE * PC.QUANTITY) AS TOTAL
                            FROM
                                PRODUCTS PD,
                                PURCHASE PC,
                                MEMBERS  MM
                            WHERE
                                MM.MEMBER_ID = PC.MEMBER_ID
                                AND PD.PRODUCT_ID = PC.PRODUCT_ID
                            GROUP BY
                                MM.MEMBER_ID
                        )
                    WHERE
                        TOTAL = (
                            SELECT
                                MAX(TOTAL)
                            FROM
                                (
                                    SELECT
                                        MM.MEMBER_ID                AS ID,
                                        SUM(PD.PRICE * PC.QUANTITY) AS TOTAL
                                    FROM
                                        PRODUCTS PD,
                                        PURCHASE PC,
                                        MEMBERS  MM
                                    WHERE
                                        MM.MEMBER_ID = PC.MEMBER_ID
                                        AND PD.PRODUCT_ID = PC.PRODUCT_ID
                                    GROUP BY
                                        MM.MEMBER_ID
                                )
                        )
                )
            GROUP BY
                PD.PRODUCT_ID
        )
    WHERE
        ROWNUM < 3
    ORDER BY
        PQUANTITY DESC;
    CURSOR EMPLOYEEINFO IS
    SELECT
        SPD.PID        AS PID,
        SPD.PNAME      AS PNAME,
        EM.EMPLOYEE_ID AS EID,
        EM.NAME        AS ENAME
    FROM
        EMPLOYEES EM,
        PURCHASE  PC,
        (
            SELECT
                PID,
                PNAME
            FROM
                (
                    SELECT
                        PD.PRODUCT_ID    AS PID,
                        MAX(PD.NAME)     AS PNAME,
                        SUM(PC.QUANTITY) AS PQUANTITY
                    FROM
                        PRODUCTS PD,
                        PURCHASE PC,
                        MEMBERS  MM
                    WHERE
                        PD.PRODUCT_ID = PC.PRODUCT_ID
                        AND MM.MEMBER_ID = PC.MEMBER_ID
                        AND MM.MEMBER_ID = (
                            SELECT
                                ID
                            FROM
                                (
                                    SELECT
                                        MM.MEMBER_ID                AS ID,
                                        SUM(PD.PRICE * PC.QUANTITY) AS TOTAL
                                    FROM
                                        PRODUCTS PD,
                                        PURCHASE PC,
                                        MEMBERS  MM
                                    WHERE
                                        MM.MEMBER_ID = PC.MEMBER_ID
                                        AND PD.PRODUCT_ID = PC.PRODUCT_ID
                                    GROUP BY
                                        MM.MEMBER_ID
                                )
                            WHERE
                                TOTAL = (
                                    SELECT
                                        MAX(TOTAL)
                                    FROM
                                        (
                                            SELECT
                                                MM.MEMBER_ID                AS ID,
                                                SUM(PD.PRICE * PC.QUANTITY) AS TOTAL
                                            FROM
                                                PRODUCTS PD,
                                                PURCHASE PC,
                                                MEMBERS  MM
                                            WHERE
                                                MM.MEMBER_ID = PC.MEMBER_ID
                                                AND PD.PRODUCT_ID = PC.PRODUCT_ID
                                            GROUP BY
                                                MM.MEMBER_ID
                                        )
                                )
                        )
                    GROUP BY
                        PD.PRODUCT_ID
                )
            WHERE
                ROWNUM < 3
            ORDER BY
                PQUANTITY DESC
        )         SPD
    WHERE
        SPD.PID = PC.PRODUCT_ID
        AND EM.EMPLOYEE_ID = PC.EMPLOYEE_ID;
    MID   INTEGER;
    MNAME VARCHAR2(20);
    PID   INTEGER;
    PNAME VARCHAR2(20);
    EID   INTEGER;
    ENAME VARCHAR2(20);
BEGIN
    DBMS_OUTPUT.PUT_LINE('##');
    DBMS_OUTPUT.PUT_LINE('Name of the member who has spent the highest amount of money:');
    OPEN MEMBERINFO;
    LOOP
        FETCH MEMBERINFO INTO MID, MNAME;
        EXIT WHEN MEMBERINFO%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('> Member: '
                             || MNAME
                             || '[ ID: '
                             || MID
                             || ']');
    END LOOP;

    CLOSE MEMBERINFO;
    DBMS_OUTPUT.PUT_LINE('##');
    DBMS_OUTPUT.PUT_LINE('Top 2 (at most) products that he has purchased:');
    OPEN PRODUCTINFO;
    LOOP
        FETCH PRODUCTINFO INTO PID, PNAME;
        EXIT WHEN PRODUCTINFO%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('> Product: '
                             || PNAME
                             || '[ ID: '
                             || PID
                             || ']');
    END LOOP;

    CLOSE PRODUCTINFO;
    DBMS_OUTPUT.PUT_LINE('##');
    DBMS_OUTPUT.PUT_LINE('Names of the employees who helped him to purchase mentioned products:');
    OPEN EMPLOYEEINFO;
    LOOP
        FETCH EMPLOYEEINFO INTO PID, PNAME, EID, ENAME;
        EXIT WHEN EMPLOYEEINFO%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('> Employee: '
                             || ENAME
                             || '[ ID: '
                             || EID
                             || '] Helped To Purchase Product: '
                             || PNAME
                             || '[ ID: '
                             || PID
                             || ']');
    END LOOP;

    CLOSE EMPLOYEEINFO;
    DBMS_OUTPUT.PUT_LINE('##');
END;
/