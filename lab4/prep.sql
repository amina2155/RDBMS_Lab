CREATE TABLE OCCUPATION(
    ID NUMBER PRIMARY KEY,
    GENERAL VARCHAR2(20),
    SPECIFIC VARCHAR2(20),
    SALARY NUMBER
);

INSERT INTO OCCUPATION VALUES(
    101,
    'Engineer',
    'CSE',
    5000
);

INSERT INTO OCCUPATION VALUES(
    102,
    'Engineer',
    'CSE',
    7000
);

INSERT INTO OCCUPATION VALUES(
    103,
    'Engineer',
    'EEE',
    5000
);

INSERT INTO OCCUPATION VALUES(
    104,
    'Engineer',
    'EEE',
    9000
);

INSERT INTO OCCUPATION VALUES(
    105,
    'Teacher',
    'School',
    1000
);

INSERT INTO OCCUPATION VALUES(
    106,
    'Teacher',
    'School',
    2000
);

INSERT INTO OCCUPATION VALUES(
    107,
    'Teacher',
    'College',
    2000
);

INSERT INTO OCCUPATION VALUES(
    108,
    'Teacher',
    'College',
    3000
);

INSERT INTO OCCUPATION VALUES(
    109,
    'Doctor',
    'ENT',
    9000
);

-- 1)
SELECT
    COUNT(*) AS PEOPLE,
    GENERAL,
    SPECIFIC
FROM
    OCCUPATION
GROUP BY
    GENERAL,
    SPECIFIC
ORDER BY
    PEOPLE;

-- 2)
SELECT
    COUNT(*)    AS PEOPLE,
    GENERAL,
    MAX(SALARY),
    MIN(SALARY),
    AVG(SALARY)
FROM
    OCCUPATION
GROUP BY
    GENERAL;

-- 3)
SELECT
    GENERAL,
    AVG(SALARY)
FROM
    OCCUPATION
GROUP BY
    GENERAL
HAVING
    AVG(SALARY) >= (
        SELECT
            AVG(SALARY)
        FROM
            OCCUPATION
    );

-- 4)
CREATE VIEW GROUP_VIEW AS
    SELECT
        GENERAL,
        AVG(SALARY) AS AVERAGE_SAL
    FROM
        OCCUPATION
    GROUP BY
        GENERAL;

SELECT
    GENERAL,
    AVERAGE_SAL
FROM
    GROUP_VIEW
WHERE
    AVERAGE_SAL = (
        SELECT
            MAX(AVERAGE_SAL)
        FROM
            GROUP_VIEW
    );

CREATE TABLE GRADES (
    ID NUMBER PRIMARY KEY,
    DEPARTMENT VARCHAR2(10),
    PROGRAMME VARCHAR2(10),
    COURSE_CODE VARCHAR2(10),
    GRADE VARCHAR2(3)
);