-- 1. Get all customers and their addresses.

SELECT * from "customers" -- one customer
JOIN "addresses" -- many addresses
 on "addresses"."customer_id" = "customers"."id";

-- 2. Get all orders and their line items (orders, quantity and product).

SELECT * FROM "orders" --one order
JOIN "line_items" --many line_items
on "orders"."id" = "line_items"."order_id"
JOIN "products"
on "products"."id" = "line_items"."product_id";

-- 3. Which warehouses have cheetos? 
--(Any good warehouse has cheetos.)

SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" on
"warehouse_product"."warehouse_id" = "warehouse"."id"
JOIN "products" on
"products"."id" = "warehouse_product"."product_id"
WHERE description = 'cheetos';

-- 4. Which warehouses have diet pepsi?

SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" on
"warehouse_product".warehouse_id = "warehouse".id
JOIN "products" on
"products"."id" = "warehouse_product".product_id
WHERE description = 'diet pepsi';

-- 5. Get the number of orders for each customer. 
--    NOTE: It is OK if those without orders are not included in results.

SELECT "customers".first_name, count(*) FROM "customers"
JOIN "addresses" on
"addresses".customer_id = "customers".id
JOIN "orders" on
"orders".address_id = "addresses".id
Group BY "customers".first_name;


--6. How many customers do we have?

SELECT count(*) FROM "customers";

--7. How many products do we carry?
SELECT count(*) FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT count(*) FROM "warehouse"
JOIN "warehouse_product" ON
"warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON
"products".id = "warehouse_product".product_id
WHERE description = 'diet pepsi';