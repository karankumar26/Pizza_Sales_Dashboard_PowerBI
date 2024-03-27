SELECT * 
FROM pizza_sales

--- KPI

-- Total revenue
SELECT SUM(total_price) as Total_Revenue
FROM pizza_sales

-- Average order value
SELECT SUM(total_price) / COUNT(DISTINCT(order_id)) as Avg_Order_Value
FROM pizza_sales

-- Total Pizza sold
SELECT SUM(quantity) as Total_Pizza_Sold
FROM pizza_sales

-- Total Orders
SELECT COUNT(DISTINCT(order_id)) as Total_Orders
FROM pizza_sales

-- Average pizzas per order
SELECT CAST(CAST(SUM(quantity) as DECIMAL(10,2)) / CAST(COUNT(DISTINCT(order_id)) as DECIMAL(10,2)) as DECIMAL(10,2)) as Avg_Pizzas_per_order
FROM pizza_sales

-- Daily trend for total orders
SELECT DATENAME(DW, order_date) as order_day , COUNT(DISTINCT order_id) as Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

-- Monthly trend for total orders
SELECT DATENAME(MONTH, order_date) as Order_Month , COUNT(DISTINCT order_id) as Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)

-- % of sales by Pizza category
SELECT pizza_category , CAST(SUM(total_price) as DECIMAL(10,2)) as Total_Revenue, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) as DECIMAL(10,2)) as PCT
FROM pizza_sales
GROUP BY pizza_category 

-- % of sales by Pizza size
SELECT pizza_size , CAST(SUM(total_price) as DECIMAL(10,2)) as Total_Revenue, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) as DECIMAL(10,2)) as PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

-- Total pizzas sold by category
SELECT pizza_category, SUM(quantity) as Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_category 
ORDER BY Total_Pizza_Sold DESC

-- Top 5 Pizzas per Revenue
SELECT TOP 5 pizza_name, SUM(total_price) as Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--Bottom 5 pizza per Revenue
SELECT TOP 5 pizza_name, SUM(total_price) as Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

-- Top 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) as Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

-- Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) as Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

--Top 5 Pizzas by total orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT(order_id)) as Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 Pizzas by total orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT(order_id)) as Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC