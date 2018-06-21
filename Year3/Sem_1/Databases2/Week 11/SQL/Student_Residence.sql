--DROP TABLES IF THEY EXIST
DROP TABLE INSPECTION CASCADE CONSTRAINTS PURGE;
DROP TABLE DAMAGE CASCADE CONSTRAINTS PURGE;
DROP TABLE OCCUPANCY CASCADE CONSTRAINTS PURGE;
DROP TABLE ROOM CASCADE CONSTRAINTS PURGE;
DROP TABLE ORDERITEM CASCADE CONSTRAINTS PURGE;
DROP TABLE MENUITEM CASCADE CONSTRAINTS PURGE;
DROP TABLE BARORDER CASCADE CONSTRAINTS PURGE;
DROP TABLE STUDENT CASCADE CONSTRAINTS PURGE;

------------------------------------------------------------------------------
--CREATES AND INSERTS FOR STUDENT TABLE
CREATE TABLE STUDENT(
  StudentNo VARCHAR2(9) NOT NULL,
  StudentName VARCHAR2(50) NOT NULL,
  HomeAddr VARCHAR2(120) NOT NULL,
  Programme CHAR(6) NOT NULL,
  Stage INTEGER NOT NULL,
  DateInResidence DATE NOT NULL,
  DateLeft DATE NOT NULL,
  noViolations INTEGER NOT NULL,
  noMissedDays INTEGER NOT NULL,
  AccountOutstanding NUMBER(6,2) NOT NULL,
  CreditLimit NUMBER(6,2) NOT NULL,
  
  PRIMARY KEY (StudentNo)
);

DROP SEQUENCE StudentNoSeq;
CREATE SEQUENCE StudentNoSeq START WITH 10000000;


--INSERTS
insert into student
values ('C'||StudentNoSeq.nextval,'Daniel Tilley','12 Atlanta House, Sidmonton Rd, Bray, Co. Wicklow','DT228', 3, TO_DATE('2013-08-12','YYYY-MM-DD'), TO_DATE('2015-06-27','YYYY-MM-DD') , 0, 5, 0.00, 70.00);

insert into student 
values ('C'||StudentNoSeq.nextval,'Baz Undecided','23 Luttrell Park Dr, Castleknock, Co. Dublin','DT228', 3, TO_DATE('2013-08-15','YYYY-MM-DD'), TO_DATE('2015-06-28','YYYY-MM-DD') , 4, 14, 60.00, 60.00);

insert into student 
values ('C'||StudentNoSeq.nextval,'Oliver Zimmerman','3 African, Henry St., Co. Dublin','DT228', 3, TO_DATE('2013-08-17','YYYY-MM-DD'), TO_DATE('2015-06-22','YYYY-MM-DD') , 0, 0, 0.00, 100.00);

insert into student 
values ('C'||StudentNoSeq.nextval,'Alex Brady','15 Cosby lane, Stillorgan, Co. Dublin','DT228', 3, TO_DATE('2013-08-22','YYYY-MM-DD'), TO_DATE('2015-06-14','YYYY-MM-DD') , 1, 25, 32.00, 50.00);

insert into student 
values ('C'||StudentNoSeq.nextval,'Mark Twomey','11 Shanganagh Vale, Loughlinstown, Co. Dublin 18','DT228', 3, TO_DATE('2013-08-28','YYYY-MM-DD'), TO_DATE('2015-06-29','YYYY-MM-DD') , 2, 16, 0.00, 90.00);


------------------------------------------------------------------------------
--CREATES AND INSERTS FOR ROOM TABLE
CREATE TABLE ROOM(
  RoomNo NUMBER(3) NOT NULL,
  Occupancy CHAR(1) NOT NULL,
  NoBeds NUMBER(1) NOT NULL,
  
  PRIMARY KEY (RoomNo),
  CHECK(Occupancy in ('Y','N')), --CHECK OCCUPANCY IS EITHER YES OR NO
  CHECK(NoBeds < 3 AND NoBeds > 0) --CHECK RIGHT NUMBER OF BEDS ENTERED
);

DROP SEQUENCE RoomNoSeq;
CREATE SEQUENCE RoomNoSeq START WITH 100;


