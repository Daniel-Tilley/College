create or replace procedure add_item (
stno in student.studentno%type,
rmno in room.roomno%type,
iname in menuitem.itemname%type,
qty in orderitem.quantity%type
) 
is

limit_reached exception ; --EXCEPTION FOR REACHING LIMIT
v_account_outstanding STUDENT.accountoutstanding%type; --FOR UPDATING ACCOUNT OWED
v_item_cost STUDENT.accountoutstanding%type;
v_line_total STUDENT.accountoutstanding%type;

BEGIN
  --CHECK IF STUDENT LIMIT REACHED 
  IF Check_Student_Limit(stno) THEN
    raise limit_reached;
  ELSE
    --CHECK IF BAR ORDER ALREADY EXISTS (RETURNS TRUE IF IT DOES NOT)
    IF Check_Bar_Order(stno) THEN
      --CREATE A NEW BAR ORDER
      INSERT INTO BARORDER VALUES (TO_DATE(TO_CHAR(SYSDATE),'YYYY-MM-DD'),rmno,stno);
    END IF;
    
    --ADD ORDER ITEM
    INSERT INTO ORDERITEM VALUES (qty, stno, TO_DATE(TO_CHAR(SYSDATE),'YYYY-MM-DD'), iname);
    
    --UPDATE ACCOUNT OUTSTANDING
    
    --GET AMOUNT
    SELECT AccountOutstanding into v_account_outstanding 
    FROM STUDENT 
    WHERE StudentNo LIKE stno;
    
    --GET LINE TOTAL
    SELECT ITEMCOST into v_item_cost
    FROM MENUITEM
    WHERE ITEMNAME LIKE iname;
    
    --DO CALCULATION
    v_line_total := (v_item_cost * qty);
    
    --UPDATE ACCOUNT AMOUNT
    UPDATE STUDENT SET AccountOutstanding = (v_line_total + v_account_outstanding)
    WHERE Studentno LIKE stno;
    
    COMMIT;
  END IF;
  
exception
when limit_reached then
  raise_application_error(-20002,'Limit reached. Item not added');
  rollback work;
when others then
  raise_application_error(-20003, SQLERRM);
  rollback work;
end add_item;
