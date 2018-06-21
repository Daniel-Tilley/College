create or replace function check_student_limit (stno student.studentno%type) return boolean
is
account_outstanding student.accountoutstanding%type; --AMOUNT OUSTANDING ON ACCOUNT
credit_limit student.creditlimit%type; --CREDIT LIMIT ON ACCOUNT
begin

  --GET CURENT STUDENT LIMIT AND AMOUNT OUTSTANDING
  SELECT AccountOutstanding into account_outstanding
  from STUDENT 
  where studentno = stno;
  
  SELECT CreditLimit into credit_limit
  FROM STUDENT
  where studentno = stno;
  
  --CHECK IF LIMIT REACHED
  if (account_outstanding >= credit_limit) then 
    return true;
  else
    return false;
  end if;
end check_student_limit;