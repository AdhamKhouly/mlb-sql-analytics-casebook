/*
===============================================================================
  03_player_career_analysis.sql
  MLB SQL Analytics Casebook

  Focus:
    Analyze MLB player career timelines, debut/final game age, career length,
    and starting/ending team patterns.

  Tables used:
    - players
    - salaries

  Questions:
    a) For each player, calculate age at first game, age at last game, and
       career length.
    b) What team did each player play on for their starting and ending years?
    c) How many players started and ended on the same team and also played
       for over a decade?
===============================================================================
*/


/*-----------------------------------------------------------------------------
  a) For each player, calculate their age at their first game, their last game,
     and their career length.
-----------------------------------------------------------------------------*/

WITH player_journey AS (
    SELECT
        playerid,
        namegiven,
        birthyear,
        MAKE_DATE(birthyear, birthmonth, birthday) AS birthdate,
        debut AS firstgame,
        finalgame
    FROM players
    WHERE birthyear IS NOT NULL
      AND birthmonth IS NOT NULL
      AND birthday IS NOT NULL
      AND debut IS NOT NULL
      AND finalgame IS NOT NULL
)

SELECT
    playerid,
    namegiven,
    birthyear,
    EXTRACT(YEAR FROM firstgame) AS first_game_year,
    EXTRACT(YEAR FROM finalgame) AS final_game_year,
    EXTRACT(YEAR FROM AGE(firstgame, birthdate)) AS age_at_first_game,
    EXTRACT(YEAR FROM AGE(finalgame, birthdate)) AS age_at_last_game,
    EXTRACT(YEAR FROM AGE(finalgame, firstgame)) AS career_length
FROM player_journey
ORDER BY
    career_length DESC;


/*-----------------------------------------------------------------------------
  b) What team did each player play on for their starting and ending years?
-----------------------------------------------------------------------------*/

WITH player_start_end AS (
    SELECT
        playerid,
        namegiven,
        MAX(EXTRACT(YEAR FROM debut)) AS starting_year,
        MAX(EXTRACT(YEAR FROM finalgame)) AS ending_year
    FROM players
    GROUP BY
        playerid,
        namegiven
),

start_team AS (
    SELECT
        s.playerid,
        STRING_AGG(DISTINCT teamid, ', ' ORDER BY teamid) AS starting_team
    FROM salaries AS s
    INNER JOIN player_start_end AS pse
        ON pse.starting_year = s.yearid
       AND pse.playerid = s.playerid
    GROUP BY
        s.playerid
),

end_team AS (
    SELECT
        s.playerid,
        STRING_AGG(DISTINCT teamid, ', ' ORDER BY teamid) AS ending_team
    FROM salaries AS s
    INNER JOIN player_start_end AS pse
        ON pse.ending_year = s.yearid
       AND pse.playerid = s.playerid
    GROUP BY
        s.playerid
)

SELECT
    namegiven,
    starting_year,
    ending_year,
    starting_team,
    ending_team
FROM player_start_end AS pse
INNER JOIN start_team AS st
    ON pse.playerid = st.playerid
INNER JOIN end_team AS et
    ON et.playerid = pse.playerid
ORDER BY
    starting_year,
    namegiven;


/*-----------------------------------------------------------------------------
  c) How many players started and ended on the same team and also played for
     over a decade?
-----------------------------------------------------------------------------*/

WITH player_start_end AS (
    SELECT
        playerid,
        namegiven,
        MAX(EXTRACT(YEAR FROM debut)) AS starting_year,
        MAX(EXTRACT(YEAR FROM finalgame)) AS ending_year
    FROM players
    GROUP BY
        playerid,
        namegiven
),

start_team AS (
    SELECT
        s.playerid,
        STRING_AGG(DISTINCT teamid, ', ' ORDER BY teamid) AS starting_team
    FROM salaries AS s
    INNER JOIN player_start_end AS pse
        ON pse.starting_year = s.yearid
       AND pse.playerid = s.playerid
    GROUP BY
        s.playerid
),

end_team AS (
    SELECT
        s.playerid,
        STRING_AGG(DISTINCT teamid, ', ' ORDER BY teamid) AS ending_team
    FROM salaries AS s
    INNER JOIN player_start_end AS pse
        ON pse.ending_year = s.yearid
       AND pse.playerid = s.playerid
    GROUP BY
        s.playerid
)

SELECT
    SUM(
        CASE
            WHEN starting_team = ending_team
             AND ending_year - starting_year > 10
            THEN 1
            ELSE 0
        END
    ) AS special_players
FROM player_start_end AS pse
INNER JOIN start_team AS st
    ON pse.playerid = st.playerid
INNER JOIN end_team AS et
    ON et.playerid = pse.playerid;