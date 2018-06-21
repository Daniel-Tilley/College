create or replace function scoreless (sno TAKES_MODULE.STUDENTNO%type, mcode TAKES_MODULE.MODULE_CODE%type) return boolean
is
cur_no TAKES_MODULE.STUDENTNO%type;
cur_score TAKES_MODULE.SCORE%type;

begin
  select STUDENTNO into cur_no from TAKES_MODULE where MODULE_CODE like mcode;
  SELECT SCORE into cur_score from TAKES_MODULE where MODULE_CODE like mcode;
  
  IF cur_score is NULL THEN
    IF cur_no = sno THEN
      return true;
    ELSE 
      return false;
    END IF;
  ELSE
    return false;
  END IF;
  
exception
  when no_data_found then
    return false;
end scoreless;