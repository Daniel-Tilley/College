--Question a
SELECT stock_code,stock_description 
FROM stock 
WHERE unit_price < unitcostprice;

--Question b
SELECT stock_code,stock_description 
FROM stock 
WHERE stock_level < unitcostprice;

--Question c
SELECT customer_name 
FROM customer 
WHERE customer_id NOT IN (SELECT customer_id FROM corder);

--Question d
SELECT stock_description 
FROM Stock
JOIN corderline USING (stock_code)
JOIN corder USING (corderno)
JOIN customer USING (customer_id)
WHERE customer_name LIKE '%Handy Andy%';

--Question e
SELECT supplier_name
FROM supplier
WHERE supplier_id NOT IN
(SELECT supplier_id FROM sorder);

--Question f
SELECT customer_id
FROM corder
JOIN corderline USING (corderno)
WHERE stock_code LIKE '%A101%' OR stock_code LIKE '%A111%';

--Question g
SELECT staff_name, customer_name
FROM staff 
LEFT JOIN corder ON (staffpaid = staff_no)
LEFT JOIN customer USING (customer_id)
WHERE customer_name LIKE '%Mary Martin%';

--Question h
SELECT DISTINCT staff_name, supplier_name --DISTINCT doesn't show duplicates 
FROM staff
LEFT JOIN corder ON (staffissued = staff_no)
LEFT JOIN corderline USING (corderno)
LEFT JOIN stock USING (stock_code)
LEFT JOIN supplier USING (supplier_id)
WHERE supplier_name LIKE '%Buckleys%';

--Question i
SELECT customer_id
FROM corder
JOIN corderline USING (corderno)
WHERE stock_code LIKE '%A101%' 
INTERSECT 
SELECT customer_id
FROM corder
JOIN corderline USING (corderno)
WHERE stock_code LIKE '%A111%';

--Question j
SELECT supplier_id, sorderno
FROM sorder
WHERE (delivereddate - sorderdate > 5)
OR delivereddate IS NULL;




