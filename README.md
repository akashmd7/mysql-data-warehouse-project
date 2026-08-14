# MySQL Data Warehouse Project

An end-to-end data warehouse built in MySQL using the Bronze, Silver, and Gold layers. The project demonstrates a simplified modern data warehouse workflow: raw ingestion, data cleansing and standardization, dimensional modeling, and analytical reporting through SQL.

## Project Overview
This repository models a retail-style sales and customer dataset using a star schema. It combines customer, product, and transaction data from different source systems and prepares a clean analytical layer for business reporting.

The warehouse is organized into three layers:

- Bronze: raw source tables as landed from CRM and ERP data
- Silver: cleaned, standardized, and validated tables
- Gold: business-ready dimension and fact views for reporting and analytics

## Architecture

### 1. Bronze Layer
The Bronze layer stores source data in near-raw form. This includes customer, product, sales, location, and product category data.

Files:
- [scripts/init_database.sql](scripts/init_database.sql)
- [scripts/bronze/ddl_bronze.sql](scripts/bronze/ddl_bronze.sql)

### 2. Silver Layer
The Silver layer applies cleaning and transformation rules such as standardizing field values, validating dates, and preparing consistent keys for downstream processing.

Files:
- [scripts/silver/ddl_silver.sql](scripts/silver/ddl_silver.sql)

### 3. Gold Layer
The Gold layer creates a star schema with dimension tables and a fact table suitable for BI and analytical queries.

Files:
- [scripts/gold/ddl_gold.sql](scripts/gold/ddl_gold.sql)
- [docs/data_catalog.md](docs/data_catalog.md)

## Data Model
The project uses a dimensional model built around sales analysis.

### Dimension Tables
- gold.dim_customers
  - Customer demographic and geographic attributes
- gold.dim_products
  - Product details, category, subcategory, and classification

### Fact Table
- gold.fact_sales
  - Transactional sales data connected to customer and product dimensions

## Source Systems
The project combines data from multiple sources:

- CRM source data
  - Customer information
  - Product information
  - Sales transactions
- ERP source data
  - Customer birthdate and gender
  - Country and location mapping
  - Product category metadata

## Quality Checks
Data quality checks are included to validate the integrity of the warehouse at both the Silver and Gold layers.

Files:
- [tests/quality_checks_silver.sql](tests/quality_checks_silver.sql)
- [tests/quality_checks_gold.sql](tests/quality_checks_gold.sql)

These checks validate:
- duplicate and null values
- invalid or inconsistent dates
- sales value consistency
- referential integrity between the fact and dimension tables

## Typical Workflow
1. Run [scripts/init_database.sql](scripts/init_database.sql) to create the bronze, silver, and gold databases.
2. Create Bronze tables using [scripts/bronze/ddl_bronze.sql](scripts/bronze/ddl_bronze.sql).
3. Load source data into the Bronze layer.
4. Create Silver tables and clean/standardize the data using [scripts/silver/ddl_silver.sql](scripts/silver/ddl_silver.sql).
5. Build Gold views using [scripts/gold/ddl_gold.sql](scripts/gold/ddl_gold.sql).
6. Run validation queries from [tests/quality_checks_silver.sql](tests/quality_checks_silver.sql) and [tests/quality_checks_gold.sql](tests/quality_checks_gold.sql).

## Project Structure

- [datasets/](datasets/)
  - Raw source CSV files for CRM and ERP data
- [scripts/](scripts/)
  - SQL scripts for database setup, warehouse layers, and transformations
- [tests/](tests/)
  - Quality validation scripts
- [docs/](docs/)
  - Documentation, including the data catalog

## Technologies Used
- MySQL
- SQL
- ETL/data warehouse design
- Dimensional modeling
- Data quality validation

## Purpose
This project is designed to showcase a practical end-to-end data warehouse implementation in MySQL, with emphasis on:

- raw-to-curated data processing
- data quality control
- dimensional modeling
- business-oriented analytics

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