--INSERTS
insert into room values (RoomNoSeq.nextval, 'Y', 2);
insert into room values (RoomNoSeq.nextval, 'N', 2);
insert into room values (RoomNoSeq.nextval, 'N', 1);
insert into room values (RoomNoSeq.nextval, 'Y', 2);
insert into room values (RoomNoSeq.nextval, 'Y', 1);


------------------------------------------------------------------------------
--CREATES AND INSERTS FOR OCCUPANCY TABLE
CREATE TABLE OCCUPANCY(
  DateFrom DATE NOT NULL,
  DateTo DATE NOT NULL, 
  
  StudentNo NOT NULL REFERENCES STUDENT,
  RoomNo NOT NULL REFERENCES ROOM,
  PRIMARY KEY (StudentNo,RoomNo)
);


--INSERTS
insert into occupancy values (TO_DATE('2013-08-12','YYYY-MM-DD'), TO_DATE('2015-06-27','YYYY-MM-DD'), 'C10000000', 100);
insert into occupancy values (TO_DATE('2013-08-15','YYYY-MM-DD'), TO_DATE('2015-06-28','YYYY-MM-DD'), 'C10000001', 100);
insert into occupancy values (TO_DATE('2013-08-17','YYYY-MM-DD'), TO_DATE('2015-06-22','YYYY-MM-DD'), 'C10000002', 104);
insert into occupancy values (TO_DATE('2013-08-22','YYYY-MM-DD'), TO_DATE('2015-07-1','YYYY-MM-DD'), 'C10000003', 103);
insert into occupancy values (TO_DATE('2013-08-28','YYYY-MM-DD'), TO_DATE('2015-06-29','YYYY-MM-DD'), 'C10000004', 103);


------------------------------------------------------------------------------
--CREATES AND INSERTS FOR INSPECTION TABLE
CREATE TABLE INSPECTION(
  Rating NUMBER(2) NOT NULL,
  Comments VARCHAR2(50) NOT NULL,
  InspectionDate Date NOT NULL,
  PorterName VARCHAR2(50) NOT NULL,
  
  RoomNo NOT NULL REFERENCES ROOM,
  CHECK(Rating < 11 AND Rating > 0), --CHECK THE APPROPRIATE RATING GIVEN
  PRIMARY KEY (RoomNo, InspectionDate)
);


--INSERTS
insert into inspection values (9, 'Room is nice and clean', TO_DATE('2013-10-13','YYYY-MM-DD'), 'Karl Turner', 100);
insert into inspection values (7, 'Room is clean, but there is spillage', TO_DATE('2013-10-13','YYYY-MM-DD'), 'Karl Turner', 104);
insert into inspection values (5, 'Furniture broken, room very messy', TO_DATE('2013-10-13','YYYY-MM-DD'), 'Karl Turner', 103);
insert into inspection values (10, 'Exceptionally clean, gold star *', TO_DATE('2013-11-14','YYYY-MM-DD'), 'Karl Turner', 100);
insert into inspection values (7, 'Room is tidy', TO_DATE('2013-11-14', 'YYYY-MM-DD'), 'Karl Turner', 103);


------------------------------------------------------------------------------
--CREATES AND INSERTS FOR DAMAGE TABLE
CREATE TABLE DAMAGE(
  Description VARCHAR2(100) NOT NULL,
  Cost NUMBER(6,2) NOT NULL,
  StudentNo VARCHAR2(9) NOT NULL,
  DamageDate DATE NOT NULL,
  HandyMan VARCHAR2(50) NOT NULL,
  PorterName VARCHAR2(50) NOT NULL,
  Status CHAR(1) NOT NULL,
  
  RoomNo REFERENCES ROOM,
  CHECK(Status in ('R','D')),  --R for Repaired, D for Damaged
  PRIMARY KEY (RoomNo, DamageDate)
);


--INSERTS
insert into damage values ('Roommates had a fist fight on the kitchen table, causing it to break.', 250.00, 'C10000004',  TO_DATE('2013-10-13', 'YYYY-MM-DD'), 'Bob', 'Karl Turner', 'D' , 103);



