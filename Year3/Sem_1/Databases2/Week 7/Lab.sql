SET SERVEROUTPUT ON
DECLARE
  
  -- ENTER VARIABLES
  V_ORDER_NO JOB.orderno%TYPE := &Enter_Order_Number;
  
  -- DECLARE CURSOR
  CURSOR FITTING
  IS 
    SELECT Orderno, WindowStatus FROM Job
    JOIN ROOM USING (Orderno)
    JOIN WINDOW_FITTING USING (Orderno, Room)
    WHERE Orderno = V_ORDER_NO;
    
  --INITIALISE CURSOR
  CUR_FITTING FITTING%ROWTYPE;
  
  -- VARIABLES USED AS CHECKS
  IS_WINDOW_FITTED boolean := true; -- Checks any windows status = f (using loop)
  
BEGIN
  
  --OPEN CURSOR FOR FIRST CHECK
  OPEN FITTING;
  
  -- LOOP TO CHECK SINGLE FITTING
  LOOP
    
    -- PUT DATA INTO CURSOR
    FETCH FITTING INTO CUR_FITTING;
    
    -- BREAK FROM LOOP IF NO MORE DATA IS FOUND
    EXIT WHEN FITTING%NOTFOUND;
    
    -- CHECK FOR FITTED WINDOWS
    IF ((CUR_FITTING.WindowStatus NOT LIKE 'F')) 
    THEN 
      dbms_output.put_line('Line1');
      IS_WINDOW_FITTED := false;
    END IF;
    
  END LOOP;
  
  -- CLOSE CURSOR
  CLOSE FITTING;
  
  -- IF NO WINDOWS HAVE BEEN FITTED 
  IF (NOT(IS_WINDOW_FITTED)) THEN
    dbms_output.put_line('No windows have been fitted for order: ' ||V_ORDER_NO);
  
  -- IF ALL WINDOWS ARE FULLY FITTED
  ELSIF (IS_WINDOW_FITTED) THEN
    UPDATE JOB
    SET datefullypaid = SYSDATE
    where orderno = V_ORDER_NO;
    
    dbms_output.put_line('Job has been updated with order number: ' ||V_ORDER_NO);
    COMMIT;
  END IF;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERROR');
END;