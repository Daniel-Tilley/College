drop table Reference;
drop table Application; 
drop table StudentPriorSchool; 
drop table Referee;
drop table PriorSchool;
drop table StudentAddress;
drop table Student;
drop table Address;

CREATE TABLE Student(  
	StudentID integer PRIMARY KEY,  
	StudentName varchar(50)
); 

CREATE TABLE Address(
	Address_Id integer PRIMARY KEY,
	Street varchar(100),
	State varchar(30),
	ZipCode varchar(7)
);

CREATE TABLE StudentAddress(
	StudentID integer,
	Address_Id integer,
	CONSTRAINT pk_student_address primary key(StudentID,Address_Id),
	CONSTRAINT fk_Student_StudentAddress FOREIGN KEY(StudentID) REFERENCES Student(StudentID), 
	CONSTRAINT fk_Address_StudentAddress FOREIGN KEY(Address_Id) REFERENCES Address(Address_Id) 
);

CREATE TABLE PriorSchool(
	PriorSchoolId integer PRIMARY KEY,  
	PriorSchoolAddr varchar(100)
); 

CREATE TABLE Referee(
	Ref_ID integer PRIMARY KEY,
	ReferenceName varchar(100),  
	RefInstitution  varchar(100)
);

CREATE TABLE StudentPriorSchool(
	StudentID integer,
	PriorSchoolId integer,
	GPA number(2),
	CONSTRAINT pk_student_prior_school primary key(StudentID,PriorSchoolId),
	CONSTRAINT fk_Student_StudPriorSchl FOREIGN KEY(StudentID) REFERENCES Student(StudentID), 
	CONSTRAINT fk_PriorSchool_StudPriorSchl FOREIGN KEY(PriorSchoolId) REFERENCES PriorSchool(PriorSchoolId) 
);

CREATE TABLE Application(  
	App_No integer, 
	App_Year integer,  
	StudentID integer,
	CONSTRAINT pk_application primary key(App_No,App_Year),
	CONSTRAINT fk_Student_Application FOREIGN KEY(StudentID) REFERENCES Student(StudentID) 
);

CREATE TABLE Reference(
  App_No integer, 
	App_Year integer,
	Ref_ID integer,
	ReferenceStatement varchar(500),
	CONSTRAINT pk_reference primary key(App_No, App_Year, Ref_ID),
	CONSTRAINT fk_Application_Reference FOREIGN KEY(App_No, App_Year) REFERENCES Application(App_No, App_Year),
	CONSTRAINT fk_Referee_Reference FOREIGN KEY(Ref_ID) REFERENCES Referee(Ref_ID)
);



INSERT INTO Address VALUES(1,'Grafton Street','New York','NY234');
INSERT INTO Address VALUES(2,'White Street','Florida','Flo435');
INSERT INTO Address VALUES(3,'Green Road','California','Cal123');
INSERT INTO Address VALUES(4,'Red Crescent','Carolina','Ca455');
INSERT INTO Address VALUES(5,'Yellow Park','Mexico','Mex1');
INSERT INTO Address VALUES(6,'Dartry Road','Ohio','Oh34');
INSERT INTO Address VALUES(7,'Malahide Road','Ireland','IRE');
INSERT INTO Address VALUES(8,'Black Bay','Kansas','Kan45');
INSERT INTO Address VALUES(9,'River Road','Kansas','Kan45');

INSERT INTO Student VALUES(1, 'Mark');
INSERT INTO Student VALUES(2, 'Sarah');
INSERT INTO Student VALUES(3, 'Paul');
INSERT INTO Student VALUES(4, 'Jack');
INSERT INTO Student VALUES(5, 'Mary');
INSERT INTO Student VALUES(6, 'Susan');

INSERT INTO StudentAddress VALUES (1,1);
INSERT INTO StudentAddress VALUES (1,2);
INSERT INTO StudentAddress VALUES (2,3);
INSERT INTO StudentAddress VALUES (3,4);
INSERT INTO StudentAddress VALUES (3,5);
INSERT INTO StudentAddress VALUES (4,6);
INSERT INTO StudentAddress VALUES (5,7);
INSERT INTO StudentAddress VALUES (5,8);
INSERT INTO StudentAddress VALUES (6,9);

