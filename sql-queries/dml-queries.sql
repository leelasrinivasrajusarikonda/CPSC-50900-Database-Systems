--Insert a new category
INSERT INTO
    categories (category_id, name, description)
VALUES
    (
        101,
        'Electronics',
        'Electronic gadgets and devices.'
    );

-- Insert a new product
INSERT INTO
    products (
        product_id,
        name,
        description,
        price,
        selling_price,
        quantity,
        reorder_level,
        category_id
    )
VALUES
    (
        201,
        'Smartphone',
        'Latest model smartphone with high specs.',
        500.00,
        550.00,
        50,
        10,
        101
    );

--Update a product's price and selling price
UPDATE products
SET
    price = 510.00,
    selling_price = 560.00
WHERE
    product_id = 201;

-- Update a customer's address
UPDATE customers
SET
    address = '123 New Address St',
    city = 'New City',
    postal_code = '12345'
WHERE
    customer_id = 1;

--Delete a product
DELETE FROM products
WHERE
    product_id = 201;

--Select product name and price for products under a specific price
SELECT
    name,
    price
FROM
    products
WHERE
    price < 60;

--Join products and categories to display product names with their categories
SELECT
    p.name AS ProductName,
    c.name AS CategoryName
FROM
    products p
    JOIN categories c ON p.category_id = c.category_id
WHERE
    p.quantity > 900;

--Join sales and customers to display sales amount and customer names
SELECT
    c.name AS CustomerName,
    s.amount AS SalesAmount
FROM
    sales s
    JOIN customers c ON s.customer_id = c.customer_id
WHERE
    s.amount > 950;

--Calculate the total quantity of products for each category
SELECT
    c.name AS CategoryName,
    SUM(p.quantity) AS TotalQuantity
FROM
    products p
    JOIN categories c ON p.category_id = c.category_id
GROUP BY
    c.name;

--Find the average sales order amount for customers
SELECT
    c.name AS CustomerName,
    AVG(s.amount) AS AvgSalesAmount
FROM
    sales s
    JOIN customers c ON s.customer_id = c.customer_id
GROUP BY
    c.name;

--List products and their sales quantities
SELECT
    p.name,
    SUM(si.quantity) AS TotalSold
FROM
    products p
    JOIN sales_item si ON p.product_id = si.product_id
GROUP BY
    p.name;

--Find the top 3 best-selling products
SELECT
    p.name,
    SUM(si.quantity) AS QuantitySold
FROM
    products p
    JOIN sales_item si ON p.product_id = si.product_id
GROUP BY
    p.name
ORDER BY
    QuantitySold DESC
LIMIT
    3;