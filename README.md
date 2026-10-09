# Superstore E-Commerce Sales & Profitability Analysis

## 📌 Project Overview
This project delivers an end-to-end exploratory data analysis of retail transaction records using MySQL. The objective is to identify key retail KPIs, track monthly revenue trends, isolate high-loss product sub-categories caused by aggressive discounting, and evaluate customer retention.

## 🛠️ Tech Stack & SQL Techniques Applied
* **Database Management System:** MySQL Workbench
* **SQL Concepts:** Common Table Expressions (CTEs), Window Functions (`RANK() OVER ()`, `SUM() OVER ()`), Aggregation & Grouping, Date Transformations, Ratio Calculations.

## 📊 Key Business Findings & Insights
1. **Profit Leakage via Discounting:** Discounts exceeding 20% severely erode profit margins across several sub-categories (e.g., Tables and Bookcases), leading to negative net margins.
2. **Regional & Category Performance:** Pinpointed top-performing product lines by region to enable localized inventory allocation.
3. **Customer Retention:** High-value repeat buyers generate a significant portion of overall revenue, supporting the business case for dedicated loyalty programs.

## 📁 Repository Structure
* `sql project.sql`: Full SQL script containing data transformations, windowed rankings, running totals, and business queries.
