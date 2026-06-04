# Tech Layoffs Workforce Analysis

## Overview
This project analyzes global tech layoffs between 2020 and 2024 using SQL. The goal was to clean raw layoff data, explore workforce reduction trends, and generate business insights across companies, industries, countries, and time periods.

The project follows a typical analytics workflow:
1. Data Cleaning
2. Exploratory Data Analysis (EDA)
3. Business Insights

## Dataset

- 2,361 layoff records
- Multiple countries and industries
- Time period: 2020–2024

## Business Questions Explored

- Which companies experienced the highest layoffs?
- Which industries were most affected?
- Which countries recorded the largest workforce reductions?
- How did layoffs change over time?
- What trends emerged after 2022?
- Which industries were most impacted year-over-year?

## Tools & Skills Used

- SQL (MySQL)
- Data Cleaning
- Exploratory Data Analysis (EDA)
- CTEs
- Window Functions
- Aggregate Queries
- DENSE_RANK()
- Data Standardization
- Business Intelligence

## Phase 1: Data Cleaning

Using Data_cleaning_layoffs.sql:

- Removed duplicate records using ROW_NUMBER()
- Standardized industry, country, and date formats
- Fixed NULL and blank values
- Created a clean staging table for analysis

## Phase 2: Exploratory Data Analysis

Using EDA PROJECT 1.sql:

- Analyzed layoffs by company, industry, and country
- Identified yearly and monthly layoff trends
- Created rolling monthly totals
- Ranked industries and companies using DENSE_RANK()
- Generated trend-based business insights

## Key Insights

- 2023 recorded the highest layoffs globally
- Technology and Crypto sectors were among the most affected
- Large technology firms experienced significant workforce reductions
- Layoff activity increased substantially after 2022

## Project Structure

tech-layoffs-workforce-analysis/
│
├── layoffs.csv
├── Data_cleaning_layoffs.sql
├── EDA PROJECT 1.sql
├── README.md
└── screenshots/

## Future Enhancements

- Add Tableau dashboards
- Add Power BI visualizations
- Expand analysis by company size and region
- Automate reporting workflows using Python

## Author

Vihaan Sharad Kakarla
GitHub: https://github.com/V3NOW

