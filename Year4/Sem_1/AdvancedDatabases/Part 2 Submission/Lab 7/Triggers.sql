DROP TRIGGER p_stage_tigger;
DROP TRIGGER tour_stage_trigger;
DROP TRIGGER t_stage_tigger;
DROP TRIGGER date_stage_tigger;

CREATE TRIGGER p_stage_trigger
BEFORE INSERT ON PlayerStage
FOR EACH ROW
BEGIN
  SELECT p_stage_seq.nextval into :new.p_sk from dual;
END;

CREATE TRIGGER tor_stage_trigger
BEFORE INSERT ON TournamentStage
FOR EACH ROW
BEGIN
  SELECT tour_stage_seq.nextval into :new.t_sk from dual;
END;

CREATE TRIGGER t_stage_trigger
BEFORE INSERT ON TeamStage
FOR EACH ROW
BEGIN
  SELECT t_stage_seq.nextval into :new.t_sk from dual;
END;

CREATE TRIGGER d_stage_trigger
BEFORE INSERT ON DateStage
FOR EACH ROW
BEGIN
  SELECT d_stage_seq.nextval into :new.d_sk from dual;
END;