SELECT year, ROUND(AVG(salary), 2) AS 'average salary' FROM salaries
GROUP BY year DESC
