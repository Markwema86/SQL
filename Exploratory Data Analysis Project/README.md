# 📊 Exploratory Data Analysis Project - Explored Data In SQL
> Tool: **MySql Workbeanch**

---

## 🧠 Overview  
This EDA project explores trends and patterns in a cleaned dataset of global layoffs **[layoffs.csv]**. After performing thorough data cleaning to handle missing values, duplicates, and inconsistent formatting, the analysis focused on uncovering insights related to layoffs across companies, industries, countries, and time periods. Key areas of analysis included identifying the most affected sectors, peak layoff periods, geographical layoff hotspots, and the correlation between funding stages and layoff rates. 

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
- ✅ Performed in-depth Exploratory Data Analysis (EDA) to uncover trends and insights


---

## 💡 Key Insights  
- 📈 The original dataset contained duplicates and null values, which affected data quality
- 🧹 Several unnecessary columns were identified and removed to enhance focus and clarity
- 🔍 Additional fields were engineered (e.g., year, total layoffs per company) to support deeper visualization and analysis in the next phase
- 📊 Data cleaning significantly improved the accuracy and usability of insights drawn from the dataset

---

## 🚀 How to Run
1. Setup MySQL & Workbench
- Ensure MySQL Server and MySQL Workbench are installed and running.
- Open MySQL Workbench and connect to your local server instance.
2. Load the Cleaned Dataset
- If you’ve already cleaned the dataset in a previous step (e.g., layoffs_cleaned.csv), import it into MySQL:
- Use File → Table Data Import Wizard
- Choose the cleaned CSV file
- Create a new table (e.g., layoffs_cleaned)
3. Explore the Dataset with SQL Queries
- Use SQL to perform EDA by running analytical queries, such as:
- 📊 Overall Trends
```bash
SELECT YEAR(clean_date) AS year, SUM(total_laid_off) AS total_layoffs
FROM layoffs_cleaned
GROUP BY year
ORDER BY year;
```
- 🏭 Layoffs by Industry
```bash
SELECT industry, SUM(total_laid_off) AS layoffs
FROM layoffs_cleaned
GROUP BY industry
ORDER BY layoffs DESC
LIMIT 10;
```
- 🌍 Layoffs by Country
```bash
SELECT country, SUM(total_laid_off) AS layoffs
FROM layoffs_cleaned
GROUP BY country
ORDER BY layoffs DESC;
```
- 🧾 Layoff Percentage Insights
```bash
SELECT company, percentage_laid_off
FROM layoffs_cleaned
WHERE percentage_laid_off IS NOT NULL
ORDER BY percentage_laid_off DESC
LIMIT 10;
```
4. Use Views or CTEs (Optional)
Create views or use Common Table Expressions (CTEs) to organize complex queries and reuse logic in your EDA.
```bash
CREATE VIEW top_industries AS
SELECT industry, SUM(total_laid_off) AS total_layoffs
FROM layoffs_cleaned
GROUP BY industry
ORDER BY total_layoffs DESC;
```
5. Document & Visualize (Optional)
- Export query results for use in visualization tools like Excel, Power BI, or Tableau.
- Save screenshots of SQL outputs or write summaries of findings for reporting.

---

## 🧩 Folder Structure
- 📁 Exploratory Data Analysis Project/
- ├── Exploratory Data Analysis Project.sql/      # Source code (e.g., DDL, DML)
- ├── README.md         # Project documentation
- └── layoffs.csv/      # Raw and processed datasets

---

## 📬 Contact
- Created by Mark Wema
- 📧 [patnerwithmarkwema@gmail.com]
- 🔗 [LinkedIn](https://www.linkedin.com/in/mark-wema-385193328/)
-  • [Portfolio]()
