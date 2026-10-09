CREATE DATABASE superstore;

USE superstore; 

SELECT * FROM order_file2 LIMIT 10;

ALTER TABLE order_file2
MODIFY discount DECIMAL (10,2);

-- Q1: What was the total Sales ?

SELECT SUM(sales) AS total_sales
FROM order_file2;

-- Q2: Top 5 highest selling products ?

SELECT product_id, SUM(sales) AS total_sales
FROM order_file2
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 5;

-- Q3: Which region has the heighest profit

SELECT region, SUM(profit) AS total_profit
FROM order_file2
GROUP BY region
ORDER BY total_profit DESC
LIMIT 1;

-- Q4: Showing the monthly trend sales ?

SELECT MONTH(order_date) AS month_name,
			SUM(sales) AS total_sales
		FROM order_file2
		GROUP BY month_name
		ORDER BY month_name;


-- Q5: The orders which are in loss ?

SELECT * FROM order_file2
WHERE profit < 0;

-- Q6: Top customers by revenue ?

SELECT customer_name, SUM(sales) AS total_sales
FROM order_file2
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Q7: Category wise performance ?

SELECT category, SUM(sales) AS total_sales,
				SUM(profit) AS total_profit
             FROM order_file2
             GROUP BY category;
             
-- Q8: The impact of discount on profit ?    

SELECT discount, AVG(profit) AS avg_profit
FROM order_file2
GROUP BY discount
ORDER BY discount;   

-- Q9: Which product is sold in the heighest quantity ? 

SELECT product_id, SUM(quantity) AS total_quantity
FROM order_file2
GROUP BY product_id
ORDER BY total_quantity DESC
LIMIT 1;

-- Q10: Country-wise sales ranking ?

SELECT country, SUM(sales) AS total_sales,
RANK() OVER(ORDER BY SUM(sales) DESC) AS rank_no
FROM order_file2
GROUP BY country;

-- Q11: Top 3 products in each category ?

SELECT * FROM
		(SELECT category, product_id,
			SUM(sales) AS total_sales,
            RANK() OVER(PARTITION BY category
				ORDER BY SUM(sales) DESC) AS rank_no
            FROM order_file2
            GROUP BY category, product_id) t
         WHERE rank_no <= 3; 
         
-- Q12: Running total of sales (Cumulative Sales) ?       

SELECT order_date, SUM(sales) AS daily_sales,
			SUM(sum(sales))
				OVER (ORDER BY order_date) AS running_total
         FROM order_file2
         GROUP BY order_date;
         

-- Q13: Repeat vs new customers ?   

SELECT customer_name, COUNT(order_id) AS total_orders
FROM order_file2
GROUP BY customer_name
HAVING total_orders > 1;


-- Q14: Profit ratio (Profit / Sales) ?

SELECT category, SUM(profit) / SUM(sales) AS profit_ratio
		FROM order_file2
        GROUP BY category;
        
        
-- Q15: Most profitable sub-category in each region ? 

SELECT * FROM (
			SELECT region, sub_category,
            SUM(profit) AS total_profit,
            RANK() OVER (PARTITION BY region
					ORDER BY SUM(profit) DESC) AS rnk
            FROM order_file2
            GROUP BY region, sub_category)
            AS ranked
            WHERE rnk<=2;
            
            
        
         
            
        
             

