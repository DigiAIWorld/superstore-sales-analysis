use data_lk;

SELECT * FROM superstore LIMIT 5;

-- What are total sales and total profits of each year?
SELECT YEAR(OrderDate) AS year,
		ROUND(SUM(sales), 2) AS total_sales,
        ROUND(SUM(profit), 2) AS total_profit
FROM superstore
group by year
order by year ASC;      

-- What are the total profits and total sales per quarter?
SELECT 
  YEAR(orderdate) AS year, 
  CASE 
    WHEN MONTH(orderdate) IN (1,2,3) THEN 'Q1'
    WHEN MONTH(orderdate) IN (4,5,6) THEN 'Q2'
    WHEN MONTH(orderdate) IN (7,8,9) THEN 'Q3'
    ELSE 'Q4'
  END AS quarter,
  SUM(sales) AS total_sales,
  SUM(profit) AS total_profit
FROM superstore
GROUP BY year, quarter
ORDER BY year, quarter;

-- What region generates the highest sales and profits ?
SELECT region, SUM(sales) AS total_sales, SUM(profit) AS total_profits
FROM superstore
GROUP BY region
ORDER BY total_profits DESC;

-- Let’s observe each regions profit margins for further analysis with the following code:
SELECT region, ROUND((SUM(profit) / SUM(sales)) * 100, 2) as profit_margin
FROM superstore
GROUP BY region
ORDER BY profit_margin DESC;

-- What state and city brings in the highest sales and profits ?
-- States 
SELECT State, ROUND(SUM(Sales), 2) as Total_Sales, ROUND(SUM(Profit), 2) as Total_Profits, ROUND((SUM(profit) / SUM(sales)) * 100, 2) as profit_margin
FROM superstore
GROUP BY State
ORDER BY Total_Profits DESC
LIMIT 10;

-- Let’s observe our bottom 10 States:
SELECT State, ROUND(SUM(Sales), 2) as Total_Sales, ROUND(SUM(Profit), 2) as Total_Profits
FROM superstore
GROUP BY State
ORDER BY Total_Profits ASC
LIMIT 10;

-- Cities
SELECT City, ROUND(SUM(Sales), 2) as Total_Sales, ROUND(SUM(Profit), 2) as Total_Profits, ROUND((SUM(profit) / SUM(sales)) * 100, 2) as profit_margin
FROM superstore
GROUP BY City
ORDER BY Total_Profits DESC
LIMIT 10;

-- The bottom 10 cities are:
SELECT City, ROUND(SUM(Sales), 2) as Total_Sales, ROUND(SUM(Profit), 2) as Total_Profits
FROM superstore
GROUP BY City
ORDER BY Total_Profits ASC
LIMIT 10; 

-- The relationship between discount and sales and the total discount per category
SELECT Discount, ROUND(AVG(Sales), 2) AS Avg_Sales
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- Let’s observe the total discount per product category:
SELECT category, ROUND(SUM(discount), 2) AS total_discount
FROM superstore
GROUP BY category
ORDER BY total_discount DESC;

-- Let’s zoom in the category section to see exactly what type of products are the most discounted.
SELECT category, subcategory, ROUND(SUM(discount), 2) AS total_discount
FROM superstore
GROUP BY category, subcategory
ORDER BY total_discount DESC;

-- Let’s observe the total discount per product category:
SELECT category, ROUND(SUM(discount), 2) AS total_discount
FROM superstore
GROUP BY category
ORDER BY total_discount DESC;

-- let’s zoom in the category section to see exactly what type of products are the most discounted.
SELECT category, subcategory, ROUND(SUM(discount), 2) AS total_discount
FROM superstore
GROUP BY category, subcategory
ORDER BY total_discount DESC;

-- What category generates the highest sales and profits in each region and state ?
SELECT category, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit, ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

-- Let’s observe the highest total sales and total profits per Category in each region:
SELECT region, category, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region, category
ORDER BY total_profit DESC;

-- Now let’s see the highest total sales and total profits per Category in each state:
SELECT state, category, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state, category
ORDER BY total_profit DESC
LIMIT 15;

-- Let’s check the least profitable ones by just changing our ‘ORDER BY’ clause too ascending (ASC) :
SELECT state, category, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state, category
ORDER BY total_profit ASC
LIMIT 15;

-- What subcategory generates the highest sales and profits in each region and state ?
-- Let’s observe the total sales and total profits of each subcategory with their profit margins:
SELECT subcategory, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit, ROUND(SUM(profit)/SUM(sales)*100, 2) AS profit_margin
FROM superstore
GROUP BY subcategory
ORDER BY total_profit DESC;

-- Now let’s see the highest total sales and total profits per subcategory in each region:
SELECT region, subcategory, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region, subcategory
ORDER BY total_profit DESC;

-- Now let’s see the least performing ones:
SELECT region, subcategory, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region, subcategory
ORDER BY total_profit ASC
LIMIT 15;

-- Now let’s see the highest total sales and total profits per subcategory in each state:
SELECT state, subcategory, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state, subcategory
ORDER BY total_profit DESC;

-- Let’s see the lowest sales and profits. Still in order for biggest lost in profits.
SELECT state, subcategory, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state, subcategory
ORDER BY total_profit ASC;

-- What are the names of the products that are the most and least profitable to us?
-- Let’s verify this information:
SELECT productname, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY productname
ORDER BY total_profit DESC;

-- Let’s verify our less proftable ones:
SELECT productname, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY productname
ORDER BY total_profit ASC;

-- What segment makes the most of our profits and sales ?
SELECT segment, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_profit DESC;

-- How many customers do we have (unique customer IDs) in total and how much per region and state?
SELECT COUNT(DISTINCT customerid) AS total_customers
FROM superstore;

-- Regionally, we had the following:
SELECT region, COUNT(DISTINCT customerid) AS total_customers
FROM superstore
GROUP BY region
ORDER BY total_customers DESC;

-- Statewise, here are the numbers:
SELECT state, COUNT(DISTINCT customerid) AS total_customers
FROM superstore
GROUP BY state
ORDER BY total_customers DESC;

-- The areas where we have the least that passed by there are:
SELECT state, COUNT(DISTINCT customerid) AS total_customers
FROM superstore
GROUP BY state
ORDER BY total_customers ASC;

-- Customer rewards program
SELECT customerid, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY customerid
ORDER BY total_sales DESC
LIMIT 15;

-- Average shipping time per class and in total
SELECT ROUND(AVG(shipdate - orderdate),1) AS avg_shipping_time
FROM superstore;

-- The shipping time in each shipping mode is:
SELECT shipmode,ROUND(AVG(shipdate - orderdate),1) AS avg_shipping_time
FROM superstore
GROUP BY shipmode
ORDER BY avg_shipping_time;



