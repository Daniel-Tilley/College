SPOOL C:\Users\Daniel\Desktop\embeddedLayoutOutput.txt
SET serveroutput ON

DECLARE
   -- DECLARE CURRENT DETAILS CURSOR
  CURSOR DETAILS
  IS
    SELECT * 
    FROM crash
    JOIN DEATHS USING (flightnumber)
    JOIN FLIGHT USING (flightnumber)
    JOIN PLANE USING (flightnumber);
  
  CUR_DETAILS DETAILS%ROWTYPE;
    
BEGIN
   --OPEN CURSOR
  OPEN DETAILS;
  
  --MONGO DB FUNCTION START
  DBMS_OUTPUT.PUT_LINE('db.embeddedFormat.insert([');
  
  --START LOOP
  LOOP
    --TAKE DETAILS INTO INITIALISED CURSOR
    FETCH DETAILS INTO CUR_DETAILS;
    
    --BREAK FROM LOOP IF NO MORE DATA IS FOUND
    EXIT WHEN DETAILS%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE(
    '{'||
    '"Number": NumberInt('||CUR_DETAILS.flightnumber||'), '||  
    '"Route": "'||CUR_DETAILS.route||'", '||
    '"Operator": "'||CUR_DETAILS.operator||'", '||
    '"NumAboard": NumberInt('||CUR_DETAILS.aboard||'), '||
    '"Plane": [{'||
      '"Type": "'||CUR_DETAILS.type||'", '||
      '"Reg": "'||CUR_DETAILS.registration||'", '||
      '"CNIN": "'||CUR_DETAILS.cnin||'", '||
    '}], '||
    '"Crash": [{'||
      '"Date": "'||CUR_DETAILS.crashdate||'", '||
      '"Time": "'||CUR_DETAILS.crashtime||'", '||
      '"Location": "'||CUR_DETAILS.crashlocation||'", '||
      '"Deaths": [{'||
        '"InAir": NumberInt('||CUR_DETAILS.fatalities||'), '||
        '"OnGround": NumberInt('||CUR_DETAILS.ground||') '||
      '}] '||
    '}] '||
    '},'
    );
  END LOOP;
  
  --MONGODB FUNCTION END
  DBMS_OUTPUT.PUT_LINE('])');
  --CLOSE CURSOR AND COMMIT DATA
  CLOSE DETAILS;
end;
/

SPOOL OFF;