-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-02-09 06:38:21.527

-- tables
-- Table: categories
CREATE TABLE categories (
    category_id int  NOT NULL,
    name varchar(100)  NOT NULL,
    description text  NOT NULL,
    CONSTRAINT categories_pk PRIMARY KEY (category_id)
);

-- Table: customers
CREATE TABLE customers (
    customer_id int  NOT NULL,
    name varchar(100)  NOT NULL,
    phone_number varchar(20)  NOT NULL,
    email varchar(50)  NOT NULL,
    address varchar(100)  NOT NULL,
    city varchar(50)  NOT NULL,
    postal_code varchar(10)  NOT NULL,
    country varchar(50)  NOT NULL,
    CONSTRAINT customers_pk PRIMARY KEY (customer_id)
);

-- Table: employees
CREATE TABLE employees (
    employee_id int  NOT NULL,
    name varchar(100)  NOT NULL,
    phone varchar(20)  NOT NULL,
    email varchar(50)  NOT NULL,
    address varchar(100)  NOT NULL,
    CONSTRAINT employees_pk PRIMARY KEY (employee_id)
);

-- Table: products
CREATE TABLE products (
    product_id int  NOT NULL,
    name varchar(100)  NOT NULL,
    description text  NOT NULL,
    price decimal(8,2)  NOT NULL,
    selling_price decimal(8,2)  NOT NULL,
    quantity int  NOT NULL,
    reorder_level int  NOT NULL,
    category_id int  NOT NULL,
    CONSTRAINT products_pk PRIMARY KEY (product_id)
);

-- Table: sales
CREATE TABLE sales (
    sale_id int  NOT NULL,
    employee_id int  NOT NULL,
    customer_id int  NOT NULL,
    amount decimal(8,2)  NOT NULL,
    date datetime  NOT NULL,
    CONSTRAINT sales_pk PRIMARY KEY (sale_id)
);

-- Table: sales_item
CREATE TABLE sales_item (
    product_id int  NOT NULL,
    sale_id int  NOT NULL,
    amount decimal(8,2)  NOT NULL,
    quantity int  NOT NULL,
    CONSTRAINT sales_item_pk PRIMARY KEY (product_id,sale_id)
);

-- Table: suppliers
CREATE TABLE suppliers (
    supplier_id int  NOT NULL,
    name varchar(50)  NOT NULL,
    phone_number varchar(20)  NOT NULL,
    email varchar(50)  NOT NULL,
    address varchar(100)  NOT NULL,
    account_number varchar(50)  NOT NULL,
    CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);

-- Table: supply_orders
CREATE TABLE supply_orders (
    order_id int  NOT NULL,
    quantity int  NOT NULL,
    total_cost decimal(8,2)  NOT NULL,
    date datetime  NOT NULL,
    product_id int  NOT NULL,
    supplier_id int  NOT NULL,
    CONSTRAINT supply_orders_pk PRIMARY KEY (order_id)
);

-- foreign keys
-- Reference: products_categories (table: products)
ALTER TABLE products ADD CONSTRAINT products_categories FOREIGN KEY products_categories (category_id)
    REFERENCES categories (category_id);

-- Reference: sales_customers (table: sales)
ALTER TABLE sales ADD CONSTRAINT sales_customers FOREIGN KEY sales_customers (customer_id)
    REFERENCES customers (customer_id);

-- Reference: sales_employees (table: sales)
ALTER TABLE sales ADD CONSTRAINT sales_employees FOREIGN KEY sales_employees (employee_id)
    REFERENCES employees (employee_id);

-- Reference: sales_item_products (table: sales_item)
ALTER TABLE sales_item ADD CONSTRAINT sales_item_products FOREIGN KEY sales_item_products (product_id)
    REFERENCES products (product_id);

-- Reference: sales_item_sales (table: sales_item)
ALTER TABLE sales_item ADD CONSTRAINT sales_item_sales FOREIGN KEY sales_item_sales (sale_id)
    REFERENCES sales (sale_id);

-- Reference: supply_order_products (table: supply_orders)
ALTER TABLE supply_orders ADD CONSTRAINT supply_order_products FOREIGN KEY supply_order_products (product_id)
    REFERENCES products (product_id);

-- Reference: supply_order_suppliers (table: supply_orders)
ALTER TABLE supply_orders ADD CONSTRAINT supply_order_suppliers FOREIGN KEY supply_order_suppliers (supplier_id)
    REFERENCES suppliers (supplier_id);

-- End of file.

