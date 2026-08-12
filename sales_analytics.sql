DROP TABLE data_sales;

CREATE TABLE Data_sales (
order_Id VARCHAR(25),
amount INT,
profit INT,
quantity INT,
category VARCHAR(100),
sub_Category VARCHAR(100),
payment_mode VARCHAR(100),
order_date DATE,
customerName VARCHAR(100),
state VARCHAR(50),
city VARCHAR(50),
year_month VARCHAR(7)
);

SELECT COUNT(*) 
FROM Data_sales;

SELECT *
FROM Data_sales
LIMIT 50; 


SELECT
SUM(amount) AS total_revenue,
SUM(profit) AS total_profit,
SUM(quantity) AS total_units_sold
FROM Data_sales;

SELECT 
category, 
SUM(quantity) AS units_sold 
FROM Data_sales
GROUP BY category
ORDER BY units_sold DESC
Limit (5);


SELECT
sub_Category,
SUM(quantity) AS units_sold 
FROM Data_sales
GROUP BY sub_Category
ORDER BY units_sold DESC
LIMIT 10;

SELECT
sub_Category,
category,
SUM(quantity) AS units_sold 
FROM Data_sales
GROUP BY sub_Category, category
ORDER BY units_sold DESC
LIMIT 10;

SELECT
customerName,
SUM(amount) AS total_spent 
FROM Data_sales
GROUP BY customerName
ORDER BY total_spent DESC
Limit 10;

SELECT 
year_month, 
SUM(quantity) AS units_sold 
FROM Data_sales
GROUP BY year_month
ORDER BY units_sold DESC;

SELECT 
state, 
SUM(quantity) AS units_sold 
FROM Data_sales
GROUP BY state
ORDER BY units_sold DESC;

