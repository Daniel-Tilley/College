--Databases Assignment
--Daniel Tilley -- C14337041

--Drop tables if they already exist
DROP TABLE GAMES CASCADE CONSTRAINTS PURGE;
DROP TABLE SUPPLIER CASCADE CONSTRAINTS PURGE;
DROP TABLE SALES_REPRESENTATIVE CASCADE CONSTRAINTS PURGE;
DROP TABLE PLATFORM CASCADE CONSTRAINTS PURGE;
DROP TABLE ORDERS CASCADE CONSTRAINTS PURGE;
DROP TABLE ITEMS_PER_ORDER CASCADE CONSTRAINTS PURGE;
DROP TABLE AGE_GROUP CASCADE CONSTRAINTS PURGE;
DROP TABLE REVIEWS CASCADE CONSTRAINTS PURGE;
DROP TABLE REVIEWER CASCADE CONSTRAINTS PURGE;

-- *** Creates ***
--Table to store games information
CREATE TABLE GAMES
(
	Game_ID              NUMBER(6) NOT NULL ,
	G_Name               VARCHAR2(60) NOT NULL ,
	G_Description        VARCHAR2(60) NULL ,
	G_ReleaseDate        DATE NULL ,
	G_Stock              NUMBER(4) NOT NULL ,
	G_CostPrice          NUMBER(5,2) NOT NULL ,
	G_SalesPrice         NUMBER(5,2) NULL,
	Supplier_ID          NUMBER(6) NOT NULL ,
	Age_ID               NUMBER(6) NOT NULL ,
	Platform_ID          NUMBER(6) NOT NULL ,
	CONSTRAINT GAMES_PK PRIMARY KEY (Game_ID)
);

--Table to store supplier information
CREATE TABLE SUPPLIER
(
	Supplier_ID           NUMBER(6) NOT NULL ,
	S_Name         		  VARCHAR2(20) NOT NULL ,
	S_Email        		  VARCHAR2(60) NULL ,
	S_Phone        		  NUMBER(20) NULL ,
	CONSTRAINT S_Email__CHK CHECK (S_Email LIKE '%@%'),
	CONSTRAINT SUPPLIER_PK PRIMARY KEY (Supplier_ID)
);

--Table to store all sales rep info 
CREATE TABLE SALES_REPRESENTATIVE
(
	SalesRep_ID           NUMBER(6) NOT NULL ,
	Supplier_ID           NUMBER(6) NOT NULL ,
	SalesRepName          VARCHAR2(60) NOT NULL ,
	CONSTRAINT SALES_REPRESENTATIVE_PK PRIMARY KEY (SalesRep_ID, Supplier_ID)
);

--Table to store Platform information
CREATE TABLE PLATFORM
(
	Platform_ID          NUMBER(6) NOT NULL ,
	OS_Type      		 VARCHAR2(20) NOT NULL ,
	Graphics_Card        VARCHAR2(20) NOT NULL ,
	Speed_Of_Process	 VARCHAR2(20) NOT NULL ,
	DiscSpace            VARCHAR2(20) NOT NULL ,
	CD_RomSpeed          VARCHAR2(20) NULL ,
	CONSTRAINT  PLATFORM_PK PRIMARY KEY (Platform_ID)
);

--Table to store orders
CREATE TABLE ORDERS
(
	Order_No             NUMBER(6) NOT NULL ,
	Supplier_ID          NUMBER(6) NOT NULL ,
	SupplierName         VARCHAR(20) NULL ,
	OrderDate            DATE NOT NULL ,
	DeliveryDate         DATE NOT NULL ,
	CONSTRAINT ORDERS_PK PRIMARY KEY (Order_No)
);

--Table to store Order amounts
CREATE TABLE ITEMS_PER_ORDER
(
	Order_No              NUMBER(6) NOT NULL ,
	Game_ID               NUMBER(6) NOT NULL ,
	Quantity        	  NUMBER(6) NOT NULL ,
	CONSTRAINT ITEMS_PER_ORDER_PK PRIMARY KEY (Order_No,Game_ID)
);

