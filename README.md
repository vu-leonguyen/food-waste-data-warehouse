# Food Waste Data Warehouse & OLAP Analysis

This project builds a **Data Warehouse and OLAP system** for analyzing global food waste data.
The system processes raw data through an **ETL pipeline using SSIS**, stores it in a **data warehouse using a star schema**, and supports analytical queries through **OLAP and BI tools**.

The project was developed as part of the **Data Warehouse and OLAP course**.

---

# Dataset

Dataset: **Worldwide Food Waste Dataset**
Source: [Kaggle](https://www.kaggle.com/datasets/aritra100/worldwide-food-waste-dataset)

The dataset contains information about global food waste including:

* Country
* Region
* Year
* Population
* Income group
* GDP
* Food waste amount
* Economic loss

Time range: **2018 – 2024**

---

# Data Warehouse Architecture

The system follows a typical data warehouse pipeline:

```
Raw Dataset
   ↓
Staging Database
   ↓
ETL Pipeline (SSIS)
   ↓
Data Warehouse (Star Schema)
   ↓
OLAP Analysis
   ↓
BI Visualization
```

📌 *(Bạn nên thêm một hình architecture nếu có — ví dụ pipeline hoặc system overview)*

---

# Star Schema Design

The data warehouse is designed using a **star schema**.

Fact table:

```
Fact_FoodWaste
```

Dimension tables:

```
Dim_Country
Dim_Region
Dim_Time
Dim_IncomeGroup
Dim_FoodType
```

The fact table stores food waste metrics while dimension tables provide descriptive attributes for analysis.

📌 **Add image here**

```
warehouse_schema/star_schema.png
```

---

# Database Schema (SQL Server)

The database is created using SQL Server.

The SQL script creates:

* Staging database
* Data warehouse database
* Dimension tables
* Fact table with foreign key relationships

SQL file:

```
warehouse_schema/create_table.sql
```

---

# ETL Pipeline (SSIS)

The ETL process is implemented using **SQL Server Integration Services (SSIS)**.

The pipeline consists of three main steps:

1. Load raw Excel data into the **staging table**
2. Transform and load **dimension tables**
3. Populate the **fact table**

## Control Flow

📌 **Add image here**

```
etl/ssis_control_flow.png
```

This flow controls the ETL sequence:

```
Load Excel → Load Dimensions → Load Fact
```

---

## Load Excel to Staging

Raw data is first imported from Excel into the staging table.

Components used:

* Excel Source
* OLE DB Destination

📌 **Add image here**

```
etl/load_excel_staging.png
```

---

## Load Dimension Tables

Dimension tables are created by transforming data from the staging table.

Transformations include:

* Derived Column
* Sort
* Aggregate
* OLE DB Destination

📌 **Add image here**

```
etl/load_dimensions.png
```

---

## Load Fact Table

The fact table is populated by joining staging data with dimension tables.

Key transformation:

* Lookup (retrieve surrogate keys)

📌 **Add image here**

```
etl/load_fact.png
```

---

# OLAP Analysis

An OLAP cube is created using **SQL Server Analysis Services (SSAS)** to support multidimensional analysis.

Dimensions:

* Country
* Region
* Year
* Income Group
* Food Type

Measures:

* Total Waste
* Economic Loss
* Waste per Capita

These allow analysis such as:

* food waste by country
* economic loss by region
* food waste trends over time

---

# Technologies Used

* SQL Server
* SQL Server Integration Services (SSIS)
* SQL Server Analysis Services (SSAS)
* MDX
* Power BI
* Looker Studio
* Python (data mining)



---

# Authors

Information Systems – University of Information Technology

Nguyễn Trường Vũ

Phạm Minh Ngân

---
