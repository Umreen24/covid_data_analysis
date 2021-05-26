--SELECT *
--FROM covid_vacs
--ORDER BY 3,4

--SELECT *
--FROM covid_deaths
--ORDER BY 3,4

-- Select data that we are going to be using 
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM covid_deaths
ORDER BY 1,2;

-- Looking at the total cases vs total deaths
-- Shows the likelihood of dying if you contract covid in your country
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100.0 AS Death_Percentage
FROM covid_deaths
WHERE location = 'United States'
ORDER BY 1,2;

-- Total cases vs population
SELECT location, date, population, total_cases, (total_cases/population) * 100 AS Infected_Percentage
FROM covid_deaths
WHERE location = 'United States'
ORDER BY 1,2;

-- Countries with highest infection rate compared to population
SELECT location, population, MAX(total_cases) AS highest_infection, MAX((total_cases/population)) * 100 AS Highest_Infected_Percentage
FROM covid_deaths
GROUP BY location, population
ORDER BY Highest_Infected_Percentage DESC;

-- Countries with the highest death count per location
SELECT location, MAX(total_deaths) AS total_death_count
FROM covid_deaths
WHERE continent IS NULL 
GROUP BY location
ORDER BY total_death_count DESC;

-- Continents with highest death count
SELECT continent, MAX(total_deaths) AS total_death_count
FROM covid_deaths
WHERE continent IS NOT NULL 
GROUP BY continent
ORDER BY total_death_count DESC;

-- GLOBAL NUMBERS
SELECT SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS death_percentage
FROM covid_deaths
WHERE continent IS NOT NULL 
ORDER BY 1,2;