--Table to store age group information
CREATE TABLE AGE_GROUP
(
	Age_ID               NUMBER(6) NOT NULL ,
	AgeClass             VARCHAR2(20) NOT NULL ,
	SkillSet             VARCHAR2(100) NOT NULL ,
	Description          VARCHAR2(100) NULL ,
	CONSTRAINT AGE_GROUP_PK PRIMARY KEY (Age_ID)
);

--Table to store game reviews
CREATE TABLE REVIEWS
(
	Game_ID              NUMBER(6) NOT NULL ,
	Reviewer_ID          NUMBER(6) NOT NULL ,
	Review           	 VARCHAR2(120) NOT NULL ,
	ReviewDate           DATE NULL ,
	--Extra column to be dropped
	R_User	             VARCHAR2(20) NOT NULL ,
	CONSTRAINT REVIEWS_PK PRIMARY KEY (Game_ID, Reviewer_ID)
);

--Table to store reviewer information
CREATE TABLE REVIEWER
(
	Reviewer_ID	         NUMBER(6) NOT NULL ,
	R_Pass               VARCHAR2(20) NOT NULL ,
	R_Email              VARCHAR2(60) NOT NULL ,
	CONSTRAINT R_Email__CHK CHECK (R_Email LIKE '%@%'),
	CONSTRAINT REVIEWER_PK PRIMARY KEY (Reviewer_ID)
);

--Add foregin Keys to tables
ALTER TABLE GAMES ADD CONSTRAINT GAMES__SUPPLIER__FK FOREIGN KEY (Supplier_ID) REFERENCES SUPPLIER (Supplier_ID);
ALTER TABLE GAMES ADD CONSTRAINT GAMES__AGE_GROUP__FK FOREIGN KEY (Age_ID) REFERENCES AGE_GROUP (Age_ID);
ALTER TABLE GAMES ADD CONSTRAINT GAMES__PLATFORM__FK FOREIGN KEY (Platform_ID) REFERENCES PLATFORM (Platform_ID);
ALTER TABLE SALES_REPRESENTATIVE ADD CONSTRAINT SALES_REP__SUPPLIER__FK FOREIGN KEY (Supplier_ID) REFERENCES SUPPLIER (Supplier_ID);
ALTER TABLE ITEMS_PER_ORDER ADD CONSTRAINT ITEMS_PER_ORDER__ORDERS__FK FOREIGN KEY (Order_No) REFERENCES ORDERS (Order_No);
ALTER TABLE ITEMS_PER_ORDER ADD CONSTRAINT ITEMS_PER_ORDER__GAMES__FK FOREIGN KEY (Game_ID) REFERENCES GAMES (Game_ID); 
ALTER TABLE ORDERS ADD CONSTRAINT ORDERS__SUPPLIER__FK FOREIGN KEY (Supplier_ID) REFERENCES SUPPLIER (Supplier_ID);
ALTER TABLE REVIEWS ADD CONSTRAINT REVIEWS__GAMES__FK FOREIGN KEY (Game_ID) REFERENCES GAMES (Game_ID);
ALTER TABLE REVIEWS ADD CONSTRAINT REVIEWS__REVIEWER__FK FOREIGN KEY (Reviewer_ID) REFERENCES REVIEWER (Reviewer_ID);

--Drop a foreign key *** Drop Constraint ***
ALTER TABLE GAMES DROP CONSTRAINT GAMES__SUPPLIER__FK;
--Re-Add that key 
ALTER TABLE GAMES ADD CONSTRAINT GAMES__SUPPLIER__FK FOREIGN KEY (Supplier_ID) REFERENCES SUPPLIER (Supplier_ID);

--Drop a column I accidentally added to the wrong table and add it to the right table *** Drop and Add Column ***
ALTER TABLE REVIEWS DROP COLUMN R_User;
ALTER TABLE REVIEWER ADD R_User VARCHAR2(20) NOT NULL;

