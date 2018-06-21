set serveroutput on;

DECLARE
  v_sno STAFF.STAFF_NO%type:='&Enter_Staff_Number';
  v_cname CUSTOMER.CUSTOMER_NAME%type:='&Enter_Customer_Name';
  v_scod STOCK.STOCK_CODE%type:='&Enter_Stock_Code:';
  v_qty CORDERLINE.QUANTITYREQUIRED%type:=&Enter_Quantity_Required;
  v_sname STAFF.STAFF_NAME%type;
  v_id CUSTOMER.CUSTOMER_ID%type;
  
  --can do a counter 
  --v_stepno integer:=0;
  
BEGIN
  SELECT STAFF_NAME INTO V_SNAME FROM STAFF WHERE STAFF_NO = V_SNO;
  --Increment v_stepno after every line
  --v_stepno := v_stepno + 1;
  SELECT CUSTOMER_ID INTO V_ID FROM CUSTOMER WHERE CUSTOMER_NAME LIKE V_CNAME;
  
  --Insert the order details
  INSERT INTO CORDER (CORDERNO, ORDER_DATE, CUSTOMER_ID, STAFFID)
  VALUES (CORDERSEQ.NEXTVAL, SYSDATE, v_cid, v_sno); --CORDSEQ.CURVAL is the current value
  
  --Insert the order details
  INSERT INTO CORDERLINE VALUES (V_QTY, CORDERSEQ.CURVAL, V_SCOD);
  
  --Update stock quantity 
  UPDATE STOCK SET STOCK_LEVEL = STOCK_LEVEL - V_QTY 
  WHERE STOCK_CODE = V_SCOD;
  
  --Commit changes
  COMMIT;
  
  --Print sucess message
  DBMS_OUTPUT.PUT_LINE('The transaction was complete');

--Check for errors 
EXCEPTION
  when others THEN
    --Undo changes 
    rollback;
    --Print error
    --DBMS_OUTPUT.PUT_LINE('Step: ' || V_STEPNO || 'ERROR CODE: ' || SQLCODE || ' ERROR MESSAGE: ' || SQLERRM);
    DBMS_OUTPUT.PUT_LINE('ERROR CODE: ' || SQLCODE || ' ERROR MESSAGE: ' || SQLERRM);
END;

SELECT * FROM CORDER;