INSERT INTO PriorSchool VALUES (1,'Castleknock');
INSERT INTO PriorSchool VALUES (2,'Loreto College');
INSERT INTO PriorSchool VALUES (3,'St. Patrick');
INSERT INTO PriorSchool VALUES (4,'DBS');
INSERT INTO PriorSchool VALUES (5,'Harvard');

INSERT INTO Referee VALUES (1,'Dr. Jones', 'Trinity College');
INSERT INTO Referee VALUES (2,'Dr. Jones', 'U Limerick');
INSERT INTO Referee VALUES (3,'Dr. Byrne', 'DIT');
INSERT INTO Referee VALUES (4,'Dr. Byrne', 'UCD');
INSERT INTO Referee VALUES (5,'Prof. Cahill', 'UCC');
INSERT INTO Referee VALUES (6,'Prof. Lillis', 'DIT');

INSERT INTO StudentPriorSchool VALUES(1,1,65);
INSERT INTO StudentPriorSchool VALUES(1,2,87);
INSERT INTO StudentPriorSchool VALUES(2,1,90);
INSERT INTO StudentPriorSchool VALUES(2,3,76);
INSERT INTO StudentPriorSchool VALUES(2,4,66);
INSERT INTO StudentPriorSchool VALUES(2,5,45);
INSERT INTO StudentPriorSchool VALUES(3,1,45);
INSERT INTO StudentPriorSchool VALUES(3,3,67);
INSERT INTO StudentPriorSchool VALUES(3,4,23);
INSERT INTO StudentPriorSchool VALUES(3,5,67);
INSERT INTO StudentPriorSchool VALUES(4,3,29);
INSERT INTO StudentPriorSchool VALUES(4,4,88);
INSERT INTO StudentPriorSchool VALUES(4,5,66);
INSERT INTO StudentPriorSchool VALUES(5,1,74);
INSERT INTO StudentPriorSchool VALUES(5,3,44);
INSERT INTO StudentPriorSchool VALUES(5,4,55);
INSERT INTO StudentPriorSchool VALUES(5,5,66);
INSERT INTO StudentPriorSchool VALUES(6,1,88);
INSERT INTO StudentPriorSchool VALUES(6,2,45);
INSERT INTO StudentPriorSchool VALUES(6,3,77);
INSERT INTO StudentPriorSchool VALUES(6,4,56);

INSERT INTO Application VALUES(1,2003,1);
INSERT INTO Application VALUES(1,2004,1);
INSERT INTO Application VALUES(1,2005,5);
INSERT INTO Application VALUES(1,2009,4);
INSERT INTO Application VALUES(1,2012,3);
INSERT INTO Application VALUES(2,2007,1);
INSERT INTO Application VALUES(2,2009,5);
INSERT INTO Application VALUES(2,2010,2);
INSERT INTO Application VALUES(2,2011,2);
INSERT INTO Application VALUES(2,2012,2);
INSERT INTO Application VALUES(3,2008,3);
INSERT INTO Application VALUES(3,2011,6);
INSERT INTO Application VALUES(3,2012,1);

INSERT INTO Reference VALUES(1,2003,1,'Good Guy');
INSERT INTO Reference VALUES(1,2004,1,'Good Guy');
INSERT INTO Reference VALUES(1,2005,3,'Perfect');
INSERT INTO Reference VALUES(1,2009,6,'Fair');
INSERT INTO Reference VALUES(1,2012,1,'Poor');
INSERT INTO Reference VALUES(2,2007,1,'Good Guy');
INSERT INTO Reference VALUES(2,2009,5,'Good Girl');
INSERT INTO Reference VALUES(2,2010,2,'Perfect');
INSERT INTO Reference VALUES(2,2011,2,'Perfect');
INSERT INTO Reference VALUES(2,2012,2,'Average');
INSERT INTO Reference VALUES(3,2008,3,'Excellent');
INSERT INTO Reference VALUES(3,2011,6,'Messy');
INSERT INTO Reference VALUES(3,2012,1,'Very Good Guy');

--select * from Apps_NOT_Normalized;