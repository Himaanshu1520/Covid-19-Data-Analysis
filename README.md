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

## 📊 Data Description

### 1. `CovidDeaths.csv`
Tracks COVID-19 confirmed cases and deaths worldwide.  
Each row represents a country on a specific date, capturing:
- Daily and cumulative **case counts**
- Daily and cumulative **death counts**
- **Population** of each country

### 2. `CovidVaccinations.csv`
Tracks the global vaccination rollout by country and date, including:
- Number of **people vaccinated** (at least one dose)
- Number of **fully vaccinated** individuals
- **Daily new vaccinations** recorded

### 3. `Final_Covid_19.csv`
The cleaned and joined dataset combining both tables above.  
Used as the primary source for all SQL analysis and Power BI visuals.

## 🧠 SQL Analysis

The SQL script performs data cleaning, transformation, and analysis.  
Key areas of focus:

- Percent population vaccinated per country
- Deaths by continent
- Continents with highest death count per population
- Countries with highest infection rates
- Total cases vs total deaths in India
- Daily new cases globally over time
- Countries with highest vaccination coverage
- Relationship between vaccination rates and death rates
- Countries with high cases but low death rates

| SQL File | Description |
|----------|-------------|
| `Covid-19.sql` | Full data cleaning, views creation, and 11 analytical queries. |

## 📊 Power BI Dashboard

Insights from the SQL queries were visualized using **Microsoft Power BI**, 
transforming results into an interactive dashboard.
<img width="1304" height="740" alt="image" src="https://github.com/user-attachments/assets/9a88eb99-4e35-45bd-baba-5174257edeb2" />


### 📌 Dashboard Highlights

| KPI | Value |
|-----|-------|
| Total Cases | 5 Billion |
| Total Deaths | 129.78 Million |
| Total Vaccinations | 6 Billion |
| Case Fatality Rate | 2.50% |
| Vaccination Rate | 115.86% |

The dashboard includes the following visuals:
- 📈 **Daily Cases and Daily Deaths by Month** — trend line showing pandemic waves
- 📊 **Total Cases and Total Deaths by Month** — cumulative monthly comparison
- 📉 **Monthly Cases and Deaths** — bar chart showing monthly totals
- 🌍 **Total Cases by Location** — horizontal bar chart (India ranked highest)
- 🗺️ **World Map** — geographic distribution of total cases by country
- 🔽 **Country Filter** — interactive slicer to filter all visuals by location

## 🛠️ Tools & Technologies

- **MySQL**
- **Power BI Desktop**
- **Excel / CSV**
- **Git & GitHub**




