DROP TABLE PURCHASEDATA;

DROP TABLE CUSTOMERDATA;

DROP PROCEDURE PRINTRANKING;

DROP TABLE RANKING;

DROP TABLE PLAYERPOINT;

CREATE TABLE CUSTOMERDATA (
    USERID INT PRIMARY KEY,
    NAME VARCHAR(10),
    STATUS VARCHAR(10),
    CONSTRAINT CHK_CDU CHECK (STATUS='member' OR STATUS='normal' OR STATUS='regular')
);

ALTER TABLE CUSTOMERDATA ADD CONSTRAINT CK_SV CHECK (STATUS IN ('normal', 'member', 'regular'));

CREATE TABLE PURCHASEDATA(
    PURCHASEID INT,
    PURCHASEAMOUNT INT,
    USERID INT,
    CONSTRAINT FK_PD FOREIGN KEY (USERID) REFERENCES CUSTOMERDATA(USERID)
);

INSERT INTO CUSTOMERDATA (
    USERID,
    NAME,
    STATUS
) VALUES (
    1,
    'sumon1',
    'normal'
);

INSERT INTO CUSTOMERDATA (
    USERID,
    NAME,
    STATUS
) VALUES (
    2,
    'sumon2',
    'normal'
);

INSERT INTO CUSTOMERDATA (
    USERID,
    NAME,
    STATUS
) VALUES (
    3,
    'sumon3',
    'normal'
);

INSERT INTO CUSTOMERDATA (
    USERID,
    NAME,
    STATUS
) VALUES (
    4,
    'sumon4',
    'member'
);

INSERT INTO CUSTOMERDATA (
    USERID,
    NAME,
    STATUS
) VALUES (
    5,
    'sumon5',
    'regular'
);

INSERT INTO CUSTOMERDATA (
    USERID,
    NAME,
    STATUS
) VALUES (
    6,
    'sumon6',
    'regular'
);

INSERT INTO CUSTOMERDATA (
    USERID,
    NAME,
    STATUS
) VALUES (
    7,
    'sumon7',
    'member'
);

INSERT INTO CUSTOMERDATA (
    USERID,
    NAME,
    STATUS
) VALUES (
    8,
    'sumon8',
    'normal'
);

INSERT INTO CUSTOMERDATA (
    USERID,
    NAME,
    STATUS
) VALUES (
    9,
    'sumon8',
    'member'
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    1,
    900,
    1
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    2,
    1900,
    1
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    3,
    2000,
    1
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    4,
    750,
    2
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    5,
    3375,
    2
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    6,
    3395,
    2
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    7,
    750,
    3
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    8,
    1200,
    3
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    9,
    2015,
    3
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    10,
    36,
    4
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    11,
    4500,
    4
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    12,
    2167,
    4
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    13,
    4000,
    5
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    14,
    139,
    5
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    15,
    3373,
    5
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    16,
    10,
    6
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    17,
    3017,
    9
);

INSERT INTO PURCHASEDATA (
    PURCHASEID,
    PURCHASEAMOUNT,
    USERID
) VALUES (
    18,
    2133,
    9
);

SET SERVEROUTPUT ON;

DECLARE
    USER_ID         CUSTOMERDATA.USERID%TYPE;
    PURCHASE_AMOUNT PURCHASEDATA.PURCHASEAMOUNT%TYPE;
    CURRENT_STATUS  CUSTOMERDATA.STATUS%TYPE;
    STATUS_CHANGED  NUMBER := 0;
