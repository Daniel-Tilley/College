set serveroutput on

declare
 v_stno BARORDER.studentno%type:='&Enter_Student_Number'; --STUDENT NUMBER
 v_rmno BARORDER.delivertoroom%type:=&Enter_Room_Number; --ROOM NUMBER 
 v_itemname ORDERITEM.itemname%type:='&Enter_Item_Name'; --ITEM NAME
 v_quantity ORDERITEM.quantity%type:=&Enter_Item_Quantity; --ITEM QUANTITY
 v_total number(6,2); --USED FOR CALCULATING TOTAL OF ORDER
 
 --CURSOR TO DISPLAY ORDER
  CURSOR DETAILS
  IS
    SELECT ItemName, Quantity, ItemCost 
    FROM BARORDER
    JOIN ORDERITEM USING (Studentno, Orderdate)
    JOIN MenuItem USING (ItemName)
    WHERE StudentNo LIKE v_stno AND OrderDate LIKE TO_DATE(TO_CHAR(SYSDATE),'YYYY-MM-DD');
  
  CUR_DETAILS DETAILS%ROWTYPE;
 
begin
  --CHECK STUDENT NUMBER ENTERED
  IF Check_Student(v_stno) THEN
    --CHECK ROOM NUMBER ENTERED
    IF Check_Room(v_rmno) THEN
      --CHECK MENU ITEM NAME ENTERED
      IF Check_Menu_Item(v_itemname) THEN 
        --CHECK QUANTITY > 0
        IF v_quantity > 0 THEN 
          
          --CALL PROCEDURE TO ADD THE ITEM
          add_item(v_stno, v_rmno, v_itemname, v_quantity);
          
          --PRINT ORDER TOTAL TO SCREEN
          SELECT SUM(ITEMCOST*QUANTITY) into v_total
          FROM BARORDER
          JOIN ORDERITEM USING (studentno, orderdate)
          JOIN MENUITEM USING (ItemName)
          WHERE StudentNo LIKE v_stno AND OrderDate LIKE TO_DATE(TO_CHAR(SYSDATE),'YYYY-MM-DD');
          
          --GET CURSOR DETAILS
          --OPEN CURSOR
          OPEN DETAILS;
          
          --DISPLAY ORDER HEADER
          dbms_output.put_line('Your Order:');
          dbms_output.put_line('----------------------------------------------');
          
          --START LOOP
          LOOP
            --TAKE DETAILS INTO INITIALISED CURSOR
            FETCH DETAILS INTO CUR_DETAILS;
            
            --BREAK FROM LOOP IF NO MORE DATA IS FOUND
            EXIT WHEN DETAILS%NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE(
            'Item: '||CUR_DETAILS.ItemName||' ,  Quantity: '||CUR_DETAILS.Quantity||' , Cost: '||CUR_DETAILS.ItemCost*CUR_DETAILS.Quantity||'');
          END LOOP;
          
          --CLOSE CURSOR
          CLOSE DETAILS;
          
          --DISPLAY TOTAL
          dbms_output.put_line('----------------------------------------------');
          dbms_output.put_line('Order total is: '||v_total||' euro.');
        ELSE
          dbms_output.put_line('Please enter a quantity greater than 0');
        END IF;
      ELSE
        dbms_output.put_line('Item does not exist');
      END IF;
    ELSE
      dbms_output.put_line('Room does not exist');
    END IF;
  ELSE
    dbms_output.put_line('Student does not exist');
  END IF;
  
exception
 when others then
  dbms_output.put_line('Error occurred '||SQLCODE||'  meaning '||SQLERRM);
end;