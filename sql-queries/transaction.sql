START TRANSACTION;

-- Update stock quantity for a product
UPDATE products
SET
    quantity = quantity + 20
WHERE
    product_id = 3;

-- Insert a new supply order record
INSERT INTO
    supply_orders (product_id, supplier_id, date, quantity)
VALUES
    (3, 5, '2024-02-25', 20);

-- Commit the transaction to make changes permanent
COMMIT;