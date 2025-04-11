# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project showcases a complete data warehousing and analytics solution—from building a modern data warehouse to generating actionable insights. Designed as a portfolio project, it reflects industry-standard practices in **data engineering**, **ETL**, and **business analytics**.

---

## 🏗️ Data Architecture

The project follows the **Medallion Architecture** using **Bronze**, **Silver**, and **Gold** layers:

![Data Architecture](docs/data_architecture.png)

1. **Bronze Layer**: Stores raw data as-is from source systems. Data is ingested from CSV files into the SQL Server database.
2. **Silver Layer**: Cleansed and transformed data is standardized and normalized for better usability.
3. **Gold Layer**: Contains business-ready data modeled using a **star schema** to support reporting and analytics.

---

## 📖 Project Overview

This project covers:

1. **Modern Data Architecture**: Using a multi-layered approach with Bronze, Silver, and Gold layers.
2. **ETL Pipelines**: Extract, Transform, and Load processes using SQL Server tools.
3. **Data Modeling**: Designing star schema with fact and dimension tables optimized for analysis.
4. **Analytics & Reporting**: Generating insights using SQL queries and dashboards.

🎯 Ideal for showcasing skills in:
- SQL Development  
- Data Engineering  
- Data Architecture  
- ETL Development  
- Data Modeling  
- Data Analytics  

---

## 🛠️ Tools & Resources

Everything used in this project is freely available!

- **[Datasets](datasets/):** Contains the source data (CSV files).  
- **[SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads):** Lightweight SQL Server for local development.  
- **[SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16):** GUI for managing SQL Server databases.  
- **[GitHub](https://github.com/):** Host and version your project.  
- **[Draw.io](https://www.drawio.com/):** For designing data models, architectures, and diagrams.  
- **[Notion Template](https://www.notion.com/templates/sql-data-warehouse-project):** Use this template to manage the project.  
- **[Project Workflow in Notion](https://thankful-pangolin-2ca.notion.site/SQL-Data-Warehouse-Project-16ed041640ef80489667cfe2f380b269?pvs=4):** Step-by-step guide through the full project lifecycle.

---

## 🚀 Project Requirements

### 🧱 Data Engineering – Building the Data Warehouse

#### Objective  
Develop a modern data warehouse using SQL Server to centralize sales and customer data for analytical reporting and better decision-making.

#### Specifications
- **Data Sources**: Load data from two systems (ERP and CRM) provided as CSV files.  
- **Data Quality**: Clean and standardize data to resolve inconsistencies.  
- **Integration**: Combine ERP and CRM data into a single analytical data model.  
- **Scope**: Focus on the latest available data; historical tracking is not required.  
- **Documentation**: Provide data model documentation for business and technical teams.

---

### 📊 Business Intelligence – Analytics & Reporting

#### Objective  
Develop SQL-based reports and analytics to uncover key business insights:

- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

