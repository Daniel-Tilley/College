--DROP TABLES IF THEY EXIST
DROP TABLE ORDERITEM CASCADE CONSTRAINTS PURGE;
DROP TABLE MENUITEM CASCADE CONSTRAINTS PURGE;
DROP TABLE BARORDER CASCADE CONSTRAINTS PURGE;

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