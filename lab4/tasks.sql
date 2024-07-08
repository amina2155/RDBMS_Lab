-- *** Task A ***

CREATE TABLE TEAMS (
    ID NUMBER(10) PRIMARY KEY,
    NAME VARCHAR2(50),
    CITY VARCHAR2(50)
);

-- Create the Players table
CREATE TABLE PLAYERS (
    ID NUMBER(10) PRIMARY KEY,
    NAME VARCHAR2(50),
    TEAM_ID NUMBER(10),
    SALARY NUMBER(10, 2),
    CONSTRAINT FK_TEAM FOREIGN KEY (TEAM_ID) REFERENCES TEAMS(ID)
);

-- Create the Matches table
CREATE TABLE MATCHES (
    ID NUMBER(10) PRIMARY KEY,
    HOME_TEAM NUMBER(10),
    AWAY_TEAM NUMBER(10),
    HOME_GOALS NUMBER(5),
    AWAY_GOALS NUMBER(5),
    CONSTRAINT FK_HOME_TEAM FOREIGN KEY (HOME_TEAM) REFERENCES TEAMS(ID),
    CONSTRAINT FK_AWAY_TEAM FOREIGN KEY (AWAY_TEAM) REFERENCES TEAMS(ID)
);

INSERT INTO TEAMS VALUES (
    1,
    'Doraemon Explorers',
    'Tokyo'
);

INSERT INTO TEAMS VALUES (
    2,
    'Nobi''s Nobitas',
    'Tokyo'
);

INSERT INTO TEAMS VALUES (
    3,
    'Shizuka''s Stars',
    'Tokyo'
);

INSERT INTO TEAMS VALUES (
    4,
    'Gian Giants',
    'Tokyo'
);

INSERT INTO TEAMS VALUES (
    5,
    'Suneo''s Seekers',
    'Tokyo'
);

INSERT INTO TEAMS VALUES (
    6,
    'Doraemon''s Dreamers',
    'Tokyo'
);

INSERT INTO TEAMS VALUES (
    7,
    'Jaiko''s Jugglers',
    'Tokyo'
);

INSERT INTO TEAMS VALUES (
    8,
    'Doraemon''s Dynamos',
    'Tokyo'
);

INSERT INTO TEAMS VALUES (
    9,
    'Doraemon''s Time-Travelers',
    'Tokyo'
);

INSERT INTO TEAMS VALUES (
    10,
    'Nobita''s Ninjas',
    'Tokyo'
);

INSERT INTO PLAYERS VALUES (
    1,
    'Nobita Nobi',
    2,
    5000
);

INSERT INTO PLAYERS VALUES (
    2,
    'Doraemon',
    1,
    10000
);

INSERT INTO PLAYERS VALUES (
    3,
    'Shizuka Minamoto',
    3,
    5500
);

INSERT INTO PLAYERS VALUES (
    4,
    'Takeshi Gouda (Gian)',
    4,
    5200
);

INSERT INTO PLAYERS VALUES (
    5,
    'Suneo Honekawa',
    5,
    5300
);

INSERT INTO PLAYERS VALUES (
    6,
    'Jaiko Gouda',
    7,
    5600
);

INSERT INTO PLAYERS VALUES (
    7,
    'Dorami',
    1,
    9800
);

INSERT INTO PLAYERS VALUES (
    8,
    'Hidetoshi Dekisugi',
    10,
    7500
);

INSERT INTO PLAYERS VALUES (
    9,
    'Tamako Nobi',
    2,
    4500
);

INSERT INTO PLAYERS VALUES (
    10,
    'Nobisuke Nobi',
    6,
    7000
);

INSERT INTO MATCHES VALUES (
    1,
    1,
    2,
    2,
    1
);

INSERT INTO MATCHES VALUES (
    2,
    3,
    4,
    1,
    1
);

INSERT INTO MATCHES VALUES (
    3,
    5,
    6,
    3,
    2
);

INSERT INTO MATCHES VALUES (
    4,
    7,
    8,
    2,
    2
);

INSERT INTO MATCHES VALUES (
    5,
    9,
    10,
    1,
    0
);

INSERT INTO MATCHES VALUES (
    6,
    2,
    1,
    0,
    2
);

INSERT INTO MATCHES VALUES (
    7,
    4,
    3,
    2,
    2
);

INSERT INTO MATCHES VALUES (
    8,
    6,
    5,
    1,
    1
);

INSERT INTO MATCHES VALUES (
    9,
    8,
    7,
    2,
    2
);

INSERT INTO MATCHES VALUES (
    10,
    10,
    9,
    3,
    0
);

-- 1

SELECT
    TEAMS.NAME,
    TEAM_ID,
    SUM(SALARY)
FROM
    PLAYERS,
    TEAMS
WHERE
    TEAM_ID = TEAMS.ID
GROUP BY
    TEAM_ID,
    TEAMS.NAME;

-- 2

SELECT
    TEAMS.NAME,
    TEAM_ID,
    SUM(GOALS)
FROM
    (
        SELECT
            ID,
            HOME_TEAM  AS TEAM_ID,
            HOME_GOALS AS GOALS
        FROM
            MATCHES
        UNION
        SELECT
            ID,
            AWAY_TEAM  AS TEAM_ID,
            AWAY_GOALS AS GOALS
        FROM
            MATCHES
    ),       TEAMS
WHERE
    TEAM_ID = TEAMS.ID
GROUP BY
    TEAM_ID,
    TEAMS.NAME
HAVING
    SUM(GOALS) > 2;

-- 3

SELECT
    TEAMS.NAME,
    TEAM_ID,
    COUNT(*)   AS TOTAL_WINS
