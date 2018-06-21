purge recyclebin;

truncate table Takes_Module;

CREATE TABLE Takes_Module (
studentNo varchar2(12) not null,
prog_code char(6) not null,
stage_code integer not null,
module_code char(8) not null,
score number(3) null,

primary key (prog_code,stage_code,module_code,studentno),
foreign key (prog_code, stage_code,module_code) references MODULE_RUN(prog_code, stage_code,module_code),
foreign key (studentno) references STUDENT(studentno),
check (score BETWEEN 0 AND 100)
);

SELECT * FROM MODULE;
SELECT * FROM MODULE_RUN;
SELECT * FROM PROGRAMME;
SELECT * FROM STAGE;
SELECT * FROM STUDENT;
SELECT * FROM TAKES_MODULE;

 SELECT studentno, prog_code, stage_code, module_code 
    FROM STUDENT
    JOIN STAGE USING (prog_code, stage_code)
    JOIN MODULE_RUN USING (stage_code, prog_code)
    JOIN MODULE USING (module_code)
    WHERE (module_status LIKE 'C') ORDER BY studentno;
