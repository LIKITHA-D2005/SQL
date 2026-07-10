# Write your MySQL query statement below
SELECT e1.name
FROM employee e1
INNER JOIN employee e2
ON e1.id = e2.managerID
GROUP BY e1.id, e1.name
HAVING COUNT(e2.managerID) >= 5;