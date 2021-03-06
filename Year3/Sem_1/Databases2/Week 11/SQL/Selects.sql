SELECT * FROM STUDENT;
SELECT * FROM ROOM;
SELECT * FROM OCCUPANCY;
SELECT * FROM INSPECTION;
SELECT * FROM DAMAGE;
SELECT * FROM BARORDER;
SELECT * FROM ORDERITEM;
SELECT * FROM MENUITEM;

--SELECTION AND PROJECTION / INNER JOIN / AGGREGATION / GET THE TOTAL COST OF AN ORDER
SELECT StudentNo, OrderDate, SUM(ITEMCOST*QUANTITY) as OrderTotal
FROM BARORDER  
  JOIN ORDERITEM USING (studentno, orderdate)
  JOIN MENUITEM USING (ItemName)
WHERE StudentNo LIKE 'C10000000'
GROUP  BY StudentNo, OrderDate;

--SELECT TO SHOW ORDERS
SELECT ItemName, Quantity, ItemCost, (ItemCost*Quantity) as LineTotal 
FROM BARORDER
 JOIN ORDERITEM USING (Studentno, Orderdate)
 JOIN MenuItem USING (ItemName)
WHERE StudentNo LIKE 'C10000000' AND OrderDate LIKE TO_DATE(TO_CHAR(SYSDATE),'YYYY-MM-DD');
    
--OUTER JOIN / SHOW ROOM AND HISTORY OF OCCUPANTS
SELECT * FROM ROOM
FULL OUTER JOIN OCCUPANCY
USING (RoomNo);

--BAR TRYING TO FIGURE OUT WHAT TO SELL

--SUB QUERY / FIND OUT WHO BUYS WHAT AND HOW MUCH THEY BUY
SELECT * FROM 
(
  SELECT OrderDate, ItemName, Quantity
  FROM MENUITEM
  JOIN ORDERITEM USING (ItemName)
  WHERE ItemName LIKE 'Side Salad'
);
-- DIFFERENCE / STUDENTS WHO HAVE BOUGHT X BUT NEVER BOUGHT Y NEVER BOUGHT 
SELECT StudentNo
FROM BARORDER
JOIN ORDERITEM USING (studentno, orderdate)
JOIN MENUITEM USING (ItemName)
WHERE ITEMNAME LIKE 'Side Salad'

MINUS

SELECT StudentNo
FROM BARORDER
JOIN ORDERITEM USING (studentno, orderdate)
JOIN MENUITEM USING (ItemName)
WHERE ITEMNAME LIKE 'White wine 750ml';

--UNION / STUDENTS WHO HAVE BOUGHT X OR Y
SELECT StudentNo
FROM BARORDER
JOIN ORDERITEM USING (studentno, orderdate)
JOIN MENUITEM USING (ItemName)
WHERE ITEMNAME LIKE 'Side Salad'

UNION

SELECT StudentNo
FROM BARORDER
JOIN ORDERITEM USING (studentno, orderdate)
JOIN MENUITEM USING (ItemName)
WHERE ITEMNAME LIKE 'White wine 750ml';

--INTERSECT / STUDENTS WHO HAVE BOUGHT X AND Y
SELECT StudentNo
FROM BARORDER
JOIN ORDERITEM USING (studentno, orderdate)
JOIN MENUITEM USING (ItemName)
WHERE ITEMNAME LIKE 'Side Salad'

INTERSECT

SELECT StudentNo
FROM BARORDER
JOIN ORDERITEM USING (studentno, orderdate)
JOIN MENUITEM USING (ItemName)
WHERE ITEMNAME LIKE 'White wine 750ml';