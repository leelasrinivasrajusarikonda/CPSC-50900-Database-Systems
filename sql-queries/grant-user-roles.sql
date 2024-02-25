


--For DBA
GRANT ALL PRIVILEGES ON *.* TO 'dba'@'localhost';

--For Inventory manager
GRANT SELECT, INSERT, UPDATE, DELETE ON retail.products TO 'inventory_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON retail.suppliers TO 'inventory_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON retail.supply_orders TO 'inventory_manager'@'localhost';

--For Sales manager
GRANT SELECT, INSERT, UPDATE, DELETE ON retail.sales TO 'sales_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON retail.sales_item TO 'sales_manager'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON retail.customers TO 'sales_manager'@'localhost';
