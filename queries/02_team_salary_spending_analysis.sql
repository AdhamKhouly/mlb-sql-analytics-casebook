/*
===============================================================================
  02_team_salary_spending_analysis.sql
  MLB SQL Analytics Casebook

  Focus:
    Analyze MLB team salary spending using annual and cumulative payroll logic.

  Table used:
    - salaries

  Questions:
    a) Return the top 20% of teams in terms of average annual spending.
    b) For each team, show the cumulative sum of spending over the years.
    c) Return the first year that each team's cumulative spending surpassed 1B.
===============================================================================
*/


/*-----------------------------------------------------------------------------
  a) Return the top 20% of teams in terms of average annual spending.
-----------------------------------------------------------------------------*/

WITH yearly_spending_per_team AS (
    SELECT
        teamid,
        yearid,
        SUM(salary) AS annual_spending
    FROM salaries
    GROUP BY
        teamid,
        yearid
),

average_spending_per_team AS (
    SELECT
        teamid,
        AVG(annual_spending) AS average_annual_spending
    FROM yearly_spending_per_team
    GROUP BY
        teamid
),

ranked_teams AS (
    SELECT
        teamid,
        average_annual_spending,
        NTILE(5) OVER (
            ORDER BY average_annual_spending DESC
        ) AS spending_quintile
    FROM average_spending_per_team
)

SELECT
    teamid,
    average_annual_spending
FROM ranked_teams
WHERE spending_quintile = 1
ORDER BY
    average_annual_spending DESC;


/*-----------------------------------------------------------------------------
  b) For each team, show the cumulative sum of spending over the years.
-----------------------------------------------------------------------------*/

WITH yearly_spending_per_team AS (
    SELECT
        yearid,
        teamid,
        SUM(salary) AS annual_spending
    FROM salaries
    GROUP BY
        teamid,
        yearid
),

cumulative_spending_per_team AS (
    SELECT
        yearid,
        teamid,
        annual_spending,
        SUM(annual_spending) OVER (
            PARTITION BY teamid
            ORDER BY yearid
        ) AS cumulative_spending
    FROM yearly_spending_per_team
)

SELECT
    *
FROM cumulative_spending_per_team
ORDER BY
    teamid,
    yearid;


/*-----------------------------------------------------------------------------
  c) Return the first year that each team's cumulative spending surpassed 1B.
-----------------------------------------------------------------------------*/

WITH yearly_spending_per_team AS (
    SELECT
        yearid,
        teamid,
        SUM(salary) AS annual_spending
    FROM salaries
    GROUP BY
        teamid,
        yearid
),

cumulative_spending_per_team AS (
    SELECT
        yearid,
        teamid,
        annual_spending,
        SUM(annual_spending) OVER (
            PARTITION BY teamid
            ORDER BY yearid
        ) AS cumulative_spending
    FROM yearly_spending_per_team
)

SELECT
    teamid,
    MIN(yearid) AS first_year_surpassed_1b
FROM cumulative_spending_per_team
WHERE cumulative_spending > 1000000000
GROUP BY
    teamid
ORDER BY
    first_year_surpassed_1b;