--I need to check that all our sales prices are greater than our cost prices *** Add Value Constraint***
ALTER TABLE GAMES ADD CONSTRAINT G_Stock__CHK CHECK (G_CostPrice > G_SalesPrice);
--I meant to say Sales price is greater than, not less than, I will modify the check *** Modify Constraint***
ALTER TABLE GAMES DROP CONSTRAINT G_Stock__CHK;
ALTER TABLE GAMES ADD CONSTRAINT G_Stock__CHK CHECK (G_CostPrice < G_SalesPrice);

--I just realised I might make the supplier number VARCHAR to allow them to enter 0's for first digit *** Modify Column ***
ALTER TABLE SUPPLIER MODIFY S_Phone VARCHAR2(20);

-- *** Inserts ***
--INSERT INTO  AGE_GROUP
INSERT INTO AGE_GROUP (Age_ID,AgeClass,SkillSet,Description) VALUES (100001,'PG','Can solve problems','Strategy');
INSERT INTO AGE_GROUP (Age_ID,AgeClass,SkillSet,Description) VALUES (100002,'3+','Ability work with teams','Sports');
INSERT INTO AGE_GROUP (Age_ID,AgeClass,SkillSet,Description) VALUES (100003,'12+','Can follow a story and make descisions','RPG');
INSERT INTO AGE_GROUP (Age_ID,AgeClass,SkillSet,Description) VALUES (100004,'15+','Can deal with moderate violance and flashing images','Action and Adventure');
INSERT INTO AGE_GROUP (Age_ID,AgeClass,SkillSet,Description) VALUES (100005,'18+','Able to deal with gruesome images and combat scenes','FPS');

-- INSERTs INTO SUPPLIER
INSERT INTO SUPPLIER (Supplier_ID,S_Name,S_Email,S_Phone) VALUES (200001,'Game Shop 1','GameShop1@Game.ie','01 111 1111');
INSERT INTO SUPPLIER (Supplier_ID,S_Name,S_Email,S_Phone) VALUES (200002,'Game Shop 2','GameShop2@Game.ie','01 222 2222');
INSERT INTO SUPPLIER (Supplier_ID,S_Name,S_Email,S_Phone) VALUES (200003,'Game Shop 3','GameShop3@Game.ie','01 333 3333');
--Will upadate to change game shop 6 to game shop 4
INSERT INTO SUPPLIER (Supplier_ID,S_Name,S_Email,S_Phone) VALUES (200004,'Game Shop 4','GameShop4@Game.ie','01 444 4444');
INSERT INTO SUPPLIER (Supplier_ID,S_Name,S_Email,S_Phone) VALUES (200005,'Game Shop 5','GameShop5@Game.ie','01 555 5555');

--INSERT INTO PLATFORM
INSERT INTO PLATFORM (Platform_ID,OS_Type,Graphics_Card,Speed_Of_Process,DiscSpace,CD_RomSpeed) VALUES (300001,'Windows 7','AMD R9','3.0 GHZ','30 GB','7200 RPM');
INSERT INTO PLATFORM (Platform_ID,OS_Type,Graphics_Card,Speed_Of_Process,DiscSpace,CD_RomSpeed) VALUES (300002,'Windows 10','AMD R7','2.7 GHZ','20 GB','7200 RPM');
INSERT INTO PLATFORM (Platform_ID,OS_Type,Graphics_Card,Speed_Of_Process,DiscSpace,CD_RomSpeed) VALUES (300003,'Windows 7','AMD R9','2.9 GHZ','25 GB','7200 RPM');
INSERT INTO PLATFORM (Platform_ID,OS_Type,Graphics_Card,Speed_Of_Process,DiscSpace,CD_RomSpeed) VALUES (300004,'Windows 10','AMD R8','2.4 GHZ','60 GB','7200 RPM');
INSERT INTO PLATFORM (Platform_ID,OS_Type,Graphics_Card,Speed_Of_Process,DiscSpace,CD_RomSpeed) VALUES (300005,'Windows 7','AMD R7','3.1 GHZ','50 GB','7200 RPM');

