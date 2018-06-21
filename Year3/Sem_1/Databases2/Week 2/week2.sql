Alter session set current_schema = builder2;
Alter session set current_schema = dtilley;

--Get the customer_name of customers who have bought all stock items. (WARNING: This query
--needs data that must be set up – if you are not getting a result, email patricia.obyrne@dit.ie)

SELECT customer_name FROM customer
WHERE NOT EXISTS(
  SELECT * FROM stock
  WHERE NOT EXISTS(
    SELECT * FROM corder
    JOIN corderline USING (corderno)
    WHERE corder.customer_id = customer.customer_id
    AND corderline.stock_code = stock.stock_code));
    
--Get the names of customers who have bought the highest number of different stock items.

SELECT customer_name FROM customer
WHERE NOT EXISTS(
  SELECT * FROM stock
  WHERE NOT EXISTS(
    SELECT * FROM corder
    JOIN corderline USING (corderno)
    WHERE corder.customer_id = customer.customer_id
    AND corderline.stock_code = stock.stock_code
    ));
    
    DROP VIEW distinct_cust;
    DROP VIEW distinct_stock;
    
    CREATE VIEW distinct_cust AS SELECT DISTINCT * FROM customer;
    CREATE VIEW distinct_stock AS SELECT DISTINCT * FROM stock;
    
    SELECT * FROM distinct_cust;
    SELECT * FROM distinct_stock;

