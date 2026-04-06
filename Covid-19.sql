-- The covid-19 Pandemic was one of a kind that took many lives. I embarked on a journey to get insights on Covid's impact on the World. The datasets of this project are from WHO. 
-- The following questions are what this analysis seeks to answer: 
-- - Percent Population Vaccinated 
-- - Deaths By Continent 
-- - Continents with the highest death count per population 
-- - Countries with Highest Infection Rate Compared to Population 
-- - Total cases & population percentage infected 
-- - Total Cases vs Total Deaths in India

-- - Daily new cases evolve globally over time
-- - Countries experienced the highest peak in daily cases
-- - Countries have the highest vaccination coverage
-- - Relationship between vaccination rates and death rates
-- - Countries have high cases but relatively low death rates

Create database COVID;
use COVID ;

Select * from covidvaccinations;
select * from coviddeaths;

SELECT 
iso_code,
continent,
location,
date,
population,
total_cases,
new_cases,
total_deaths,
new_deaths,
new_cases_smoothed,
new_deaths_smoothed 
from coviddeaths;

SELECT iso_code,continent,location,date,new_tests,total_tests,positive_rate,total_vaccinations,people_vaccinated,people_fully_vaccinated,new_vaccinations,median_age,aged_65_older,aged_70_older,cardiovasc_death_rate,diabetes_prevalence,female_smokers,male_smokers
from covidvaccinations;

-- Data Cleaning and Checking 

SELECT 
COUNT(*) AS total_rows,
COUNT(total_cases) AS cases_not_null,
COUNT(total_deaths) AS deaths_not_null
FROM CovidDeaths;

SELECT 
COUNT(*) AS total_rows,
COUNT(new_cases) AS new_cases_not_null,
COUNT(new_deaths) AS new_deaths_not_null,
COUNT(continent) AS continent_not_null
FROM CovidDeaths;

SELECT 
COUNT(*) AS total_rows,
COUNT(new_vaccinations) AS new_vacc_not_null,
COUNT(total_vaccinations) AS total_vacc_not_null
FROM CovidVaccinations;

-- CLEANED DATA of coviddeaths and covidvaccinations (Removing unwanted data)

CREATE VIEW Cleaned_CovidDeaths AS
SELECT 
continent,
location,
date,
population,
total_cases,
new_cases,
total_deaths,
new_deaths 
FROM CovidDeaths
WHERE continent IS NOT NULL;

select * from Cleaned_CovidDeaths;

CREATE VIEW Cleaned_CovidVaccinations AS
SELECT 
continent,
location,
date,
IFNULL(new_vaccinations, 0) AS new_vaccinations,
IFNULL(total_vaccinations, 0) AS total_vaccinations,
IFNULL(people_vaccinated, 0) AS people_vaccinated,
IFNULL(people_fully_vaccinated, 0) AS people_fully_vaccinated
FROM CovidVaccinations
WHERE continent IS NOT NULL;

SELECT * FROM Cleaned_CovidVaccinations;

-- NOW joining both cleaned tables (Cleaned_CovidDeaths & Cleaned_CovidVaccinations)

CREATE VIEW Final_CovidData AS
SELECT 
d.continent,
d.location,
d.date,
d.population,
d.total_cases,
d.new_cases,
d.total_deaths,
d.new_deaths,
v.new_vaccinations,
v.total_vaccinations,
v.people_vaccinated,
v.people_fully_vaccinated
FROM Cleaned_CovidDeaths d
JOIN Cleaned_CovidVaccinations v
ON d.location = v.location 
AND d.date = v.date;

SELECT * FROM Final_CovidData;


-- 01. Percent Population Vaccinated (What percentage of a country’s population has been vaccinated over time?)

SELECT 
location,
population,
SUM(new_vaccinations) as total_vaccinated,
(SUM(new_vaccinations) / NULLIF(population,0)) * 100 as percent_vaccinated
From Final_CovidData
GROUP BY location,population
ORDER BY percent_vaccinated DESC;

