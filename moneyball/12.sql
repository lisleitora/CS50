-- database: moneyball.db
SELECT pl.first_name
  , pl.last_name
FROM players AS pl
JOIN salaries AS s ON (s.player_id = pl.id)
JOIN performances AS pe ON (pe.player_id = pl.id)
WHERE pl.id IN (
    SELECT pl.id
    FROM players AS pl
    JOIN salaries AS s ON (s.player_id = pl.id)
    JOIN performances AS pe ON (
        pe.player_id = pl.id
        AND pe.year = s.year
      )
    WHERE pe.year = '2001'
      AND pe.RBI NOT LIKE '0'
    ORDER BY s.salary / pe.RBI, pl.first_name, pl.last_name
    LIMIT 10
  )
  AND pl.id IN (
    SELECT pl.id
    FROM players AS pl
    JOIN salaries AS s ON (s.player_id = pl.id)
    JOIN performances AS pe ON (
        pe.player_id = pl.id
        AND pe.year = s.year
      )
    WHERE pe.year = '2001'
      AND pe.H NOT LIKE '0'
    ORDER BY s.salary / pe.H, pl.first_name, pl.last_name
    LIMIT 10
  )
GROUP BY pl.id
ORDER BY pl.id

;
