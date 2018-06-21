create or replace function check_bar_order (stno barorder.studentno%type) return boolean
is
snumber barorder.studentno%type;
begin
  select studentno into snumber from barorder where studentno like stno and orderdate like TO_DATE(TO_CHAR(SYSDATE),'YYYY-MM-DD');
  return false;
exception
  when no_data_found then
    return true;
end check_bar_order;