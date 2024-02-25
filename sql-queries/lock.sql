-- Lock the products table for read and write
LOCK TABLES products WRITE;

-- Perform operations on the table
UPDATE products
SET
    quantity = quantity + 5
WHERE
    product_id = 1;

-- Unlock the table when done
UNLOCK TABLES;