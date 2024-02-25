-- Customer Purchase Summary View
CREATE VIEW
    CustomerPurchaseSummary AS
SELECT
    c.customer_id,
    c.name AS customer_name,
    COUNT(s.sale_id) AS total_purchases,
    SUM(si.amount) AS total_spent
FROM
    customers c
    JOIN sales s ON c.customer_id = s.customer_id
    JOIN sales_item si ON s.sale_id = si.sale_id
GROUP BY
    c.customer_id,
    c.name;

--Product Supply Overview
CREATE VIEW
    ProductSupplyOverview AS
SELECT
    p.product_id,
    p.name AS product_name,
    s.name AS supplier_name,
    so.date,
    so.quantity
FROM
    products p
    JOIN supply_orders so ON p.product_id = so.product_id
    JOIN suppliers s ON so.supplier_id = s.supplier_id;