-- 02. Deaths By Continent (Total COVID deaths in each continent)

SELECT 
continent,
SUM(total_deaths) AS total_deaths
FROM Final_CovidData
GROUP BY continent
ORDER BY total_deaths DESC;

-- 03. Continents with the highest death count per population 

SELECT 
continent,
SUM(population) AS total_population,
MAX(total_deaths) As total_deaths,
(MAX(total_deaths) / NULLIF(SUM(population), 0)) * 100 as death_rate_percentage
FROM Final_CovidData
GROUP BY continent
ORDER BY death_rate_percentage DESC;

-- 04. Countries with Highest Infection Rate Compared to Population 

SELECT 
location,
population,
MAX(total_cases) AS highest_cases,
(MAX(total_cases) / NULLIF(population, 0)) * 100 as infection_rate
FROM Final_CovidData
GROUP BY location, population
ORDER BY infection_rate DESc;

-- 05. Total cases & population percentage infected
 
SELECT 
location,
population,
MAX(total_cases) AS total_cases,
(MAX(total_cases) / NULLIF(population, 0)) * 100 AS percent_population_infected
FROM Final_CovidData
GROUP BY location, population
ORDER BY percent_population_infected DESC;

-- Total cases & population percentage infected (GLOBALY INFECTED)

WITH GlobalData AS (
SELECT 
location,
MAX(total_cases) AS total_cases,
MAX(population) AS population
FROM Final_CovidData
GROUP BY location
)
SELECT 
SUM(population) AS total_population,
SUM(total_cases) AS total_cases,
(SUM(total_cases) / NULLIF(SUM(population), 0)) * 100 AS global_infection_percentage
FROM GlobalData;

-- 06. Total Cases vs Total Deaths in Nigeria

SELECT 
date,
total_cases,
total_deaths,
(total_deaths / NULLIF(total_cases, 0)) * 100 
AS death_percentage
FROM Final_CovidData
WHERE location = 'India'
ORDER BY date;

-- 07. How did daily new cases evolve globally over time

SELECT 
date,
SUM(new_cases) AS global_daily_cases
FROM Final_CovidData
GROUP BY date
ORDER BY date;

-- 08. Which countries experienced the highest peak in daily cases

SELECT 
location,
MAX(new_cases) AS highest_daily_cases
FROM Final_CovidData
GROUP BY location
ORDER BY highest_daily_cases DESC;

-- 09. Which countries have the highest vaccination coverage

SELECT 
location,
population,
MAX(people_vaccinated) AS total_vaccinated,
(MAX(people_vaccinated) / NULLIF(population, 0)) * 100 
AS vaccination_percentage
FROM Final_CovidData
GROUP BY location, population
ORDER BY vaccination_percentage DESC;

-- 10. What is the relationship between vaccination rates and death rates

WITH CountryStats as (
SELECT 
location,
MAX(population) AS population,
MAX(people_vaccinated) AS total_vaccinated,
MAX(total_cases) AS total_cases,
MAX(total_deaths) AS total_deaths
FROM Final_CovidData
GROUP BY location
)
SELECT 
location,
(total_vaccinated / NULLIF(population, 0)) * 100 AS vaccination_rate,
(total_deaths / NULLIF(total_cases, 0)) * 100 AS death_rate
FROM CountryStats
WHERE total_vaccinated IS NOT NULL
ORDER BY vaccination_rate DESC;

-- 11. Which countries have high cases but relatively low death rates

WITH CountryStats AS (
SELECT 
location,
MAX(total_cases) AS total_cases,
MAX(total_deaths) AS total_deaths
FROM Final_CovidData
GROUP BY location
)
SELECT 
location,
total_cases,
total_deaths,
(total_deaths / NULLIF(total_cases, 0)) * 100 AS death_rate
FROM CountryStats
WHERE total_cases > 1000000       
AND (total_deaths / NULLIF(total_cases, 0)) * 100 < 2  
ORDER BY total_cases DESC;

