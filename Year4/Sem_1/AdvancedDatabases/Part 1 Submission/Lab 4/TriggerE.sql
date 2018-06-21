CREATE OR REPLACE TRIGGER EURO_TABLE_TRIGGER
AFTER INSERT ON MATCHES 
FOR EACH ROW

DECLARE 
  Diff integer;
  
BEGIN  
  IF :NEW.Goal_A = :NEW.Goal_B THEN
    UPDATE EUROLEAGUE SET Points = Points + 1, Goals_Scored = Goals_Scored + :NEW.Goal_A, Goals_Conceded = Goals_Conceded + :NEW.Goal_B WHERE TeamName LIKE :NEW.TeamA_Name;
    UPDATE EUROLEAGUE SET Points = Points + 1, Goals_Scored = Goals_Scored + :NEW.Goal_B, Goals_Conceded = Goals_Conceded + :NEW.Goal_A WHERE TeamName LIKE :NEW.TeamB_Name;
  
  ELSIF :NEW.Goal_A > :NEW.Goal_B THEN
    Diff := :NEW.Goal_A - :NEW.Goal_B;
    UPDATE EUROLEAGUE SET Points = Points + 3, Goals_Scored = Goals_Scored + :NEW.Goal_A, Goals_Conceded = Goals_Conceded + :NEW.Goal_B, Difference = Difference + Diff WHERE TeamName LIKE :NEW.TeamA_Name;
    UPDATE EUROLEAGUE SET Goals_Scored = Goals_Scored + :NEW.Goal_B, Goals_Conceded = Goals_Conceded + :NEW.Goal_A, Difference = Difference - Diff WHERE TeamName LIKE :NEW.TeamB_Name;
  
  ELSIF :NEW.Goal_A < :NEW.Goal_B THEN
    Diff := :NEW.Goal_B - :NEW.Goal_A;
    UPDATE EUROLEAGUE SET Goals_Scored = Goals_Scored + :NEW.Goal_A, Goals_Conceded = Goals_Conceded + :NEW.Goal_B, Difference = Difference + Diff WHERE TeamName LIKE :NEW.TeamA_Name;
    UPDATE EUROLEAGUE SET Points = Points + 3, Goals_Scored = Goals_Scored + :NEW.Goal_B, Goals_Conceded = Goals_Conceded + :NEW.Goal_A, Difference = Difference + Diff WHERE TeamName LIKE :NEW.TeamB_Name;
  
  END IF;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No data found');
    
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error code: '||SQLCODE||' means '||SQLERRM);
END EURO_TABLE_TRIGGER;