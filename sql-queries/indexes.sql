-- 1. Index for customer email
CREATE INDEX idx_customers_email ON customers (email);

-- 2. Index for product category
CREATE INDEX idx_products_category_id ON products (category_id);

-- 3. Index for sales date
CREATE INDEX idx_sales_sale_date ON sales (sale_date);