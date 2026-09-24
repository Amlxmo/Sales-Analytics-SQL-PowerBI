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

##EXTENTED ANALYSIS

SELECT
    category,
    SUM(amount) AS revenue,
    SUM(profit) AS total_profit,
    ROUND(
        100.0 * SUM(profit) /
        NULLIF(SUM(amount), 0),
        2
    ) AS profit_margin_pct
FROM Data_sales
GROUP BY category
ORDER BY profit_margin_pct DESC;

SELECT
    sub_Category,
    SUM(amount) AS revenue,
    SUM(profit) AS total_profit,
    ROUND(
        100.0 * SUM(profit) /
        NULLIF(SUM(amount), 0),
        2
    ) AS profit_margin_pct
FROM Data_sales
GROUP BY sub_Category
ORDER BY profit_margin_pct DESC;

SELECT 
      sub_Category,
	  SUM(amount) AS Total_turnover,
	  SUM(profit) AS total_profit
FROM Data_sales
Group by sub_Category
ORDER BY Total_turnover DESC;

SELECT 
      sub_Category,
	  SUM(amount) AS Total_turnover,
	  SUM(profit) AS total_profit,
	  ROUND(
        100.0 * SUM(profit) /
        NULLIF(SUM(amount), 0),
        2
    ) AS profit_margin_pct
FROM Data_sales
Group by sub_Category
ORDER BY Total_turnover ASC;

SELECT 
      sub_Category,
	  SUM(amount) AS Total_turnover,
	  SUM(profit) AS total_profit,
	  ROUND(
        100.0 * SUM(profit) /
        NULLIF(SUM(amount), 0),
        2
    ) AS profit_margin_pct
FROM Data_sales
Group by sub_Category
ORDER BY profit_margin_pct ASC;


#month for month total turnover DESC
SELECT
      year_month,
	  SUM(amount) AS Total_turnover,
	  SUM(profit) AS total_profit
FROM Data_sales
GROUP BY year_month
ORDER BY Total_turnover DESC;


#month for month total turnover ASC
SELECT
      year_month,
	  SUM(amount) AS Total_turnover,
	  SUM(profit) AS total_profit
FROM Data_sales
GROUP BY year_month
ORDER BY Total_turnover ASC;


SELECT
      year_month,
	  SUM(amount) AS Total_turnover,
	  SUM(profit) AS total_profit,
	  ROUND(
        100.0 * SUM(profit) /
        NULLIF(SUM(amount), 0),
        2
    ) AS profit_margin_pct	  
FROM Data_sales
GROUP BY year_month
ORDER BY year_month ASC;


SELECT
      year_month,
	  category,
	  SUM(amount) AS Total_turnover,
	  SUM(profit) AS total_profit,
	  ROUND(
        100.0 * SUM(profit) /
        NULLIF(SUM(amount), 0),
        2
    ) AS profit_margin_pct	  
FROM Data_sales
WHERE year_month IN('2022-08','2022-12')
GROUP BY year_month, category
ORDER BY category ASC;

SELECT
      year_month,
	  sub_Category,
	  SUM(amount) AS Total_turnover,
	  SUM(profit) AS total_profit,
	  ROUND(
        100.0 * SUM(profit) /
        NULLIF(SUM(amount), 0),
        2
    ) AS profit_margin_pct	  
FROM Data_sales
WHERE year_month IN('2022-08','2022-12')
GROUP BY year_month, sub_Category
ORDER BY sub_Category ASC;




