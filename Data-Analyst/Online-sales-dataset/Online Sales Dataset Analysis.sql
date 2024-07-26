-- Query 1: Monthly sales trends
SELECT strftime('%Y-%m', Date) AS Month, SUM(Total_Revenue) AS Total_Sales
FROM sales
GROUP BY Month
ORDER BY Month
-- Query 2: Revenue by category in different regions
SELECT Product_category, region, SUM(total_revenue) AS All_Revenue
FROM sales
GROUP BY Product_category, region
ORDER BY Product_category, All_Revenue DESC;
-- Query 3: Sales volume and revenue by payment method
SELECT Payment_Method, COUNT(*) AS Sales_Volume, SUM(total_revenue) AS All_Revenue
FROM sales
GROUP BY Payment_Method
ORDER BY All_Revenue DESC;

-- Query 4: Top Selling Product
SELECT product_category, Product_Name, SUM(total_revenue) AS All_Revenue
FROM sales
GROUP BY product_category, Product_Name
ORDER BY product_category, All_Revenue DESC;
 
-- Query 5: Regional performance of top products/categories
SELECT Region, product_category, SUM(Total_revenue) AS All_Revenue
FROM sales
GROUP BY Region, product_category
ORDER BY Region, All_Revenue DESC;
