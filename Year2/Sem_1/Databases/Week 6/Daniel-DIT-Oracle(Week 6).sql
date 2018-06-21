DROP TABLE pCustomer CASCADE CONSTRAINTS PURGE;

DROP TABLE County CASCADE CONSTRAINTS PURGE;

DROP TABLE Courier CASCADE CONSTRAINTS PURGE;

DROP TABLE Parcel CASCADE CONSTRAINTS PURGE;

CREATE TABLE pCustomer
(
	cNo                 NUMBER(6) NOT NULL ,
	cName               VARCHAR2(30) NOT NULL ,
	street              VARCHAR2(30) NOT NULL ,
	city                VARCHAR2(30) NOT NULL ,
  countyID            NUMBER (6) NOT NULL ,
  phone               VARCHAR2 (30) NOT NULL ,
  email               VARCHAR2(20) NOT NULL CHECK (email LIKE '%@%') ,
  
CONSTRAINT  PCustomer_PK PRIMARY KEY (cNo)
);

CREATE TABLE County
(
	countyID            NUMBER(6) NOT NULL ,
	countyName          VARCHAR2(30) NOT NULL ,
  
CONSTRAINT  County_PK PRIMARY KEY (countyID)
);

CREATE TABLE Courier
(
	cID                NUMBER(6) NOT NULL ,
	fName              VARCHAR2(30) NOT NULL ,
	surname            VARCHAR2(30)NOT NULL ,
	salary             NUMBER(7,2) NOT NULL ,
  
CONSTRAINT  Courier_PK PRIMARY KEY (cID)
);

CREATE TABLE Parcel
(
	pNo                 NUMBER(6) NOT NULL ,
	courierID           NUMBER(6) NOT NULL ,
  custNo              DATE NOT NULL ,
  pdate               DATE NOT NULL ,
  pvalue              NUMBER (7,2) NOT NULL ,
  deliveryStatus      VARCHAR (1) NOT NULL CHECK (deliveryStatus LIKE 'Y' OR deliveryStatus LIKE 'N') ,
  
CONSTRAINT Parcel_PK PRIMARY KEY (pNo)

INSERT INTO pCustomer VALUES (1, 'J.Gavin', 'Jones Road', 'Dublin', 1, '(01) 819 2300', 'jg@dub.com');
INSERT INTO pCustomer VALUES (2, 'B.Cody', 'OLoughin Road', 'Kilkenny', 3, '(056) 776 5122', 'bc@kill.com'); 
INSERT INTO pCustomer VALUES (3, 'K.Kingston', 'Marina', 'Cork', 2, '021 - 429 1604', 'kk@cork.com'); 

