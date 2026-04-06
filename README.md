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

### 2. `CovidVaccinations.csv`
Contains vaccination-related data by country and date.  
Key fields include:
- `location`
- `date`
- `new_vaccinations`
- `total_vaccinations`
- `people_vaccinated`
- `people_fully_vaccinated`

### 4. `Final_Covid_19.csv`
The master dataset created by **cleaning and joining** both CovidDeaths and 
CovidVaccinations tables. Contains **28,000+ rows** covering countries worldwide.

Key fields include:

| Column | Description |
|--------|-------------|
| `continent` | Continent the country belongs to |
| `location` | Country name |
| `date` | Date of the recorded data |
| `population` | Total population of the country |
| `total_cases` | Cumulative confirmed COVID-19 cases |
| `new_cases` | New cases recorded on that date |
| `total_deaths` | Cumulative confirmed COVID-19 deaths |
| `new_deaths` | New deaths recorded on that date |
| `new_vaccinations` | New vaccinations administered on that date |
| `total_vaccinations` | Cumulative total vaccinations given |
| `people_vaccinated` | People who received at least one dose |
| `people_fully_vaccinated` | People who completed full vaccination |

