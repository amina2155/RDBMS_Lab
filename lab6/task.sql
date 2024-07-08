-- Task 1

DROP TABLE USERS;

CREATE TABLE USERS(
    USERNAME VARCHAR2(10),
    PASS_LEN NUMBER
);

INSERT INTO USERS VALUES(
    'Doll',
    3
);

INSERT INTO USERS VALUES(
    'Doraemon',
    2
);

INSERT INTO USERS VALUES(
    'Shinchan',
    5
);

INSERT INTO USERS VALUES(
    'Hatori',
    4
);

INSERT INTO USERS VALUES(
    'Nobita',
    3
);

INSERT INTO USERS VALUES(
    'Dorami',
    6
);

INSERT INTO USERS VALUES(
    'Shizuka',
    4
);

INSERT INTO USERS VALUES(
    'Karayel',
    2
);

INSERT INTO USERS VALUES(
    'Mimi',
    5
);

SET SERVEROUTPUT ON;

DECLARE
    ML    NUMBER;
    PERMU NUMBER;
    NUM   NUMBER;
BEGIN
    SELECT
        MAX(PASS_LEN) INTO ML
    FROM
        USERS;
    DBMS_OUTPUT.PUT_LINE(ML
                         || ' is maximum password length');
    PERMU := 1;
    NUM := 52;
    FOR I IN 1..ML LOOP
        PERMU := PERMU * NUM;
        NUM := NUM - 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(PERMU
                         || ' is the permutation number');
END;
/

-- Task 2

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE GENERATE_NEAREST_PRIME(
    S IN NUMBER
) IS
    M   NUMBER;
    P   NUMBER;
    PRI NUMBER;
BEGIN
    M := S;
    PRI := 0;
    WHILE (TRUE) LOOP
        M := M - 1;
        P := 2;
        PRI := 1;
        WHILE P*P <= M LOOP
            IF ( MOD(M, P) = 0 ) THEN
                PRI := 0;
                EXIT;
            ELSE
                P := P + 1;
            END IF;
        END LOOP;
        IF (PRI = 1) THEN
            EXIT;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(M
                         || ' is nearest prime less than n');
    M := S;
    PRI := 0;
    WHILE (TRUE) LOOP
        M := M + 1;
        P := 2;
        PRI := 1;
        WHILE P*P <= M LOOP
            IF ( MOD(M, P) = 0 ) THEN
                PRI := 0;
                EXIT;
            ELSE
                P := P + 1;
            END IF;
        END LOOP;
        IF (PRI = 1) THEN
            EXIT;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(M
                         || ' is nearest prime greater than n');
END GENERATE_NEAREST_PRIME;
/

BEGIN
    GENERATE_NEAREST_PRIME(15);
END;
/

BEGIN
    GENERATE_NEAREST_PRIME(10);
END;
/

BEGIN
    GENERATE_NEAREST_PRIME(9);
END;
/

-- Task 3

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PRINT_AND_CHECK(
    S IN VARCHAR
) IS
    L   NUMBER;
    P   VARCHAR(20);
    R   VARCHAR2(20);
    PRI NUMBER;
BEGIN
    L := LENGTH(S);
    P := SUBSTR(S, 1, 1);
    FOR I IN 2..L LOOP
        P := P
             || RPAD(' ', 1, ' ')
                || SUBSTR(S, I, 1);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Spaced string : ');
    DBMS_OUTPUT.PUT_LINE(P);
 -- IS PALLINDROME
    FOR I IN REVERSE 1.. L LOOP
        R := R
             || SUBSTR(S, I, 1);
    END LOOP;
    IF (S = R) THEN
        DBMS_OUTPUT.PUT_LINE('YES');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NO');
    END IF;
END PRINT_AND_CHECK;
/

BEGIN
    PRINT_AND_CHECK('amina');
END;
/

BEGIN
    PRINT_AND_CHECK('racecar');
END;
/

BEGIN
    PRINT_AND_CHECK('forof');
END;
/