# 📊 Data Cleaning Project - Cleaned Data In SQL
> Tool: **MySql Workbeanch**

---

## 🧠 Overview  
This project involved cleaning and preparing a dataset titled **[layoffs.csv/]**, which contains global layoff data from various tech and non-tech companies. The dataset includes fields such as company name, industry, number of layoffs, percentage laid off, location, date, and funding stage. The data was often inconsistent, with missing values, duplicate entries, and incorrect data types. The goal of the project was to clean and standardize the dataset to enable accurate analysis of layoff trends over time, by sector, and by geography.

---

## 📁 Dataset  
- **Source:** [Link to dataset]  
- **Size:** Approx. 18 KB / records  
- **Description:** Includes [e.g.,company name, industry, number of layoffs, percentage laid off, location, etc.]

---

## 🧰 Tools & Technologies

| Category         | Tools & Languages                       |
|------------------|------------------------------------------|
| Programming      | SQL                                      |
| Data Processing  | MySQL                                    |

---

## ⚙️ Features / What I Did
- ✅ Cleaned and transformed the raw layoffs.csv dataset
- ✅ Removed duplicate entries to ensure data integrity
- ✅ Standardized column formats (e.g., date, company names, industries)
- ✅ Handled missing or blank values by imputing or removing as appropriate
- ✅ Dropped irrelevant or unnecessary columns to streamline analysis
- ✅ Wrote and executed optimized SQL queries for targeted data retrieval


---

## 💡 Key Insights  
- 📈 The original dataset contained duplicates and null values, which affected data quality
- 🧹 Several unnecessary columns were identified and removed to enhance focus and clarity
- 🔍 Additional fields were engineered (e.g., year, total layoffs per company) to support deeper visualization and analysis in the next phase
- 📊 Data cleaning significantly improved the accuracy and usability of insights drawn from the dataset

---

## 🚀 How to Run

1. Install MySQL & MySQL Workbench
- Ensure MySQL Server and MySQL Workbench are installed on your machine.
- Create a local connection and start the MySQL server.
2. Import the Dataset (layoffs.csv)
- Convert the CSV file to a compatible format if needed (e.g., UTF-8).
- Use the "Table Data Import Wizard" in MySQL Workbench to load layoffs.csv into a new table.
- Example table name: layoffs_raw.
3. Create a Cleaned Version of the Table
- Write SQL queries to create a new table for cleaned data.
- Example:
```bash
CREATE TABLE layoffs_cleaned AS
SELECT DISTINCT
    company,
    industry,
    total_laid_off,
    percentage_laid_off,
    location,
    country,
    DATE_FORMAT(date, '%Y-%m-%d') AS clean_date,
    stage,
    funds_raised_millions
FROM layoffs_raw
WHERE company IS NOT NULL
  AND total_laid_off IS NOT NULL;
```
2. Verify Cleaned Data
- Run SELECT queries to inspect the cleaned table.
- Example:
```bash
SELECT * FROM layoffs_cleaned LIMIT 100;
```
3. Export Cleaned Data (Optional)
- Export the cleaned table back to CSV for further use in Excel, Python, or visualization tools.

---

## 🧩 Folder Structure
- 📁 Data Cleaning Project/
- ├── Data Cleaniing Project.sql/      # Source code (e.g., DDL, DML)
- ├── README.md         # Project documentation
- └── layoffs.csv/      # Raw and processed datasets

---

## 📬 Contact
- Created by Mark Wema
- 📧 [partnerwithmarkwema@gmail.com]
- 🔗 [LinkedIn](https://www.linkedin.com/in/mark-wema-385193328/)
-  • [Portfolio]()
