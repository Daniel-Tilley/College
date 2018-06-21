CREATE OR REPLACE TRIGGER CHECK_TEAM_LEAGUE_TRIGGER
BEFORE INSERT ON MATCHES 
FOR EACH ROW

DECLARE
  NotPremierLeague EXCEPTION;
  NotLaLigaLeague EXCEPTION; 
  TeamCountryA varchar(20);
  TeamCountryB varchar(20);
  
BEGIN  
	SELECT TeamCountry INTO TeamCountryA 
  FROM TEAMS WHERE TeamName = :NEW.TeamA_Name;
  
  SELECT TeamCountry INTO TeamCountryB 
  FROM TEAMS WHERE TeamName = :NEW.TeamB_Name;
  
  IF :NEW.Competition LIKE 'Premier League' THEN
    IF TeamCountryA NOT LIKE 'England' THEN
       raise_application_error(-20000, 'Not English Team: ' || :NEW.TeamA_Name);
       
    ELSIF TeamCountryB NOT LIKE 'England' THEN
      raise_application_error(-20000, 'Not English Team ' || :NEW.TeamB_Name);
    END IF;
  
  ELSIF :NEW.Competition LIKE 'La Liga' THEN
    IF TeamCountryA NOT LIKE 'Spain' THEN
      raise_application_error(-20000, 'Not Spanish Team: ' || :NEW.TeamA_Name);
       
    ELSIF TeamCountryB NOT LIKE 'Spain' THEN
      raise_application_error(-20000, 'Not Spanish Team ' || :NEW.TeamB_Name);
    END IF;
  END IF;
END CHECK_TEAM_LEAGUE_TRIGGER;