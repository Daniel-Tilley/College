/* --------------------------------------------------------------------------------- */
/* CREATE DATA WAREHOUSE TABLES
/* --------------------------------------------------------------------------------- */

CREATE TABLE PlayerDim(
  Player_SK integer PRIMARY KEY,
  Player_Name varchar(100)
);

CREATE TABLE TeamDim(
  Team_SK integer PRIMARY KEY,
  Team_Name varchar(100)
);

CREATE TABLE TournamentDim(
  Tournament_SK integer PRIMARY KEY,
  Tournament_Desc varchar(100),
  Total_Price float
);

CREATE TABLE DateDim(
  Date_SK integer PRIMARY KEY,
  Day integer,
  Month integer,
  Year integer,
  Week integer,
  Quarter integer,
  DayOfWeek integer
);

CREATE TABLE FactResults(
  Player_SK integer,
  Tournament_SK integer,
  Team_SK integer,
  Date_SK integer,
  Rank integer,
  Price float,
  CONSTRAINT FK_Player_Dim FOREIGN KEY (Player_SK) REFERENCES PlayerDim,
  CONSTRAINT FK_Team_Dim FOREIGN KEY (Team_SK) REFERENCES TeamDim,
  CONSTRAINT FK_Tournament_Dim FOREIGN KEY (Tournament_SK) REFERENCES TournamentDim,
  CONSTRAINT FK_Date_Dim FOREIGN KEY (Date_SK) REFERENCES DateDim,
  CONSTRAINT PK_Fact_Results PRIMARY KEY (Player_SK, Tournament_SK, Team_SK, Date_SK)
);

/* --------------------------------------------------------------------------------- */
/* STAGING
/* --------------------------------------------------------------------------------- */

CREATE TABLE PlayerStage(
  p_sk integer PRIMARY KEY,
  sourceDB integer,
  p_id integer,
  p_name varchar(100)
);

CREATE SEQUENCE p_stage_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

INSERT INTO PlayerStage (sourceDB, p_id, p_name)
SELECT 1, p_id, p_name || ' ' || p_sname FROM Players1;

INSERT INTO PlayerStage (sourceDB, p_id, p_name)
SELECT 2, p_id, p_name || ' ' || p_sname FROM Players2;

SELECT * FROM PlayerStage; 
/* --------------------------------------------------------------------------------- */
CREATE TABLE TournamentStage(
  t_sk integer PRIMARY KEY,
  sourceDB integer,
  t_id integer,
  t_desc varchar(100),
  t_total_price float
);

CREATE SEQUENCE tour_stage_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

INSERT INTO TournamentStage (sourceDB, t_id, t_desc, t_total_price)
SELECT 1, T_id, t_descriprion, Total_price FROM Tournament1;

INSERT INTO TournamentStage (sourceDB, t_id, t_desc, t_total_price)
SELECT 2, T_id, t_descriprion, ROUND(Total_price / 1.3,2) FROM Tournament2;

SELECT * FROM TournamentStage;
/* --------------------------------------------------------------------------------- */

CREATE TABLE TeamStage(
  t_sk integer PRIMARY KEY,
  sourceDB integer,
  t_id integer,
  t_name varchar(100)
);

CREATE SEQUENCE t_stage_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

INSERT INTO TeamStage (sourceDB, t_id, t_name)
SELECT 1, Team_id, Team_name FROM TEAM1;

INSERT INTO TeamStage (sourceDB, t_id, t_name)
SELECT 2, Team_id, Team_name FROM TEAM2;

SELECT * FROM TeamStage;
/* --------------------------------------------------------------------------------- */

CREATE TABLE DateStage(
  d_sk integer PRIMARY KEY,
  sourceDB integer,
  Day integer,
  Month integer,
  Year integer,
  Week integer,
  Quarter integer,
  DayOfWeek integer,
  t_date integer
);

CREATE SEQUENCE d_stage_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

