-- 

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    product_id varchar(10),
    inventory_id varchar(10),
    sub_inventory_id varchar(10),
    country_code varchar(10),
    quantity int,
    price_per_unit int,
    transaction_date date
);

INSERT INTO sales 
VALUES
('11','7','107','IN',21,57,'2022-01-01'),
('11','7','107','IN',21,57,'2022-01-03'),
('11','9','109','US',21,59,'2022-01-03'),
('13','8','108','IN',23,58,'2022-01-05'),
('14','7','107','UK',24,57,'2022-01-05'),
('13','5','105','UK',23,55,'2022-01-05'),
('14','7','107','IN',24,57,'2022-02-05'),
('13','5','105','IN',23,55,'2022-02-08'),
('12','6','106','UK',22,56,'2022-02-03'),
('12','9','109','FR',22,59,'2022-03-08'),
('14','8','108','UK',24,58,'2022-03-12'),
('12','7','107','AUS',22,57,'2022-04-12'),
('15','6','106','NZ',25,56,'2022-04-13'),
('15','5','105','IN',25,55,'2022-04-13'),
('11','7','107','IN',21,57,'2022-06-01'),
('12','7','107','US',22,57,'2022-06-01'),
('13','8','108','UK',23,58,'2022-06-02'),
('15','8','108','UK',25,58,'2022-06-02'),
('11','9','109','IRL',21,59,'2022-07-20'),
('12','9','109','US',22,59,'2022-08-21'),
('14','6','106','IN',24,56,'2022-08-25');

SELECT
	GROUPING(inventory_id) grouping_inv_id,
	grouping(sub_inventory_id) grouping_sub_inv_id,
	inventory_id,
	sub_inventory_id ,
	SUM (quantity*price_per_unit) total_price
FROM
	sales
GROUP BY
	GROUPING SETS (
		(inventory_id),
		(sub_inventory_id)
	)
ORDER BY
	inventory_id,
	sub_inventory_id;

-- rollups and cube 

SELECT 
	inventory_id,
	sub_inventory_id,
	SUM (quantity*price_per_unit) total_price
FROM
	sales
GROUP BY
	ROLLUP(inventory_id, sub_inventory_id)
ORDER BY
	inventory_id,
	sub_inventory_id;


SELECT 
	inventory_id,
	sub_inventory_id,
	SUM (quantity*price_per_unit) total_price
FROM
	sales
GROUP BY
	CUBE(inventory_id, sub_inventory_id)
ORDER BY
	inventory_id,
	sub_inventory_id;