-- INSERT INTO GAMES 
INSERT INTO GAMES (Game_ID,G_Name,G_Description,G_ReleaseDate,G_Stock,G_CostPrice,G_SalesPrice,Supplier_ID,Age_ID,Platform_ID) 
VALUES (400001,'Tactitian Master','Strategy Game','01/JAN/2015',60,59.99,NULL,200001,100001,300001);
INSERT INTO GAMES (Game_ID,G_Name,G_Description,G_ReleaseDate,G_Stock,G_CostPrice,G_SalesPrice,Supplier_ID,Age_ID,Platform_ID) 
VALUES (400002,'Fifa 15','Sports Game','01/FEB/2015',50,74.99,NULL,200002,100002,300002);
INSERT INTO GAMES (Game_ID,G_Name,G_Description,G_ReleaseDate,G_Stock,G_CostPrice,G_SalesPrice,Supplier_ID,Age_ID,Platform_ID) 
VALUES (400003,'Dungeons and Dragons: Exclussive Edition','RPG','01/MAR/2015',40,89.99,NULL,200003,100003,300003);
INSERT INTO GAMES (Game_ID,G_Name,G_Description,G_ReleaseDate,G_Stock,G_CostPrice,G_SalesPrice,Supplier_ID,Age_ID,Platform_ID) 
VALUES (400004,'Fallout 4: Special Edition','Fighting Game','01/APR/2015',30,99.99,NULL,200004,100004,300004);
INSERT INTO GAMES (Game_ID,G_Name,G_Description,G_ReleaseDate,G_Stock,G_CostPrice,G_SalesPrice,Supplier_ID,Age_ID,Platform_ID) 
VALUES (400005,'Call Of Duty: Deluxe Edition','First Person Shooter','01/MAY/2015',20,149.99,NULL,200005,100005,300005);
--set sales price as 40 % of cost price *** Update ***
UPDATE GAMES SET G_SalesPrice = ((G_CostPrice) + G_CostPrice * 0.4);

--INSERT INTO ORDERS
INSERT INTO ORDERS (Order_No,Supplier_ID,SupplierName,OrderDate,DeliveryDate) VALUES (500001,200001,'Game Shop 1','01/JUN/15','08/JUN/15');
INSERT INTO ORDERS (Order_No,Supplier_ID,SupplierName,OrderDate,DeliveryDate) VALUES (500002,200002,'Game Shop 2','02/JUN/15','09/JUN/15');
INSERT INTO ORDERS (Order_No,Supplier_ID,SupplierName,OrderDate,DeliveryDate) VALUES (500003,200003,'Game Shop 3','03/JUN/15','10/JUN/15');
INSERT INTO ORDERS (Order_No,Supplier_ID,SupplierName,OrderDate,DeliveryDate) VALUES (500004,200004,'Game Shop 4','04/JUN/15','11/JUN/15');
INSERT INTO ORDERS (Order_No,Supplier_ID,SupplierName,OrderDate,DeliveryDate) VALUES (500005,200005,'Game Shop 5','05/JUN/15','12/JUN/15');

--INSERT INTO ITEMS_PER_ORDER
INSERT INTO ITEMS_PER_ORDER (Order_No,Game_ID,Quantity) VALUES (500001,400001,20);
INSERT INTO ITEMS_PER_ORDER (Order_No,Game_ID,Quantity) VALUES (500002,400002,15);
INSERT INTO ITEMS_PER_ORDER (Order_No,Game_ID,Quantity) VALUES (500003,400003,12);
INSERT INTO ITEMS_PER_ORDER (Order_No,Game_ID,Quantity) VALUES (500004,400004,10);
INSERT INTO ITEMS_PER_ORDER (Order_No,Game_ID,Quantity) VALUES (500005,400005,5);

