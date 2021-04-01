-- https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial
-- 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
-- 2
SELECT name FROM world
WHERE continent = 'Europe' AND gdp/population >
(SELECT gdp/population FROM world
WHERE name = 'United Kingdom')
-- 3
SELECT name, continent FROM world
WHERE continent = 
(SELECT continent FROM world
WHERE name = 'Argentina') OR
continent = 
(SELECT continent FROM world
WHERE name = 'Australia') ORDER BY name
-- 4
SELECT name, population FROM world
WHERE population > (SELECT population FROM world
WHERE name = 'canada') AND population < (SELECT population FROM world
WHERE name = 'poland')
-- 5
SELECT  name, CONCAT(ROUND((population/(SELECT population FROM world WHERE name ='germany')*100),0),'%')
FROM world
WHERE continent = 'europe'
-- 6
SELECT name FROM world
WHERE gdp > ALL(SELECT gdp FROM world
WHERE continent = 'europe' AND gdp > 0)
-- 7
SELECT  continent, name, area FROM world x
WHERE area >= ALL(SELECT area FROM world y
WHERE y.continent=x.continent AND area>0) 
-- 8
SELECT continent, name FROM world x 
WHERE name <= all (SELECT  name FROM world y
WHERE y.continent=x.continent) 
-- 9
SELECT  name, continent, population FROM world x
WHERE 25000000 > ALL(SELECT population FROM world y
WHERE x.continent = y.continent 
AND y.population > 0) 
-- 10
SELECT  name, continent FROM world x
WHERE population > ALL(SELECT  population*3 FROM world y
WHERE x.continent = y.continent 
AND population > 0 
AND y.name != x.name) 