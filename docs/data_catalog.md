# Data Catalog for Gold Layer

## Overview
The Gold Layer is the final business-ready representation of the data warehouse. It contains dimension tables and fact tables that are optimized for analytical queries, reporting, and executive dashboards.

This project builds a star schema with:
- Dimension tables for customers and products
- A fact table for sales transactions
- Surrogate keys to support stable joins across the warehouse

---

### 1. gold.dim_customers
- Purpose: Stores customer master data enriched with demographic and geographic attributes from CRM and ERP source systems.
- Columns:

| Column Name | Data Type | Description |
|-------------|----------|-------------|
| customer_key | INT | Surrogate key uniquely identifying each customer record in the dimension. |
| customer_id | INT | Business key from the CRM source system representing the original customer identifier. |
| customer_number | VARCHAR(50) | Customer code used for tracking, reporting, and reference across systems. |
| first_name | VARCHAR(50) | Customer's first name as stored in the CRM source. |
| last_name | VARCHAR(50) | Customer's last name or family name. |
| country | VARCHAR(50) | Country of residence for the customer, sourced from ERP location data. |
| marital_status | VARCHAR(50) | Customer's marital status, such as Married, Single, or other recorded value. |
| gender | VARCHAR(50) | Customer gender, using CRM as the primary source and ERP as a fallback when CRM is missing. |
| birthdate | DATE | Date of birth of the customer. |
| create_date | DATE | Date when the customer record was created in the source system. |

---

### 2. gold.dim_products
- Purpose: Stores product master data with category and subcategory classification for analytical reporting and product-level analysis.
- Columns:

| Column Name | Data Type | Description |
|-------------|----------|-------------|
| product_key | INT | Surrogate key uniquely identifying each product record in the dimension. |
| product_id | INT | Internal product identifier from the CRM product source. |
| product_number | VARCHAR(50) | Product key or code used to identify the product across the data warehouse. |
| product_name | VARCHAR(50) | Product name including relevant attributes such as model, line, and variant. |
| category_id | VARCHAR(50) | Identifier for the product category, used to connect the product to its classification. |
| category | VARCHAR(50) | High-level product category such as Bikes or Components. |
| subcategory | VARCHAR(50) | More specific product grouping within the main category. |
| maintenance_required | VARCHAR(50) | Indicates whether the product requires maintenance, using the ERP category reference data. |
| cost | INT | Product cost or base purchase price used for business and profitability analysis. |
| product_line | VARCHAR(50) | Product line or series to which the item belongs, such as Road or Mountain. |
| start_date | DATE | Date when the product became active or available for sale. |

---

### 3. gold.fact_sales
- Purpose: Stores transactional sales records for fact-based analytics, generating business insights across customers, products, and order timelines.
- Columns:

| Column Name | Data Type | Description |
|-------------|----------|-------------|
| order_number | VARCHAR(50) | Unique alphanumeric identifier for each sales order. |
| product_key | INT | Surrogate key linking the sales record to the product dimension. |
| customer_key | INT | Surrogate key linking the sales record to the customer dimension. |
| order_date | DATE | Date on which the sales order was placed. |
| shipping_date | DATE | Date on which the order was shipped to the customer. |
| due_date | DATE | Date when payment for the order was due. |
| sales_amount | INT | Total sales value for the transaction or line item. |
| quantity | INT | Number of units purchased in the order line. |
| price | INT | Unit price associated with the product in the order line. |

---

## Relationship Summary
- gold.dim_customers is joined to gold.fact_sales using customer_key.
- gold.dim_products is joined to gold.fact_sales using product_key.
- gold.fact_sales is the transactional fact table used to perform sales analysis across dates, products, and customers.

## Notes
- The Gold layer is built from the Silver layer after data cleansing and standardization.
- Historical records are filtered out when needed to keep the dimension current and business-ready.
- The design supports reporting use cases such as customer segmentation, product performance, and sales trends.
