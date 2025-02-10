SELECT 
    ROUND(SUM(CASE WHEN a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY) THEN 1 ELSE 0 END) 
          / COUNT(DISTINCT f.player_id), 2) 
    AS fraction
FROM Activity a
JOIN 
    (SELECT player_id, MIN(event_date) AS first_login 
     FROM Activity 
     GROUP BY player_id) f
ON a.player_id = f.player_id;
