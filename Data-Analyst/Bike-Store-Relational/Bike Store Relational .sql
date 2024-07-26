/* Order fulfillment: Write a query to find the average number of days taken to ship orders after the required date.
Customer order patterns: Write a query to identify customers who placed orders in each month for the last six months.
Store stock levels: Write a query to find stores that have stock levels below a certain threshold for any product.
Sales growth: Write a query to calculate the month-over-month sales growth for the past year. */

---Problem 1: Order fulfillment
SELECT 
    strftime('%Y', order_date) as order_year,
    COALESCE(shipped_date, 'Unknown') AS shipped_date,
    COUNT(1) as num_order
FROM orders
WHERE 
    COALESCE(shipped_date, 'Unknown') = 'Unknown'
GROUP BY 1

---update the value into Need Update to let the the company knows and makes decisions in the future.

SELECT 
    order_id,
    order_date,
    COALESCE(shipped_date, 'Need Update') AS shipped_date
FROM orders
WHERE 
    COALESCE(shipped_date, 'Need Update') = 'Need Update'
    
---Problem 2: Customer order patterns
SELECT
    strftime('%Y', o.order_date) as year,
    strftime('%m', o.order_date) as month,
    c.customer_id
FROM customers c
JOIN orders o
    ON o.customer_id = c.customer_id
WHERE 
    strftime('%Y', o.order_date) = '2018' AND
    strftime('%m', o.order_date) >= '06'
ORDER BY 2 ASC, 3 ASC

---Solution Using Dillon Myrick
WITH customer_stats AS (
    SELECT
        customer_id,
        SUM(quantity * list_price * (1 - discount)) AS total_spending,
        COUNT(DISTINCT o.order_id) AS total_orders,
        julianday('2018-12-31') - julianday(MAX(order_date)) AS days_since_last_purchase
    FROM
        orders o
    INNER JOIN
        order_items oi
    ON
        o.order_id = oi.order_id
    GROUP BY
        1
)

SELECT
    customer_id,
    CASE WHEN total_orders > 1 THEN 'repeat buyer'
         ELSE 'one-time buyer'
         END AS purchase_frequency,
    CASE WHEN days_since_last_purchase < 360 THEN 'recent buyer'
         ELSE 'not recent buyer'
         END AS purchase_recency,
    CASE WHEN total_spending/(SELECT MAX(total_spending) FROM customer_stats) >= .65 THEN 'big spender'
         WHEN total_spending/(SELECT MAX(total_spending) FROM customer_stats) <= .30 THEN 'low spender'
         ELSE 'average spender' 
         END AS buying_power
FROM
    customer_stats
    
---Problem 3: Sales growth
SELECT
    strftime('%Y', order_date) as year,
    strftime('%m', order_date) as month,
    SUM(quantity) as unit_sold,
    SUM(quantity * oi.list_price * (1 - oi.discount)) AS total_sales
FROM orders o
    INNER JOIN
    order_items oi
        ON o.order_id = oi.order_id
GROUP BY 1,2

--- Use 2016 and 2017

WITH sales_data AS (
    SELECT
        strftime('%Y', o.order_date) as year,
        strftime('%m', o.order_date) as month,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) as sales_amount,
        LAG(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 1) OVER (ORDER BY strftime('%m', o.order_date)) AS prev_sales_amount
    FROM
        orders o
    JOIN 
        order_items oi ON o.order_id = oi.order_id
    WHERE year = '2016'
    
    GROUP BY
        strftime('%m', o.order_date)
)

SELECT
    month,
    year,
    sales_amount,
    prev_sales_amount,
    CASE
        WHEN prev_sales_amount IS NULL THEN NULL  -- Handle the first month case
        ELSE (1.0 * (sales_amount - prev_sales_amount) / prev_sales_amount) * 100.0
    END AS sales_growth_percent
FROM
    sales_data
GROUP BY month
ORDER BY
    month

----

WITH sales_data AS (
    SELECT
        strftime('%Y', o.order_date) as year,
        strftime('%m', o.order_date) as month,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) as sales_amount,
        LAG(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 1) OVER (ORDER BY strftime('%m', o.order_date)) AS prev_sales_amount
    FROM
        orders o
    JOIN 
        order_items oi ON o.order_id = oi.order_id
    WHERE year = '2017'
    
    GROUP BY
        strftime('%m', o.order_date)
)

SELECT
    month,
    year,
    sales_amount,
    prev_sales_amount,
    CASE
        WHEN prev_sales_amount IS NULL THEN NULL  -- Handle the first month case
        ELSE (1.0 * (sales_amount - prev_sales_amount) / prev_sales_amount) * 100.0
    END AS sales_growth_percent
FROM
    sales_data
GROUP BY month
ORDER BY
    month
    
---Problem 4: Product Performance Analysis

SELECT 
        oi.product_id,
        product_name,
        oi.list_price
    FROM 
        order_items as oi
        JOIN products as p
            ON oi.product_id = p.product_id
    GROUP BY 1
    ORDER BY 3 DESC
    
---

    SELECT 
        oi.product_id,
        product_name,
        p.brand_id,
        SUM(quantity) as unit_sold,
        oi.list_price,
        discount,
        oi.list_price * (1 - discount) AS discounted_price,
        SUM(SUM((oi.list_price * (1 - discount))*quantity)) OVER (PARTITION BY oi.product_id)  AS total_sales_per_product
    FROM 
        order_items as oi
        JOIN products as p
            ON oi.product_id = p.product_id
    GROUP BY 1
    ORDER BY 8 DESC, 5 DESC
    LIMIT 15
    
---TOP Prioritybrands
    WITH most_profitable AS(
    SELECT 
        oi.product_id,
        product_name,
        p.brand_id,
        SUM(quantity) as unit_sold,
        oi.list_price,
        discount,
        oi.list_price * (1 - discount) AS discounted_price,
        SUM(SUM((oi.list_price * (1 - discount))*quantity)) OVER (PARTITION BY oi.product_id)  AS total_sales_per_product
    FROM 
        order_items as oi
        JOIN products as p
            ON oi.product_id = p.product_id
    GROUP BY 1
    ORDER BY 8 DESC, 5 DESC
    LIMIT 15)
    SELECT 
        product_name, 
        b.brand_name
    FROM most_profitable
    JOIN brands b
        ON b.brand_id = most_profitable.brand_id

---

    SELECT 
        oi.product_id,
        product_name,
        SUM(quantity) as unit_sold,
        oi.list_price,
        discount,
        oi.list_price * (1 - discount) AS discounted_price,
        SUM(SUM((oi.list_price * (1 - discount))*quantity)) OVER (PARTITION BY oi.product_id)  AS total_sales_per_product
    FROM 
        order_items as oi
        JOIN products as p
            ON oi.product_id = p.product_id
    GROUP BY 1
    HAVING SUM(quantity) > 100
    ORDER BY 3 DESC