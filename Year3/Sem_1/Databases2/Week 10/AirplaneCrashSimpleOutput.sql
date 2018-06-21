SPOOL C:\Users\Daniel\Desktop\simpleLayoutOutput.txt
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
  DBMS_OUTPUT.PUT_LINE('db.simpleFormat.insert([');
  
  --START LOOP
  LOOP
    --TAKE DETAILS INTO INITIALISED CURSOR
    FETCH DETAILS INTO CUR_DETAILS;
    
    --BREAK FROM LOOP IF NO MORE DATA IS FOUND
    EXIT WHEN DETAILS%NOTFOUND;
    
   DBMS_OUTPUT.PUT_LINE(
    '{'||
    '"FlightNumber": '||CUR_DETAILS.flightnumber||','||  
    '"FlightRoute": "'||CUR_DETAILS.route||'", '||
    '"FlightOperator": "'||CUR_DETAILS.operator||'", '||
    '"NumAboardFlight": '||CUR_DETAILS.aboard||', '||
    '"CrashDate": "'||CUR_DETAILS.crashdate||'", '||
    '"CrashTime": "'||CUR_DETAILS.crashtime||'", '||
    '"CrashLocation": "'||CUR_DETAILS.crashlocation||'", '||
    '"DeathsInAir": '||CUR_DETAILS.fatalities||', '||
    '"DeathsOnGround": '||CUR_DETAILS.ground||', '||
    '"PlaneType": "'||CUR_DETAILS.type||'", '||
    '"PlaneReg": "'||CUR_DETAILS.registration||'", '||
    '"PlaneCNIN": "'||CUR_DETAILS.cnin||'"'||
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