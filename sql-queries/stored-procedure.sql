
DELIMITER $$

CREATE PROCEDURE UpdateProductStock(IN product_id INT, IN quantity_added INT)
BEGIN
    UPDATE products
    SET quantity = quantity + quantity_added
    WHERE products.product_id = product_id;
END$$

DELIMITER ;
