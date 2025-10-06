# 💼 Tech Layoffs Data Analysis (SQL Project)

### 📌 Overview
This project explores global **tech layoffs data** from 2020–2023 using **MySQL**.  
It is divided into two phases — **Data Cleaning** and **Exploratory Data Analysis (EDA)** — to uncover key trends across industries, companies, and time periods.

---

### ⚙️ Tools & Skills Used
- **SQL (MySQL)** — Data cleaning, analysis, and transformation  
- **Window Functions**, **CTEs**, and **Aggregate Queries**  
- **Data Standardization** and **Null Handling**  
- **Excel/CSV Integration** for importing raw data  

---

### 🧹 Phase 1: Data Cleaning
Performed a complete cleaning process using `Data_cleaning_layoffs.sql`:
- Removed **duplicate entries** using `ROW_NUMBER()`  
- Standardized inconsistent formats (e.g., `industry`, `country`, and `date`)  
- Fixed **NULL** and blank fields  
- Created a **staging table** for clean and reliable analysis  

---

### 📊 Phase 2: Exploratory Data Analysis (EDA)
Conducted deeper trend analysis using `EDA_PROJECT_1.sql`:
- Identified **top companies** and **industries** affected by layoffs  
- Analyzed **yearly and monthly layoff patterns**  
- Created **rolling totals** for trend observation  
- Ranked industries by total layoffs using **CTEs** and **DENSE_RANK()**  

---

### 📈 Key Insights
- **2023** recorded the highest layoffs globally  
- **Technology** and **Crypto** sectors were most impacted  
- Major firms such as **Google**, **Meta**, and **Amazon** led global layoffs  
- Layoffs increased significantly post-2022, showing a shift in hiring trends  

---

### 🗂️ Project Structure
```
tech-layoffs-sql-analysis/
│
├── layoffs.csv                  # Raw dataset
├── Data_cleaning_layoffs.sql    # Data cleaning and transformation
├── EDA_PROJECT_1.sql            # Exploratory data analysis
└── README.md                    # Project documentation
```

---

### 📚 How to Run
1. Open MySQL Workbench or any SQL editor.  
2. Import the dataset:  
   ```sql
   LOAD DATA INFILE 'layoffs.csv' 
   INTO TABLE layoffs 
   FIELDS TERMINATED BY ',' 
   IGNORE 1 ROWS;
   ```
3. Run the `Data_cleaning_layoffs.sql` script first.  
4. Then execute `EDA_PROJECT_1.sql` for analysis and insights.

---

### 💡 Future Enhancements
- Create an **interactive Tableau dashboard** for visual insights  
- Automate data updates using Python or SQL scripts  
- Expand dataset to include **company size and region-level breakdowns**

---

### 👨‍💻 Author
**Vihaan Sharad Kakarla**  
📧 [vihaansharad23@gmail.com](mailto:vihaansharad23@gmail.com)  
💻 [github.com/V3NOW](https://github.com/V3NOW)

---

### 🏷️ Tags
`SQL` `Data Cleaning` `EDA` `MySQL` `Tech Layoffs` `Data Analytics` `Business Intelligence` `Data Project`
