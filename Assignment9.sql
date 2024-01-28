/* Drop table product sales*/
drop table if exists product_sales;
/* create table product sales*/
CREATE TABLE product_sales (
  product_name VARCHAR(100),
  store_location VARCHAR(50),
  num_sales INT
);
/* insert data into table product sales*/
INSERT INTO product_sales (product_name, store_location, num_sales) VALUES
('Chair', 'North', 55),
('Desk', 'Central', 120),
('Couch', 'Central', 78),
('Chair', 'South', 23),
('Chair', 'South', 10),
('Chair', 'North', 98),
('Desk', 'West', 61),
('Couch', 'North', 180),
('Chair', 'South', 14),
('Desk', 'North', 45),
('Chair', 'North', 87),
('Chair', 'Central', 34),
('Desk', 'South', 42),
('Couch', 'West', 58),
('Couch', 'Central', 27),
('Chair', 'South', 91),
('Chair', 'West', 82),
('Chair', 'North', 37),
('Desk', 'North', 68),
('Couch', 'Central', 54),
('Chair', 'South', 81),
('Desk', 'North', 25),
('Chair', 'North', 46),
('Chair', 'Central', 121),
('Desk', 'South', 85),
('Couch', 'North', 43),
('Desk', 'West', 10),
('Chair', 'North', 5),
('Chair', 'Central', 16),
('Desk', 'South', 9),
('Couch', 'West', 22),
('Couch', 'Central', 59),
('Chair', 'South', 76),
('Chair', 'West', 48),
('Chair', 'North', 19),
('Desk', 'North', 3),
('Couch', 'West', 63),
('Chair', 'South', 81),
('Desk', 'North', 85),
('Chair', 'North', 90),
('Chair', 'Central', 47),
('Desk', 'West', 63),
('Couch', 'North', 28);
/*[3] retrieve data from table product sales*/
SELECT * FROM product_sales;

/*[4] Write a query to retrieve all product names from the product_sales table.*/

SELECT product_name FROM product_sales;

/*[5] Write a query to retrieve all product names and sum from the product_sales table.*/

SELECT product_name, SUM(num_sales) FROM product_sales group by product_name;

/*[6] Write a query to keep track of all sales in location "north" as a separate column*/

SELECT product_name, SUM(CASE WHEN store_location = 'North' THEN num_sales ELSE 0 END) AS north FROM product_sales;

/*[7] Modify the query to include a group by clause on the product_name*/

SELECT product_name, SUM(CASE WHEN store_location = 'North' THEN num_sales ELSE 0 END) AS north FROM product_sales GROUP BY product_name;

/*[8] Modify the query to cover all four locations:*/

SELECT product_name,
SUM(CASE WHEN store_location = 'North' THEN num_sales ELSE 0 END) AS north,
SUM(CASE WHEN store_location = 'Central' THEN num_sales ELSE 0 END) AS central,
SUM(CASE WHEN store_location = 'South' THEN num_sales ELSE 0 END) AS south,
SUM(CASE WHEN store_location = 'West' THEN num_sales ELSE 0 END) AS west
FROM product_sales
GROUP BY product_name;