--INSERT INTO SALES_REPRESENTATIVE
INSERT INTO SALES_REPRESENTATIVE (SalesRep_ID,Supplier_ID,SalesRepName) VALUES (600001,200001,'Daniel Tilley');
INSERT INTO SALES_REPRESENTATIVE (SalesRep_ID,Supplier_ID,SalesRepName) VALUES (600002,200002,'Bob Jones');
INSERT INTO SALES_REPRESENTATIVE (SalesRep_ID,Supplier_ID,SalesRepName) VALUES (600003,200003,'Frank Byrne');
INSERT INTO SALES_REPRESENTATIVE (SalesRep_ID,Supplier_ID,SalesRepName) VALUES (600004,200004,'John Smith');
INSERT INTO SALES_REPRESENTATIVE (SalesRep_ID,Supplier_ID,SalesRepName) VALUES (600005,200005,'George Ryan');

--INSERT INTO REVIEWER
INSERT INTO REVIEWER (Reviewer_ID,R_User,R_Pass,R_Email) VALUES (1,'D_Tilley','Password1','1@fakemail.com');
INSERT INTO REVIEWER (Reviewer_ID,R_User,R_Pass,R_Email) VALUES (2,'Rev_View','Password2','2@fakemail.com');
INSERT INTO REVIEWER (Reviewer_ID,R_User,R_Pass,R_Email) VALUES (3,'GME_DEST','Password3','3@fakemail.com');
INSERT INTO REVIEWER (Reviewer_ID,R_User,R_Pass,R_Email) VALUES (4,'Bobs_Job','Password4','4@fakemail.com');
INSERT INTO REVIEWER (Reviewer_ID,R_User,R_Pass,R_Email) VALUES (5,'Jon_Snow','Password5','5@fakemail.com');

--INSERT INTO REVIEWS
INSERT INTO REVIEWS (Game_ID,Reviewer_ID,Review,ReviewDate) VALUES (400001,1,'not Great, Not rubbish, was merley ok to say the least','01/JUL/15');
INSERT INTO REVIEWS (Game_ID,Reviewer_ID,Review,ReviewDate) VALUES (400001,2,'much better than the last installment 9/10','02/JUL/15');
INSERT INTO REVIEWS (Game_ID,Reviewer_ID,Review,ReviewDate) VALUES (400001,3,'really got into this one and liked it alot!!!','03/JUL/15');
INSERT INTO REVIEWS (Game_ID,Reviewer_ID,Review,ReviewDate) VALUES (400001,4,'over Hyped and not worth the time or money','04/JUL/15');
INSERT INTO REVIEWS (Game_ID,Reviewer_ID,Review,ReviewDate) VALUES (400001,5,'one word, AMAZING!!!','05/JUL/15');

--Commit changes so that they are saved
COMMIT;

--***Select statements***
--Inner joins on 2 tables
SELECT * FROM GAMES JOIN AGE_GROUP USING (Age_ID) WHERE Age_ID < 100003;
SELECT * FROM REVIEWS JOIN REVIEWER USING (Reviewer_ID) WHERE Reviewer_ID > 3;

--Inner Join on 3 tables
SELECT * FROM GAMES JOIN SUPPLIER USING (Supplier_ID) JOIN ORDERS USING (Supplier_ID) WHERE Order_No > 500003;

--Right Outter Join
SELECT * FROM GAMES RIGHT JOIN AGE_GROUP USING (Age_ID) WHERE SkillSet like '%solve%';

-- Single Row Function
SELECT Game_ID, Reviewer_ID, INITCAP (Review) FROM REVIEWS;

--Agregate and Grouping
SELECT MAX(G_SalesPrice) FROM GAMES;
SELECT Game_ID, ROUND( AVG(G_SalesPrice), 1) FROM GAMES GROUP BY Game_ID;

-- Sub Query
SELECT * FROM ORDERS WHERE Supplier_ID IN (SELECT Supplier_ID FROM ORDERS WHERE Supplier_ID < 200003);