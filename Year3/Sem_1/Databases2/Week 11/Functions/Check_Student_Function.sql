create or replace function check_student (stno student.studentno%type) return boolean
is
snumber student.studentno%type;
begin
  select studentno into snumber from student where studentno like stno;
  return true;
exception
  when no_data_found then
    return false;
end check_student;