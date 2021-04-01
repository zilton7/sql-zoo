-- https://sqlzoo.net/wiki/The_JOIN_operation
-- 1
SELECT matchid, player FROM goal 
  WHERE teamid LIKE 'ger'
-- 2
SELECT id,stadium,team1,team2
  FROM game
WHERE id = '1012'
-- 3
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'ger'
-- 4
SELECT team1, team2, player
FROM game JOIN goal ON (game.id=goal.matchid)
WHERE player LIKE 'Mario%'
-- 5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (goal.teamid = eteam.id)
 WHERE gtime<=10
--  6
SELECT mdate, teamname
FROM game JOIN eteam ON (game.team1 = eteam.id)
WHERE eteam.coach = 'Fernando Santos'
-- 7
SELECT player
FROM goal JOIN game ON (game.id = goal.matchid)
WHERE game.stadium = 'National Stadium, Warsaw'
-- 8
SELECT DISTINCT player FROM goal
JOIN game ON (goal.matchid = game.id)
WHERE goal.teamid != 'GER' AND (game.team1 = 'GER' OR game.team2 = 'GER')
-- 9
SELECT teamname, COUNT(gtime)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname
-- 10
SELECT stadium, COUNT(mdate)
  FROM game JOIN goal ON id=matchid
 GROUP BY stadium
--  11
SELECT matchid, mdate, COUNT(goal.teamid)
  FROM game JOIN goal ON id = matchid 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate
-- 12
SELECT matchid, mdate, COUNT(goal.teamid)
  FROM game JOIN goal ON id = matchid 
 WHERE teamid = 'GER'
GROUP BY matchid, mdate
-- 13
SELECT DISTINCT mdate, team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game JOIN goal ON game.id = goal.matchid
GROUP BY  id, mdate, team1, team2 
ORDER BY mdate