INSERT INTO DateStage (sourceDB, Day, Month, Year, Week, Quarter, DayOfWeek, t_date)
SELECT DISTINCT 1, 
cast(to_char(t_date,'DD') AS INTEGER), 
cast(to_char(t_date,'MM') AS INTEGER), 
cast(to_char(t_date,'YYYY') AS INTEGER),
cast(to_char(t_date,'WW') AS INTEGER),
cast(to_char(t_date,'Q') AS INTEGER), 
cast(to_char(t_date,'D') AS INTEGER),
t_id
FROM Tournament1;

INSERT INTO DateStage (sourceDB, Day, Month, Year, Week, Quarter, DayOfWeek, t_date)
SELECT DISTINCT 2, 
cast(to_char(t_date,'DD') AS INTEGER), 
cast(to_char(t_date,'MM') AS INTEGER), 
cast(to_char(t_date,'YYYY') AS INTEGER),
cast(to_char(t_date,'WW') AS INTEGER),
cast(to_char(t_date,'Q') AS INTEGER), 
cast(to_char(t_date,'D') AS INTEGER),
t_id
FROM Tournament2;

SELECT * FROM DateStage;
/* --------------------------------------------------------------------------------- */

CREATE TABLE FactStage(
  p_sk integer,
  d_sk integer,
  tor_sk integer,
  t_sk integer,
  sourceDB integer,
  p_id integer,
  t_id integer,
  rank integer,
  price float
);

INSERT INTO FactStage (sourceDB, p_id, t_id, rank, price)
SELECT 1, t_id, p_id, rank, price FROM Results1;

INSERT INTO FactStage (sourceDB, p_id, t_id, rank, price)
SELECT 2, t_id, p_id, rank, price FROM Results2;

SELECT * FROM FactStage;
/* --------------------------------------------------------------------------------- */

/* --------------------------------------------------------------------------------- */
/* First Load
/* --------------------------------------------------------------------------------- */

UPDATE FactStage
SET p_sk =
  (SELECT PlayerStage.p_sk FROM
    PlayerStage 
    WHERE (
      PlayerStage.sourceDB = FactStage.sourceDB AND PlayerStage.p_id = FactStage.p_id  
    )
  );

SELECT * FROM FactStage;

UPDATE FactStage
SET d_sk =
  (SELECT DateStage.d_sk FROM
    DateStage 
    WHERE (
      DateStage.sourceDB = FactStage.sourceDB AND DateStage.t_date = FactStage.t_id  
    )
  );

SELECT * FROM FactStage;

UPDATE FactStage
SET tor_sk =
  (SELECT TournamentStage.t_sk FROM
    TournamentStage 
    WHERE (
      TournamentStage.sourceDB = FactStage.sourceDB AND TournamentStage.t_id = FactStage.t_id  
    )
  );

SELECT * FROM FactStage;

UPDATE FactStage
SET t_sk =
  (SELECT TeamStage.t_sk FROM
    TeamStage 
    WHERE (
      TeamStage.sourceDB = FactStage.sourceDB AND TeamStage.t_id = FactStage.t_id  
    )
  );

SELECT * FROM FactStage;

INSERT INTO FactResults SELECT p_sk, tor_sk, t_sk, d_sk, rank, price FROM FactStage;

/* --------------------------------------------------------------------------------- */

/* --------------------------------------------------------------------------------- */
/* Second Load
/* --------------------------------------------------------------------------------- */

INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (7, 'Alan', 'Parker', 1);
INSERT INTO PLAYERS1 (P_ID, P_NAME, P_SNAME, TEAM_ID) VALUES (8, 'Martha', 'Bag', 2);
INSERT INTO TOURNAMENT1 (T_ID, T_DESCRIPRION, TOTAL_PRICE) VALUES (5, 'Saudi Open', 500000);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (5, 1, 1, 60000);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (5, 7, 5, 20000);
INSERT INTO RESULTS1 (T_ID, P_ID, RANK, PRICE) VALUES (2, 8, 3, 1000);

/* --------------------------------------------------------------------------------- */

