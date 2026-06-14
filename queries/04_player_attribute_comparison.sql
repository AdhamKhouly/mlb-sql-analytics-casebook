/*
===============================================================================
  04_player_attribute_comparison.sql
  MLB SQL Analytics Casebook

  Focus:
    Compare player attributes, batting-side distribution, and physical trends
    over time.

  Tables used:
    - players
    - salaries

  Questions:
    a) Which players have the same birthday?
    b) Create a summary table that shows, for each team, what percent of players
       bat right, left, and both.
    c) How have average height and weight at debut game changed over the years,
       and what is the decade-over-decade difference?
===============================================================================
*/


/*-----------------------------------------------------------------------------
  a) Which players have the same birthday?
-----------------------------------------------------------------------------*/

SELECT
    p1.namegiven AS player_1,
    p2.namegiven AS player_2,
    MAKE_DATE(p1.birthyear, p1.birthmonth, p1.birthday) AS birthdate
FROM players AS p1
INNER JOIN players AS p2
    ON p1.birthyear = p2.birthyear
   AND p1.birthmonth = p2.birthmonth
   AND p1.birthday = p2.birthday
   AND p1.playerid > p2.playerid
WHERE p1.birthyear IS NOT NULL
  AND p1.birthmonth IS NOT NULL
  AND p1.birthday IS NOT NULL;


/*-----------------------------------------------------------------------------
  b) Create a summary table that shows, for each team, what percent of players
     bat right, left, and both.
-----------------------------------------------------------------------------*/

WITH distinct_team_players AS (
    SELECT DISTINCT
        teamid,
        playerid
    FROM salaries
    WHERE teamid IS NOT NULL
      AND playerid IS NOT NULL
),

bat_summary AS (
    SELECT
        dtp.teamid,
        SUM(CASE WHEN p.bats = 'R' THEN 1.0 ELSE 0 END) AS players_right,
        SUM(CASE WHEN p.bats = 'L' THEN 1.0 ELSE 0 END) AS players_left,
        SUM(CASE WHEN p.bats = 'B' THEN 1.0 ELSE 0 END) AS players_both,
        COUNT(p.bats) AS total
    FROM distinct_team_players AS dtp
    INNER JOIN players AS p
        ON dtp.playerid = p.playerid
    GROUP BY
        dtp.teamid
)

SELECT
    teamid,
    CONCAT(ROUND(players_right / NULLIF(total, 0), 3) * 100, '%') AS percent_right,
    CONCAT(ROUND(players_left / NULLIF(total, 0), 3) * 100, '%') AS percent_left,
    CONCAT(ROUND(players_both / NULLIF(total, 0), 3) * 100, '%') AS percent_both
FROM bat_summary
ORDER BY
    teamid;


/*-----------------------------------------------------------------------------
  c) How have average height and weight at debut game changed over the years,
     and what's the decade-over-decade difference?
-----------------------------------------------------------------------------*/

WITH RECURSIVE year_totals AS (
    SELECT
        EXTRACT(YEAR FROM debut) AS debut_year,
        AVG(weight) AS average_weight,
        AVG(height) AS average_height
    FROM players
    WHERE debut IS NOT NULL
      AND weight IS NOT NULL
      AND height IS NOT NULL
    GROUP BY
        EXTRACT(YEAR FROM debut)
),

decades(a, b) AS (
    SELECT
        MIN(debut_year),
        MIN(debut_year) + 9
    FROM year_totals

    UNION ALL

    SELECT
        a + 10,
        b + 10
    FROM decades
    WHERE b < (
        SELECT MAX(debut_year)
        FROM year_totals
    )
),

decade_summary AS (
    SELECT
        a,
        b,
        AVG(average_weight) AS avg_weight,
        AVG(average_height) AS avg_height
    FROM decades AS d
    INNER JOIN year_totals AS t
        ON debut_year >= a
       AND debut_year <= b
    GROUP BY
        a,
        b
)

SELECT
    CONCAT(a, ' - ', b) AS decade,
    ROUND(avg_weight, 2) AS average_weight,
    ROUND(avg_weight - LAG(avg_weight) OVER (ORDER BY a), 2) AS weight_difference,
    ROUND(avg_height, 2) AS average_height,
    ROUND(avg_height - LAG(avg_height) OVER (ORDER BY a), 2) AS height_difference
FROM decade_summary
ORDER BY
    a;