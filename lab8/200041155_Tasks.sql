---------------------------------------------------------------------------
-- Task 1
---------------------------------------------------------------------------


DROP TABLE USERINFO;

CREATE TABLE USERINFO(
    USERID INT,
    NAME VARCHAR(10)
);

DROP SEQUENCE USERIDSEQ;

CREATE SEQUENCE USERIDSEQ
MINVALUE 1
MAXVALUE 999999
START WITH 1
INCREMENT BY 1
CACHE 20;

DROP TRIGGER BEFOREINSERTINUSER;

CREATE OR REPLACE TRIGGER BEFOREINSERTINUSER BEFORE
    INSERT ON USERINFO FOR EACH ROW
BEGIN
    IF :NEW.USERID IS NULL THEN
        :NEW.USERID := USERIDSEQ.NEXTVAL;
    END IF;
END;
/

INSERT INTO USERINFO (
    NAME
) VALUES (
    'monir'
);

INSERT INTO USERINFO (
    NAME
) VALUES (
    'shabnur'
);

INSERT INTO USERINFO (
    NAME
) VALUES (
    'nargis'
);

INSERT INTO USERINFO (
    NAME
) VALUES (
    'jalil'
);

SELECT
    *
FROM
    USERINFO;

---------------------------------------------------------------------------
-- Task 2
---------------------------------------------------------------------------

DROP TABLE FRNDLIST;

CREATE TABLE FRNDLIST(
    USERID1 INT,
    USERID2 INT
);

DROP TRIGGER INVALIDIDCHECK;

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER INVALIDIDCHECK BEFORE
    INSERT ON FRNDLIST FOR EACH ROW
DECLARE
    ID1 INT;
    ID2 INT;
BEGIN
    SELECT
        USERID INTO ID1
    FROM
        USERINFO
    WHERE
        USERID = :NEW.USERID1;
    SELECT
        USERID INTO ID2
    FROM
        USERINFO
    WHERE
        USERID = :NEW.USERID2;
    IF ID1 IS NULL OR ID2 IS NULL OR ID1 = ID2 THEN
        RAISE_APPLICATION_ERROR(-1718, 'Invalid user ID(s)');
    END IF;
END;
/

show errors;

DROP PROCEDURE MAKEFRIENDS;

CREATE OR REPLACE PROCEDURE MAKEFRIENDS(
    USER_ID1 INT,
    USER_ID2 INT
) AS
BEGIN
    INSERT INTO FRNDLIST VALUES (
        USER_ID1,
        USER_ID2
    );
    INSERT INTO FRNDLIST VALUES (
        USER_ID2,
        USER_ID1
    );
END MAKEFRIENDS;
/

show errors;

EXECUTE makeFriends(1, 2);

EXECUTE makeFriends(8, 2);

EXECUTE makeFriends(1, 13);

EXECUTE makeFriends(3, 2);

EXECUTE makeFriends(2, 2);

EXECUTE makeFriends(1, 3);

EXECUTE makeFriends(17, 17);

EXECUTE makeFriends(4, 2);

SELECT
    *
FROM
    FRNDLIST;

---------------------------------------------------------------------------
-- Task 3
---------------------------------------------------------------------------

DROP TABLE MESSAGE;

CREATE TABLE MESSAGE (
    SENDERID INT,
    RECEIVERID INT,
    TEXT VARCHAR(56)
);

CREATE OR REPLACE TRIGGER FRNDCHECK BEFORE
    INSERT ON MESSAGE FOR EACH ROW
DECLARE
    SENDER   INT;
    RECEIVER INT;
BEGIN
    SENDER := 0;
    RECEIVER := :NEW.RECEIVERID;
    SELECT
        COUNT(*) INTO SENDER
    FROM
        FRNDLIST
    WHERE
        (USERID1 = :NEW.SENDERID
        AND USERID2 = :NEW.RECEIVERID)
        OR (USERID1 = :NEW.RECEIVERID
        AND USERID2 = :NEW.SENDERID);
    IF SENDER = 0 THEN
        RAISE_APPLICATION_ERROR(-123, 'Sender and receiver are not friends (ORA-00123)');
    END IF;
END;
/

show errors;

