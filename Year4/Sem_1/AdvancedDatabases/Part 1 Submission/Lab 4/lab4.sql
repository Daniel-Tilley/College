DROP TABLE MATCHES;
DROP TABLE TEAMS;
DROP TABLE EUROLEAGUE;
DROP TABLE LOGTEAM;
DROP SEQUENCE MatchIds_Seq;

CREATE SEQUENCE MatchIds_Seq START WITH 1;

CREATE TABLE TEAMS(
  TeamName varchar(20) PRIMARY KEY,
  TeamCountry varchar(20) not null CHECK (TeamCountry IN ('Spain','England'))
);

CREATE TABLE MATCHES(
  MatchID integer PRIMARY KEY,
  TeamA_Name varchar(20) not null,
  TeamB_Name varchar(20) not null,
  Goal_A integer not null CHECK (Goal_A >= 0),
  Goal_B integer not null CHECK (Goal_B >= 0),
  Competition varchar(30) not null CHECK (Competition IN ('Champions League','Europa Leauge','Premier League','La Liga')),
  CONSTRAINT fk_team_a FOREIGN KEY (TeamA_Name) REFERENCES TEAMS (TeamName),
  CONSTRAINT fk_team_b FOREIGN KEY (TeamB_Name) REFERENCES TEAMS (TeamName)
);

CREATE TABLE EUROLEAGUE(
  TeamName varchar(20) PRIMARY KEY,
  Points integer not null,
  Goals_Scored integer not null,
  Goals_Conceded integer not null,
  Difference number(2) not null
);

CREATE TABLE LOGTEAM(
  TeamName varchar(20),
  InsertDate DATE,
  Primary Key (TeamName, InsertDate)
);