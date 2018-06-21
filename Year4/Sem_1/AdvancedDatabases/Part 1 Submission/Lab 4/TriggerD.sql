CREATE OR REPLACE TRIGGER MATCHES_COUNT_TRIGGER
BEFORE INSERT ON MATCHES 
FOR EACH ROW 

DECLARE
  TeamAHomeMatches Integer;
  TeamAAwayMatches Integer;
  TeamBHomeMatches Integer;
  TeamBAwayMatches Integer;
  
BEGIN  
	SELECT COUNT(*) INTO TeamAHomeMatches 
  FROM MATCHES WHERE TeamA_Name = :NEW.TeamA_Name;
  
  SELECT COUNT(*) INTO TeamAAwayMatches 
  FROM MATCHES WHERE TeamB_Name = :NEW.TeamA_Name;
  
  SELECT COUNT(*) INTO TeamBHomeMatches 
  FROM MATCHES WHERE TeamA_Name = :NEW.TeamA_Name;
  
  SELECT COUNT(*) INTO TeamBAwayMatches 
  FROM MATCHES WHERE TeamB_Name = :NEW.TeamA_Name;
  
  IF (TeamAHomeMatches + TeamAAwayMatches) >= 4 THEN
    raise_application_error(-20000, 'Too Many matches for team ' || :NEW.TeamA_Name);
    
  ELSIF (TeamBHomeMatches + TeamBAwayMatches) >= 4 THEN
    raise_application_error(-20000, 'Too Many matches for team ' || :NEW.TeamB_Name);
  END IF;
END MATCHES_COUNT_TRIGGER;