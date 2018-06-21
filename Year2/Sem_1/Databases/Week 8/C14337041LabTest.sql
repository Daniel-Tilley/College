DROP TABLE competitionEnrollment CASCADE CONSTRAINTS PURGE;
DROP TABLE team CASCADE CONSTRAINTS PURGE;
DROP TABLE competition CASCADE CONSTRAINTS PURGE;


--Competition Table creation 
CREATE TABLE competition
(
cID NUMBER (6) NOT NULL PRIMARY KEY, 
cName VARCHAR2 (30) NOT NULL, 
cFee NUMBER (3) NOT NULL 
  CONSTRAINT Fee_Max CHECK (cFee < 100), 
cPrize NUMBER (6,2) NOT NULL 
  CONSTRAINT Prize_Max CHECK (cPrize <= 9999.99), 
cDate DATE NOT NULL
);

--Team Table Creation
CREATE TABLE team
(
tID NUMBER (6) NOT NULL PRIMARY KEY, 
tName VARCHAR2 (30) NOT NULL, 
tAgeGroup NUMBER (2) NOT NULL 
  CONSTRAINT Age_Check CHECK (tAgeGroup BETWEEN 6 AND 18), 
tManager VARCHAR2 (30) NOT NULL, 
tEmail VARCHAR2(30) NOT NULL 
  CONSTRAINT Email_Check CHECK (tEmail LIKE '%@%')
);

--CompetitionEnrollment Table Creation
CREATE TABLE competitionEnrollment
(
compenrolID NUMBER (6) NOT NULL PRIMARY KEY, 
competitionID NUMBER (6) NOT NULL, 
teamID NUMBER (6) NOT NULL, 
finalPlacing NUMBER (2) DEFAULT NULL 
  CONSTRAINT Place_Check CHECK (finalPlacing < 99),

constraint Comp_ID_FK foreign key (competitionID) references competition (cID),
constraint Team_ID_FK foreign key (teamID) references team (tID) 
);

--Insert data into tables 
--Team 
insert into team (tID, tName, tAgeGroup, tManager, tEmail) values (1001, 'Fighting Lizards', 12, 'D. Smith', '1001@mail.com');
insert into team (tID, tName, tAgeGroup, tManager, tEmail) values (1002, 'Tiny Strikers', 12, 'D. Smith', '1002@mail.com');
insert into team (tID, tName, tAgeGroup, tManager, tEmail) values (1003, 'King Players', 12, 'D. Smith', '1003@mail.com');

--Competition
insert into competition (cID, cName, cFee, cPrize, cDate) values (1001, 'Undr. 15', 10.00,	900.00,	'04/MAR/2014');
insert into competition (cID, cName, cFee, cPrize, cDate) values (1002, 'Open Comp', 20.00, 1000.00, '04/MAR/2012');
insert into competition (cID, cName, cFee, cPrize, cDate) values (1003, 'Football Festival', 0.00, 400.00,	'01/JAN/2014');
insert into competition (cID, cName, cFee, cPrize, cDate) values (1004, 'FAI Qualifier', 10.00, 600.00, '12/MAR/2014');

--CompEnrol 
insert into competitionEnrollment (compenrolID, competitionID, teamID, finalPlacing) values (1, 1001, 1001, 3);
insert into competitionEnrollment (compenrolID, competitionID, teamID, finalPlacing) values (2, 1001, 1003, 1);
insert into competitionEnrollment (compenrolID, competitionID, teamID, finalPlacing) values (3, 1002, 1003, 3);
insert into competitionEnrollment (compenrolID, competitionID, teamID, finalPlacing) values (4, 1003, 1002, NULL);

--Select Statements
select tID, tName FROM team WHERE tAgeGroup BETWEEN 12 AND 15;
ORDER BY DESC;


