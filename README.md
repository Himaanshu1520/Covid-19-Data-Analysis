# Covid-19-Data-Analysis
SQL & PowerBi based analysis of COVID-19 global data
This project analyzes global COVID-19 trends using **MySQL** for data preparation and **Power BI** for visualization.  
It demonstrates how to transform raw COVID-19 data into meaningful insights on infection rates, vaccination progress, and overall pandemic impact.


## 📁 Project Structure

| Folder/File | Description |
|-------------|-------------|
| **CovidDeaths.csv** | Raw dataset containing COVID-19 death records by country and date. |
| **CovidVaccinations.csv** | Raw dataset containing vaccination records by country and date. |
| **Final_Covid_19.csv** | Cleaned and joined final dataset used for analysis. |
| **Covid-19.sql** | All SQL scripts for data cleaning, views, and analysis queries. |

## 📊 Data Description

### 1. `CovidDeaths.csv`
Contains data on reported COVID-19 deaths by country, date, and population.  
Key fields include:
- `location`
- `date`
- `total_cases`
- `new_cases`
- `total_deaths`
- `new_deaths`
- `population`