INSERT INTO MESSAGE (
    SENDERID,
    RECIEVERID,
    TEXT
) VALUES (
    13,
    2,
    'Should raise error 2'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    4,
    4,
    'Should raise error 3'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    3,
    1,
    'Hi'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    1,
    3,
    'Hello'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    4,
    1,
    'Should raise error 4'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    3,
    1,
    'How are you ?'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    4,
    2,
    'Give me the solution of todays task.'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    1,
    3,
    'Fine.'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    2,
    1,
    'Jalil is asking for task again. Should I give it to him?'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    3,
    1,
    'Do you have a girlfriend?'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    3,
    4,
    'Should raise error 5'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    1,
    2,
    'No.'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    1,
    4,
    'Should raise error 6'
);

INSERT INTO MESSAGE (
    SENDERID,
    RECEIVERID,
    TEXT
) VALUES (
    1,
    3,
    'Yes, her name is Shabnur.'
);

SELECT
    *
FROM
    MESSAGE;

---------------------------------------------------------------------------
-- Task 4
---------------------------------------------------------------------------

DROP PROCEDURE UNFRIEND;

CREATE OR REPLACE PROCEDURE UNFRIEND(
    USER_ID1 INT,
    USER_ID2 INT
) AS
    COUNTING INT := 0;
BEGIN
    SELECT
        COUNT(*) INTO COUNTING
    FROM
        FRNDLIST
    WHERE
        (USERID1 = USER_ID1
        AND USERID2 = USER_ID2)
        OR (USERID1 = USER_ID2
        AND USERID2 = USER_ID1);
    IF COUNTING = 0 THEN
        RAISE_APPLICATION_ERROR(-9, 'Users are not friends (ORA-00009)');
    ELSE
        DELETE FROM FRNDLIST
        WHERE
            (USERID1 = USER_ID1
            AND USERID2 = USER_ID2)
            OR (USERID1 = USER_ID2
            AND USERID2 = USER_ID1);
    END IF;
END UNFRIEND;
/

DROP TRIGGER MESSAGEDELETE;

CREATE OR REPLACE TRIGGER MESSAGEDELETE BEFORE
    DELETE ON FRNDLIST FOR EACH ROW
BEGIN
    DELETE FROM MESSAGE
    WHERE
        (SENDERID = :OLD.USERID1
        AND RECEIVERID = :OLD.USERID2)
        OR (SENDERID = :OLD.USERID2
        AND RECEIVERID = :OLD.USERID1);
END;
/

show errors;

Execute unfriend(1, 13);

Execute unfriend(1, 3);

SELECT
    *
FROM
    MESSAGE;

---------------------------------------------------------------------------
-- Task 5
---------------------------------------------------------------------------

DROP TABLE POSTNOTIFICATION;

DROP TABLE POST;

CREATE TABLE POST(
    POSTID INT PRIMARY KEY,
    USERID INT,
    TEXT VARCHAR(56)
);

CREATE TABLE POSTNOTIFICATION(
    USERID INT,
    FRNDID INT,
    POSTID INT,
    CONSTRAINT FK_POSTID FOREIGN KEY (POSTID) REFERENCES POST(POSTID)
);

CREATE OR REPLACE TRIGGER DELETEPREVIOUSPOSTS BEFORE
    INSERT ON POST FOR EACH ROW
BEGIN
    DELETE FROM POSTNOTIFICATION
    WHERE
        (USERID = :NEW.USERID);
END;
/

CREATE OR REPLACE TRIGGER UPDATEPOSTNOTIFICATION AFTER
    INSERT ON POST FOR EACH ROW
BEGIN
    FOR FRNDRCRD IN (
        SELECT
            USERID2
        FROM
            FRNDLIST
        WHERE
            USERID1 = :NEW.USERID
    ) LOOP
        INSERT INTO POSTNOTIFICATION (
            USERID,
            FRNDID,
            POSTID
        ) VALUES (
            :NEW.USERID,
            FRNDRCRD.USERID2,
            :NEW.POSTID
        );
    END LOOP;
END;
/

INSERT INTO POST (
    POSTID,
    USERID,
    TEXT
) VALUES (
    1,
    4,
    'I am lonely.'
);

SELECT
    *
FROM
    POSTNOTIFICATION;

-- should show one row with post id as 1
INSERT INTO POST (
    POSTID,
    USERID,
    TEXT
) VALUES (
    2,
    4,
    'I need friends.'
);

SELECT
    *
FROM
    POSTNOTIFICATION;