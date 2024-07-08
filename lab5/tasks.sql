set serveroutput on;

DECLARE
    YEAR   NUMBER;
    VALUE  NUMBER := 0;
    DECADE NUMBER;
    MODU   NUMBER;
BEGIN
    YEAR := EXTRACT(YEAR FROM SYSDATE);
    IF ( MOD(YEAR, 10) = 0 ) THEN
        DBMS_OUTPUT.PUT_LINE('Yes');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No');
    END IF;
    MODU := MOD(YEAR, 10);
    DECADE := (YEAR - MODU);
    DBMS_OUTPUT.PUT_LINE(DECADE
                         || 's');
END;
/

set serveroutput on;

CREATE OR REPLACE PROCEDURE GENERATE_PRIME(
    S NUMBER
) IS
    P    NUMBER;
    I    NUMBER;
    PRI  NUMBER;
    SUMM NUMBER := 0;
BEGIN
    PRI := 1;
    FOR I IN 2 .. S LOOP
        P := 2;
        PRI := 1;
        WHILE P*P <= I LOOP
            IF ( MOD(I, P) = 0 ) THEN
                PRI := 0;
                EXIT;
            ELSE
                P := P + 1;
            END IF;
        END LOOP;
        IF (PRI = 1) THEN
            SUMM := (SUMM + I);
            IF (SUMM > S) THEN
                EXIT;
            END IF;
            DBMS_OUTPUT.PUT_LINE(I
                                 || ' ');
        END IF;
        IF (SUMM > S) THEN
            EXIT;
        END IF;
    END LOOP;
END GENERATE_PRIME;
/

BEGIN
    GENERATE_PRIME(20);
END;
/