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
  email               VARCHAR2(20) NOT NULL CHECK (deliverStatus LIKE '%@%') ,
  
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
  deliveryStatus      VARCHAR (1) NOT NULL CHECK (deliverStatus LIKE 'Y' OR deliverStatus LIKE 'N') ,
  
CONSTRAINT Parcel_PK PRIMARY KEY (pNo)
);