FROM
    (
        SELECT
            ID,
            AWAY_TEAM  AS TEAM_ID,
            AWAY_GOALS
        FROM
            MATCHES
        WHERE
            HOME_GOALS < AWAY_GOALS
        UNION
        ALL
        SELECT
            ID,
            HOME_TEAM  AS TEAM_ID,
            HOME_GOALS
        FROM
            MATCHES
        WHERE
            HOME_GOALS > AWAY_GOALS
    )       COMBINED_MATCHES,
    TEAMS
WHERE
    TEAM_ID = TEAMS.ID
GROUP BY
    TEAM_ID,
    TEAMS.NAME;

-- 4

SELECT
    T.ID          AS TEAM_ID,
    T.NAME        AS TEAM_NAME,
    SUM(TM.SCORE) AS TOTAL_POINTS
FROM
    (
        SELECT
            (
                CASE
                    WHEN M.HOME_GOALS > M.AWAY_GOALS THEN
                        M.HOME_TEAM
                    WHEN M.AWAY_GOALS > M.HOME_GOALS THEN
                        M.AWAY_TEAM
                    ELSE
                        M.HOME_TEAM
                END) AS TEAM,
            (
                CASE
                    WHEN M.HOME_GOALS = M.AWAY_GOALS THEN
                        1
                    ELSE
                        3
                END) AS SCORE
        FROM
            MATCHES M
        UNION
        SELECT
            (
                CASE
                    WHEN M.HOME_GOALS < M.AWAY_GOALS THEN
                        M.HOME_TEAM
                    WHEN M.AWAY_GOALS < M.HOME_GOALS THEN
                        M.AWAY_TEAM
                    ELSE
                        M.AWAY_TEAM
                END) AS TEAM,
            (
                CASE
                    WHEN M.HOME_GOALS = M.AWAY_GOALS THEN
                        1
                    ELSE
                        0
                END) AS SCORE
        FROM
            MATCHES M
    )       TM,
    TEAMS   T
WHERE
    T.ID = TM.TEAM
GROUP BY
    (T.ID, T.NAME)
ORDER BY
    SUM(TM.SCORE) DESC;

-- 5

SELECT
    TEAMS.NAME,
    TEAM_ID,
    SUM(GOALS)    AS TOTAL_GOALS,
    SUM(CONCEDED) AS TOTAL_CONCEDED
FROM
    (
        SELECT
            ID,
            HOME_TEAM  AS TEAM_ID,
            HOME_GOALS AS GOALS,
            AWAY_GOALS AS CONCEDED
        FROM
            MATCHES
        UNION
        SELECT
            ID,
            AWAY_TEAM  AS TEAM_ID,
            AWAY_GOALS AS GOALS,
            HOME_GOALS AS CONCEDED
        FROM
            MATCHES
    ),       TEAMS
WHERE
    TEAM_ID = TEAMS.ID
GROUP BY
    TEAM_ID,
    TEAMS.NAME;

-- 6
CREATE VIEW TEAM_PLAYER_SALARIES AS
    SELECT
        TEAMS.NAME  AS TEAM_NAME,
        TEAM_ID,
        SUM(SALARY) AS TOTAL_SALARY
    FROM
        PLAYERS,
        TEAMS
    WHERE
        TEAM_ID = TEAMS.ID
    GROUP BY
        TEAM_ID,
        TEAMS.NAME;

SELECT
    TEAM_NAME,
    TEAM_ID,
    TOTAL_SALARY
FROM
    TEAM_PLAYER_SALARIES
WHERE
    TOTAL_SALARY > 1000;

-- *** Task B ***


CREATE TABLE GRADES (
    ID NUMBER PRIMARY KEY,
    DEPARTMENT VARCHAR2(10),
    PROGRAMME VARCHAR2(10),
    COURSE_CODE VARCHAR2(10),
    GRADE VARCHAR2(3)
);

INSERT INTO GRADES VALUES (
    1,
    'CSE',
    'BSc',
    'CSE 4508',
    'A'
);

INSERT INTO GRADES VALUES (
    2,
    'CSE',
    'BSc',
    'CSE 4551',
    'B+'
);

INSERT INTO GRADES VALUES (
    3,
    'EEE',
    'BSc',
    'EEE 3201',
    'A-'
);

INSERT INTO GRADES VALUES (
    4,
    'EEE',
    'HD',
    'EEE 5203',
    'A+'
);

INSERT INTO GRADES VALUES (
    5,
    'CSE',
    'BSc',
    'CSE 4508',
    'A+'
);

INSERT INTO GRADES VALUES (
    6,
    'CSE',
    'HD',
    'CSE 5502',
    'A-'
);

INSERT INTO GRADES VALUES (
    7,
    'EEE',
    'BSc',
    'EEE 3201',
    'B'
);

INSERT INTO GRADES VALUES (
    8,
    'CSE',
    'HD',
    'CSE 5502',
    'A'
);

INSERT INTO GRADES VALUES (
    9,
    'CSE',
    'BSc',
    'CSE 4551',
    'B'
);

INSERT INTO GRADES VALUES (
    10,
    'EEE',
    'HD',
    'EEE 5203',
    'A+'
);

-- 1
SELECT
    DEPARTMENT,
    PROGRAMME,
    COURSE_CODE,
    GRADE,
    COUNT(*)
FROM
    GRADES
GROUP BY
    ROLLUP (DEPARTMENT, PROGRAMME, COURSE_CODE, GRADE)
ORDER BY
    DEPARTMENT,
    PROGRAMME,
    COURSE_CODE,
    GRADE;

-- 2
SELECT
    DEPARTMENT,
    PROGRAMME,
    COURSE_CODE,
    GRADE,
    COUNT(*)
FROM
    GRADES
GROUP BY
    CUBE (DEPARTMENT, PROGRAMME, COURSE_CODE, GRADE);