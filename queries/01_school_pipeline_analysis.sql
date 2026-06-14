/*
===============================================================================
  01_school_pipeline_analysis.sql
  MLB SQL Analytics Casebook

  Focus:
    Analyze which schools produced MLB players and how school pipelines changed
    across decades.

  Tables used:
    - schools
    - school_details

  Questions:
    a) In each decade, how many schools were there that produced MLB players?
    b) What are the names of the top 5 schools that produced the most players?
    c) For each decade, what were the names of the top 3 schools that produced
       the most players?
===============================================================================
*/


/*-----------------------------------------------------------------------------
  a) In each decade, how many schools were there that produced MLB players?
-----------------------------------------------------------------------------*/

WITH RECURSIVE decades(a, b) AS (
    SELECT
        MIN(yearid),
        MIN(yearid) + 9
    FROM schools

    UNION ALL

    SELECT
        a + 10,
        b + 10
    FROM decades
    WHERE b < (
        SELECT MAX(yearid)
        FROM schools
    )
)

SELECT
    CONCAT(a, '-', b) AS decade,
    COUNT(DISTINCT schoolid) AS number_of_schools
FROM decades
LEFT JOIN schools
    ON yearid >= a
   AND yearid <= b
GROUP BY
    a,
    b
ORDER BY
    a;


/*-----------------------------------------------------------------------------
  b) What are the names of the top 5 schools that produced the most players?
-----------------------------------------------------------------------------*/

WITH players_per_school AS (
    SELECT
        schoolid,
        COUNT(DISTINCT playerid) AS num_of_players
    FROM schools
    GROUP BY
        schoolid
)

SELECT
    name_full,
    num_of_players
FROM school_details AS sd
INNER JOIN players_per_school AS pps
    ON sd.schoolid = pps.schoolid
ORDER BY
    num_of_players DESC
LIMIT 5;


/*-----------------------------------------------------------------------------
  c) For each decade, what were the names of the top 3 schools that produced
     the most players?
-----------------------------------------------------------------------------*/

WITH RECURSIVE decades(a, b) AS (
    SELECT
        MIN(yearid),
        MIN(yearid) + 9
    FROM schools

    UNION ALL

    SELECT
        a + 10,
        b + 10
    FROM decades
    WHERE b < (
        SELECT MAX(yearid)
        FROM schools
    )
),

players_per_decade_school AS (
    SELECT
        a AS decade_start,
        b AS decade_end,
        s.schoolid,
        COUNT(DISTINCT s.playerid) AS num_of_players,
        ROW_NUMBER() OVER (
            PARTITION BY a, b
            ORDER BY COUNT(DISTINCT s.playerid) DESC
        ) AS school_rank
    FROM decades AS d
    LEFT JOIN schools AS s
        ON s.yearid BETWEEN a AND b
    GROUP BY
        a,
        b,
        s.schoolid
)

SELECT
    CONCAT(decade_start, ' - ', decade_end) AS decade,
    MAX(CASE WHEN school_rank = 1 THEN name_full END) AS first_school,
    MAX(CASE WHEN school_rank = 2 THEN name_full END) AS second_school,
    MAX(CASE WHEN school_rank = 3 THEN name_full END) AS third_school
FROM players_per_decade_school AS ppds
INNER JOIN school_details AS sd
    ON ppds.schoolid = sd.schoolid
WHERE school_rank <= 3
GROUP BY
    decade_start,
    decade_end
ORDER BY
    decade_start;