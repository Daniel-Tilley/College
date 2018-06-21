-- Clean up from any previous tutorial actions.
DROP TABLE transactions;
DROP TABLE books;
DROP TABLE patrons;
DROP SEQUENCE patron_id_seq;
DROP SEQUENCE transactions_seq;
DROP TRIGGER transactions_trg;

set serveroutput on
 
-- Create objects.
 
CREATE TABLE books (
   book_id VARCHAR2(20),
   title VARCHAR2(50)
      CONSTRAINT title_not_null NOT NULL,
   author_last_name VARCHAR2(30)
      CONSTRAINT last_name_not_null NOT NULL,
   author_first_name VARCHAR2(30),
   rating NUMBER,
   CONSTRAINT books_pk PRIMARY KEY (book_id),
   CONSTRAINT rating_1_to_10 CHECK (rating IS NULL OR
      (rating >= 1 and rating <= 10)),
   CONSTRAINT author_title_unique UNIQUE (author_last_name, title));
 
CREATE TABLE patrons (
   patron_id NUMBER,
   last_name VARCHAR2(30)
      CONSTRAINT patron_last_not_null NOT NULL,
   first_name VARCHAR2(30),
   street_address VARCHAR2(50),
   city_state_zip VARCHAR2(50),
   location MDSYS.SDO_GEOMETRY,
   CONSTRAINT patrons_pk PRIMARY KEY (patron_id));
 
CREATE TABLE transactions (
   transaction_id NUMBER,
   patron_id CONSTRAINT for_key_patron_id
      REFERENCES patrons(patron_id),
   book_id CONSTRAINT for_key_book_id
      REFERENCES books(book_id),
   transaction_date DATE
      CONSTRAINT tran_date_not_null NOT NULL,
   transaction_type NUMBER
      CONSTRAINT tran_type_not_null NOT NULL,
   CONSTRAINT transactions_pk PRIMARY KEY (transaction_id));
 
CREATE SEQUENCE patron_id_seq 
   START WITH 100
   INCREMENT BY 1;
 
-- The sequence for the transaction_id 
-- in the tutorial is created automatically,
-- and may have the name TRANSACTIONS_SEQ.
CREATE SEQUENCE transactions_seq 
   START WITH 1
   INCREMENT BY 1;
 
-- The before-insert trigger for transaction ID values
-- in the tutorial is created automatically,
-- and may have the name TRANSACTIONS_TRG.
CREATE OR REPLACE TRIGGER transactions_trg
   BEFORE INSERT ON TRANSACTIONS 
  FOR EACH ROW 
  BEGIN
    SELECT TRANSACTIONS_SEQ.NEXTVAL INTO :NEW.TRANSACTION_ID FROM DUAL;
  END;
/
 

 

 
-- Insert and query data.
 
INSERT INTO books VALUES ('A1111', 'Moby Dick', 'Melville', 'Herman', 10);
INSERT INTO books VALUES ('A2222', 'Get Rich Really Fast', 'Scammer', 'Ima', 1);
INSERT INTO books VALUES ('A3333', 'Finding Inner Peace', 'Blissford', 'Serenity', null);
INSERT INTO books VALUES ('A4444', 'Great Mystery Stories', 'Whodunit', 'Rodney', 5);
INSERT INTO books VALUES ('A5555', 'Software Wizardry', 'Abugov', 'D.', 10);
 
INSERT INTO patrons VALUES  (patron_id_seq.nextval, 
   'Smith', 'Jane', '123 Main Street', 'Mytown, MA 01234', null);
INSERT INTO patrons VALUES  (patron_id_seq.nextval, 
   'Chen', 'William', '16 S. Maple Road', 'Mytown, MA 01234', null);
INSERT INTO patrons VALUES  (patron_id_seq.nextval, 
   'Fernandez', 'Maria', '502 Harrison Blvd.', 'Sometown, NH 03078', null);
INSERT INTO patrons VALUES  (patron_id_seq.nextval, 
   'Murphy', 'Sam', '57 Main Street', 'Mytown, MA 01234', null);
 
INSERT INTO transactions (patron_id, book_id, 
  transaction_date, transaction_type) 
  VALUES (100, 'A1111', SYSDATE, 1);
INSERT INTO transactions (patron_id, book_id, 
  transaction_date, transaction_type) 
  VALUES (100, 'A2222', SYSDATE, 2);
INSERT INTO transactions (patron_id, book_id, 
  transaction_date, transaction_type) 
  VALUES (101, 'A3333', SYSDATE, 3);
INSERT INTO transactions (patron_id, book_id, 
  transaction_date, transaction_type) 
  VALUES (101, 'A2222', SYSDATE, 1);
INSERT INTO transactions (patron_id, book_id, 
  transaction_date, transaction_type) 
  VALUES (102, 'A3333', SYSDATE, 1);
INSERT INTO transactions (patron_id, book_id, 
  transaction_date, transaction_type) 
  VALUES (103, 'A4444', SYSDATE, 2);
INSERT INTO transactions (patron_id, book_id, 
  transaction_date, transaction_type) 
  VALUES (100, 'A4444', SYSDATE, 1);
INSERT INTO transactions (patron_id, book_id, 
  transaction_date, transaction_type) 
  VALUES (102, 'A2222', SYSDATE, 2);
INSERT INTO transactions (patron_id, book_id, 
  transaction_date, transaction_type) 
  VALUES (102, 'A5555', SYSDATE, 1);
INSERT INTO transactions (patron_id, book_id, 
  transaction_date, transaction_type) 
  VALUES (101, 'A2222', SYSDATE, 1);
  commit;
  
  select * from books;
  
  describe books;
  
  select first_name, last_name, street_address from PATRONS;
  
  select transaction_id, patron_id, book_id, transaction_date, transaction_type from TRANSACTIONS;
  
  select first_name "FIRSTNAME", last_name "LASTNAME", street_address "STREETADDRESS" from PATRONS;
  

  
  