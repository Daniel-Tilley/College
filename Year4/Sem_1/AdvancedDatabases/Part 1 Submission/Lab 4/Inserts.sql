INSERT INTO TEAMS VALUES('Arsenal', 'England');
INSERT INTO TEAMS VALUES('Manchester United', 'England');
INSERT INTO TEAMS VALUES('Chelsea', 'England');
INSERT INTO TEAMS VALUES('Everton', 'England');
INSERT INTO TEAMS VALUES('Barcelona', 'Spain');
INSERT INTO TEAMS VALUES('Real Madrid', 'Spain');
INSERT INTO TEAMS VALUES('Atletico Madrid', 'Spain');
INSERT INTO TEAMS VALUES('Sevilla', 'Spain');

INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Manchester United','Chelsea',3,1,'Premier League');
INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Manchester United','Arsenal',2,2,'Premier League');
INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Arsenal','Chelsea',1,0,'Premier League');
INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Everton','Manchester United',2,5,'Premier League');
INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Real Madrid','Barcelona',1,1,'La Liga');
INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Atletico Madrid','Sevilla',3,1,'La Liga');
INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Manchester United','Real Madrid',1,1,'Champions League');
INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Barcelona','Chelsea',3,1,'Champions League');
INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Arsenal','Sevilla',0,0,'Europa Leauge');
INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Atletico Madrid','Everton',3,1,'Europa Leauge');

-- TESTING TRIGGER D
INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Manchester United','Chelsea',3,1,'La Liga');

-- TESTING TRIGGER C
INSERT INTO MATCHES VALUES (MatchIds_Seq.nextval,'Everton','Barcelona',3,1,'La Liga');


SELECT * FROM TEAMS;
SELECT * FROM MATCHES;
SELECT * FROM EUROLEAGUE ORDER BY Points DESC;
SELECT * FROM LOGTEAM;