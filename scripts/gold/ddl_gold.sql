/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================

IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
    DROP VIEW gold.dim_customers;
GO

CREATE VIEW gold.dim_customers AS
SELECT
    ROW_NUMBER() OVER (ORDER BY ci.cst_id) AS customer_key, -- Surrogate key
    ci.cst_id AS customer_id,
    ci.csk_key AS customer_number,
    ci.cst_firstname AS first_name,
    ci.cst_lastname AS last_name,
    cu.cntry AS country_name,
    ci.cst_marital_status AS marital_status,
    CASE 
        WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr  -- CRM is master for gender info
        ELSE COALESCE(ca.gen, 'n/a') 
    END AS gender,
    ca.bdate AS birth_date,
    ci.cst_create_date AS create_date
FROM silver.crm_cust_info AS ci
LEFT JOIN silver.erp_cust_az12 AS ca
    ON ci.csk_key = ca.cid
LEFT JOIN silver.erp_loc_a101 AS cu
    ON ci.csk_key = cu.cid;
GO

-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================
IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO

CREATE VIEW gold.dim_products AS
SELECT
    ROW_NUMBER() OVER (ORDER BY p1.prd_start_dt, p1.prd_key) AS product_key, -- Surrogate key
    p1.prd_id AS product_id,
    p1.prd_key AS product_number,
    p1.cat_id AS category_id,
    p1.prd_nam AS product_name,
    p2.cat AS product_category,      
    p2.subcat AS product_subcategory,
    p2.maintenance,
    p1.prd_cost AS cost,
    p1.prd_line AS product_line,
    p1.prd_start_dt AS start_date
FROM silver.crm_prd_info AS p1
LEFT JOIN silver.erp_px_cat_g1v2 AS p2
    ON p1.cat_id = p2.id
WHERE p1.prd_end_dt IS NULL;  -- Filter out all historical data       
GO

-- =============================================================================
-- Create Fact Table: gold.fact_sales
-- =============================================================================
IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW gold.fact_sales;
GO

CREATE VIEW gold.fact_sales AS
SELECT
    s1.sls_ord_num AS order_number,
    pr.product_key,
    cu.customer_key,
    s1.sls_order_dt AS order_date,
    s1.sls_ship_dt AS ship_date,
    s1.sls_due_dt AS due_date,
    s1.sls_sales AS sales_amount,
    s1.sls_quantity AS sales_quantity,
    s1.sls_price AS price
FROM silver.crm_sales_details AS s1
LEFT JOIN gold.dim_products AS pr
    ON s1.sls_prd_key = pr.product_number
LEFT JOIN gold.dim_customers AS cu
    ON s1.sls_cust_id = cu.customer_id;
GO