------------------------------------------------------------------------------
--CREATES AND INSERTS FOR BARORDER TABLE
CREATE TABLE BARORDER(
  OrderDate DATE NOT NULL,
  DeliverToRoom NUMBER(3) NOT NULL,
  
  StudentNo NOT NULL REFERENCES STUDENT,
  PRIMARY KEY (StudentNo, OrderDate)
);


--INSERTS
insert into barorder values (TO_DATE('2013-08-13','YYYY-MM-DD'), 100, 'C10000000');
insert into barorder values (TO_DATE('2013-08-14','YYYY-MM-DD'), 100, 'C10000000');
insert into barorder values (TO_DATE('2013-08-15','YYYY-MM-DD'), 100, 'C10000001');
insert into barorder values (TO_DATE('2013-08-26','YYYY-MM-DD'), 103, 'C10000003');
insert into barorder values (TO_DATE('2013-08-28','YYYY-MM-DD'), 103, 'C10000004');

------------------------------------------------------------------------------
--CREATES AND INSERTS FOR MENUITEM TABLE
CREATE TABLE MENUITEM(
  ItemName VARCHAR2(20) NOT NULL,
  ItemCost NUMBER(5,2) NOT NULL,
  
  PRIMARY KEY (ItemName)
);


--INSERTS
insert into menuitem values ('Double Burger', 3.49);
insert into menuitem values ('French Fries', 2.00);
insert into menuitem values ('Side Salad', 2.00);
insert into menuitem values ('Cola can 500ml', 0.80);
insert into menuitem values ('White wine 750ml', 14.00);


------------------------------------------------------------------------------
--CREATES AND INSERTS FOR ORDERITEM TABLE
CREATE TABLE ORDERITEM(
  Quantity NUMBER(3) NOT NULL,
  StudentNo VARCHAR(9) NOT NULL,
  OrderDate DATE NOT NULL,
  
  ItemName REFERENCES MENUITEM,
  PRIMARY KEY (StudentNo, OrderDate, ItemName),
  FOREIGN KEY (StudentNo, OrderDate) REFERENCES BARORDER (StudentNo, OrderDate)
);


--INSERTS
insert into orderitem values (2, 'C10000000', TO_DATE('2013-08-13','YYYY-MM-DD'), 'Double Burger');
insert into orderitem values (1, 'C10000000', TO_DATE('2013-08-13','YYYY-MM-DD'), 'French Fries');
insert into orderitem values (1, 'C10000000', TO_DATE('2013-08-13','YYYY-MM-DD'), 'Cola can 500ml');

insert into orderitem values (2, 'C10000000', TO_DATE('2013-08-14','YYYY-MM-DD'), 'Double Burger');
insert into orderitem values (1, 'C10000000', TO_DATE('2013-08-14','YYYY-MM-DD'), 'French Fries');
insert into orderitem values (1, 'C10000000', TO_DATE('2013-08-14','YYYY-MM-DD'), 'Cola can 500ml');

insert into orderitem values (1, 'C10000001', TO_DATE('2013-08-15','YYYY-MM-DD'), 'Double Burger');
insert into orderitem values (1, 'C10000001', TO_DATE('2013-08-15','YYYY-MM-DD'), 'Side Salad');
insert into orderitem values (1, 'C10000001', TO_DATE('2013-08-15','YYYY-MM-DD'), 'French Fries');
insert into orderitem values (1, 'C10000001', TO_DATE('2013-08-15','YYYY-MM-DD'), 'Cola can 500ml');

insert into orderitem values (1, 'C10000003', TO_DATE('2013-08-26','YYYY-MM-DD'), 'Double Burger');
insert into orderitem values (2, 'C10000003', TO_DATE('2013-08-26','YYYY-MM-DD'), 'Side Salad');
insert into orderitem values (1, 'C10000003', TO_DATE('2013-08-26','YYYY-MM-DD'), 'Cola can 500ml');

insert into orderitem values (2, 'C10000004', TO_DATE('2013-08-28','YYYY-MM-DD'), 'Side Salad');
insert into orderitem values (1, 'C10000004', TO_DATE('2013-08-28','YYYY-MM-DD'), 'White wine 750ml');

COMMIT;