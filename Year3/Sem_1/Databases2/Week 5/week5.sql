set serveroutput on;
--create sequence
create sequence clientIDseq start with 10000;
  
DECLARE
  --declare variables
  v_acc_no LT_ACCOUNT.ACCNO%type:='&Enter_Account_Number';
  v_client_name LT_CLIENT.CFNAME%type;
  
BEGIN
  --Question 1
  SELECT cfname INTO V_client_name
  FROM LT_CLIENT
  JOIN LT_ACCOUNT 
  USING (clientid)
  WHERE accno = v_acc_no;
  
  --Ouput to screen
  DBMS_OUTPUT.PUT_LINE('Name: ' || v_client_name);
END;