BEGIN
    UPDATE CUSTOMERDATA
    SET
        STATUS = 'member'
    WHERE
        USERID IN(
            SELECT
                CUSTOMERDATA.USERID
            FROM
                CUSTOMERDATA,
                PURCHASEDATA
            WHERE
                CUSTOMERDATA.USERID = PURCHASEDATA.USERID
                AND CUSTOMERDATA.STATUS = 'normal'
            GROUP BY
                CUSTOMERDATA.USERID
            HAVING
                SUM(PURCHASEAMOUNT) < 6000
                AND SUM(PURCHASEAMOUNT) >= 4000
        );
    STATUS_CHANGED := STATUS_CHANGED + SQL%ROWCOUNT;
    UPDATE CUSTOMERDATA
    SET
        STATUS = 'regular'
    WHERE
        USERID IN(
            SELECT
                CUSTOMERDATA.USERID
            FROM
                CUSTOMERDATA,
                PURCHASEDATA
            WHERE
                CUSTOMERDATA.USERID = PURCHASEDATA.USERID
                AND (CUSTOMERDATA.STATUS = 'normal'
                OR CUSTOMERDATA.STATUS = 'member')
            GROUP BY
                CUSTOMERDATA.USERID
            HAVING
                SUM(PURCHASEAMOUNT) >= 6000
        );
    STATUS_CHANGED := STATUS_CHANGED + SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Number of status changed: '
                         || STATUS_CHANGED);
END;
/

CREATE TABLE PLAYERPOINT (
    PLAYERID INT NOT NULL,
    DTP INT NOT NULL,
    GPD DATE NOT NULL
);

CREATE TABLE RANKING(
    RANKNAME VARCHAR(6) NOT NULL,
    RLP INT NOT NULL,
    RHP INT NOT NULL
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    1,
    100,
    DATE '2020-12-12'
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    1,
    200,
    DATE '2019-11-01'
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    1,
    100,
    DATE '2022-01-03'
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    1,
    400,
    DATE '2021-07-26'
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    2,
    300,
    DATE '2019-01-23'
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    2,
    50,
    DATE '2021-07-06'
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    2,
    10,
    DATE '2022-06-05'
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    2,
    1000,
    DATE '2023-10-13'
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    3,
    300,
    DATE '2020-04-14'
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    3,
    100,
    DATE '2021-03-09'
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    3,
    200,
    DATE '2022-02-16'
);

INSERT INTO PLAYERPOINT (
    PLAYERID,
    DTP,
    GPD
) VALUES (
    3,
    400,
    DATE '2023-09-27'
);

INSERT INTO RANKING (
    RANKNAME,
    RLP,
    RHP
) VALUES (
    'newbie',
    0,
    499
);

INSERT INTO RANKING (
    RANKNAME,
    RLP,
    RHP
) VALUES (
    'pupil',
    500,
    999
);

INSERT INTO RANKING (
    RANKNAME,
    RLP,
    RHP
) VALUES (
    'expert',
    1000,
    1e9
);

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PRINTRANKING (
    GIVENDATE IN VARCHAR2
) IS
    PLAYER_ID   PLAYERPOINT.PLAYERID%TYPE;
    PLAYER_RANK RANKING.RANKNAME%TYPE;
    CURSOR PLAYERLIST IS
        SELECT
            TOTAL_GENERATE.PLAYERID,
            RANKING.RANKNAME
        FROM
            (
                SELECT
                    PLAYERID,
                    SUM(DTP) AS TOTAL_DTP
                FROM
                    PLAYERPOINT
                WHERE
                    GPD <= TO_DATE(GIVENDATE, 'YYYY-MM-DD')
                GROUP BY
                    PLAYERID
            )       TOTAL_GENERATE,
            RANKING
        WHERE
            TOTAL_GENERATE.TOTAL_DTP >= RANKING.RLP
            AND TOTAL_GENERATE.TOTAL_DTP <= RANKING.RHP
        ORDER BY
            TOTAL_GENERATE.PLAYERID ASC;
BEGIN
    OPEN PLAYERLIST;
    LOOP
        FETCH PLAYERLIST INTO PLAYER_ID, PLAYER_RANK;
        EXIT WHEN PLAYERLIST%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Player '
                             || PLAYER_ID
                             || ' was a '
                             || PLAYER_RANK
                             || ' till '
                             || GIVENDATE);
    END LOOP;
    CLOSE PLAYERLIST;
END PRINTRANKING;
/

SHOW ERROR;

SET SERVEROUTPUT ON;

DECLARE
    USER_INPUT VARCHAR2(255);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter a date in given format [YYYY-MM-DD]:');
    USER_INPUT:='&user_input';
    DBMS_OUTPUT.PUT_LINE(USER_INPUT);
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    PRINTRANKING(USER_INPUT);
END;
/