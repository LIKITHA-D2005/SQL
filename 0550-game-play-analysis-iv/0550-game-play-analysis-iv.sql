# Write your MySQL query statement below
WITH first_login As
(
    SELECT player_id,
    MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(
    COUNT(DISTINCT a.player_id) * 1.0
    / COUNT(DISTINCT f.player_id),
    2
) AS fraction
FROM first_login f
LEFT JOIN Activity a
ON f.player_id = a.player_id
AND a.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY);