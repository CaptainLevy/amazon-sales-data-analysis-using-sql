-- Data Cleaning
ALTER TABLE amazon_sales_data 
DROP COLUMN product_name,
DROP COLUMN about_product,
DROP COLUMN user_id,
DROP COLUMN user_name,
DROP COLUMN review_id,
DROP COLUMN review_title,
DROP COLUMN review_content,
DROP COLUMN img_link,
DROP COLUMN product_link;

-- Product Analysis

-- Total Number of Products
SELECT COUNT(DISTINCT product_id) AS total_products
FROM amazon_sales_data;

-- Top-Selling Products
SELECT product_id, SUM(discounted_price) AS total_sales
FROM amazon_sales_data
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 10;

-- Least Selling Products
SELECT product_id, SUM(discounted_price) AS total_sales
FROM amazon_sales_data
GROUP BY product_id
ORDER BY total_sales ASC
LIMIT 10;

-- Top 10 Products with Highest Ratings
SELECT product_id, rating 
FROM amazon_sales_data
ORDER BY rating DESC
LIMIT 10;

-- Products with Lowest Ratings
SELECT product_id, rating
FROM amazon_sales_data
ORDER BY rating ASC
LIMIT 10;

-- Top 5 Products with Highest Discounts
SELECT product_id, discount_percentage
FROM amazon_sales_data
ORDER BY discount_percentage DESC
LIMIT 5;

-- Products with No Discounts
SELECT product_id, discounted_price, actual_price
FROM amazon_sales_data
WHERE discount_percentage = 0;

-- Products with Sales Above Average and Rating Above 4
SELECT product_id, SUM(discounted_price) AS total_sales, AVG(rating) AS average_rating
FROM amazon_sales_data
GROUP BY product_id
HAVING total_sales > (SELECT AVG(discounted_price) FROM amazon_sales_data) AND average_rating > 4;

-- Sales Analysis

-- Total Sales Revenue
SELECT SUM(discounted_price) AS total_sales_revenue
FROM amazon_sales_data;

-- Sales Revenue by Category
SELECT category, SUM(discounted_price) AS sales_revenue
FROM amazon_sales_data
GROUP BY category;

-- Average Discount Percentage by Category
SELECT category, AVG(discount_percentage) AS average_discount
FROM amazon_sales_data
GROUP BY category;

-- Total Number of Sales Transactions
SELECT COUNT(*) AS total_transactions
FROM amazon_sales_data;

-- Category-wise Sales Contribution
SELECT category, SUM(discounted_price) AS total_sales, 
       (SUM(discounted_price) / (SELECT SUM(discounted_price) FROM amazon_sales_data) * 100) AS sales_contribution
FROM amazon_sales_data
GROUP BY category
ORDER BY sales_contribution DESC;

-- Top 3 Categories with the Highest Average Discount Percentage
SELECT category, AVG(discount_percentage) AS average_discount
FROM amazon_sales_data
GROUP BY category
ORDER BY average_discount DESC
LIMIT 3;

-- Review Analysis

-- Number of Reviews per Product
SELECT product_id, COUNT(rating) AS review_count
FROM amazon_sales_data
GROUP BY product_id;

-- Products with Most Reviews
SELECT product_id, COUNT(rating) AS review_count
FROM amazon_sales_data
GROUP BY product_id
ORDER BY review_count DESC
LIMIT 10;

-- Products with Least Reviews
SELECT product_id, COUNT(rating) AS review_count
FROM amazon_sales_data
GROUP BY product_id
ORDER BY review_count ASC
LIMIT 10;

-- Average Rating per Category
SELECT category, AVG(rating) AS average_rating
FROM amazon_sales_data
GROUP BY category;

-- Products with Highest Average Rating
SELECT product_id, AVG(rating) AS average_rating
FROM amazon_sales_data
GROUP BY product_id
ORDER BY average_rating DESC
LIMIT 10;

-- Products with Lowest Average Rating
SELECT product_id, AVG(rating) AS average_rating
FROM amazon_sales_data
GROUP BY product_id
ORDER BY average_rating ASC
LIMIT 10;

-- Products with the Most Consistent Ratings (Lowest Standard Deviation)
SELECT product_id, STDDEV(rating) AS rating_stddev
FROM amazon_sales_data
GROUP BY product_id
ORDER BY rating_stddev ASC
LIMIT 10;

-- Correlation between Rating and Discount
SELECT rating, discount_percentage
FROM amazon_sales_data
WHERE rating IS NOT NULL AND discount_percentage IS NOT NULL;