# amazon-sales-data-analysis-using-sql
This project analyzes Amazon sales data using SQL to uncover trends, product performance, customer preferences, and more. The analysis includes sales trends, category-wise insights, and correlations between discounts and ratings.
## Dataset
The dataset contains Amazon sales information, including:
- Product details (IDs, categories, prices, discounts, ratings, etc.)
- Customer reviews and ratings
- Sales transactions

Data source: [Kaggle Amazon Sales Dataset](https://www.kaggle.com/datasets/karkavelrajaj/amazon-sales-dataset)
## Goals of the Analysis
1. Clean the dataset by removing unnecessary columns.
2. Analyze product sales and identify top and least-performing products.
3. Understand category-wise sales contributions and discount patterns.
4. Examine customer reviews, ratings, and their correlation with discounts.
5. Derive actionable insights for potential business decisions.
## Steps Performed
### 1. Data Cleaning
- Removed irrelevant columns to focus on key metrics.

### 2. Product Analysis
- Total number of unique products.
- Top and least-selling products.
- Products with the highest discounts and best ratings.

### 3. Sales Analysis
- Total revenue, category-wise sales, and average discounts.
- Category-wise sales contribution.

### 4. Review Analysis
- Products with the most and least reviews.
- Average ratings by category.
- Correlation between discounts and ratings.

### 5. Insights
- Sales peaked in certain categories during discount seasons.
- Electronics had the highest revenue but required significant discounts.
- High-rated products often had moderate discounts.

## Outputs
The following outputs were generated as part of the analysis:

1. **[Top-Selling Products](outputs/top_selling_products.csv)** - A list of the top 10 products based on total sales.
2. **[Category Sales Contribution](outputs/category_sales_contribution.csv)** - Sales contribution of each category as a percentage of total revenue.
3. **[Ratings and Discounts Correlation](outputs/ratings_discounts_correlation.csv)** - A dataset exploring the relationship between ratings and discounts.

All outputs are saved in the `outputs/` folder.