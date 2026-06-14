# 03 — Player Career Analysis

## Case Objective

This analysis explores MLB player career timelines using biographical and salary/team data from the Lahman Baseball Database.

The goal is to answer three questions:

1. How old was each player at their debut and final game?
2. What team did each player play for during their starting and ending years?
3. How many players started and ended on the same team while playing for over a decade?

This case focuses on player longevity, career start/end points, and team continuity.

---

## Tables Used

| Table | Purpose |
|---|---|
| `players` | Contains player birth dates, debut dates, final game dates, and biographical attributes |
| `salaries` | Used as the available team-year source for player-team relationships |

---

## Business Framing

Career timeline analysis is useful for understanding:

- Player longevity
- Debut age patterns
- Career duration
- Team continuity
- Long-term player retention

In a business context, this is similar to analyzing employee tenure, customer lifecycle duration, or contract history.

---

## Query A — Age at Debut, Age at Final Game, and Career Length

### Question

For each player, calculate their age at their first game, age at final game, and career length.

### SQL Technique Used

- Date construction with `MAKE_DATE`
- Date difference with `AGE`
- `EXTRACT(YEAR FROM ...)`
- Filtering incomplete date records
- Sorting by career length

### Logic

The query creates a birthdate from `birthyear`, `birthmonth`, and `birthday`.

It then compares the birthdate against:

- `debut`
- `finalgame`

The query calculates:

- Age at debut
- Age at final game
- Career length in years

### Why This Matters

This transforms raw date fields into meaningful career metrics.

Instead of simply listing debut and final game dates, the query produces analytical features that can be used for comparison.

---

## Query B — Starting and Ending Team

### Question

What team did each player play on during their starting and ending years?

### SQL Technique Used

- CTEs
- Date extraction
- Left joins
- `STRING_AGG`
- Player-year matching

### Logic

The query extracts each player's starting year from `debut` and ending year from `finalgame`.

It then joins to the `salaries` table to find the team associated with each player in those years.

If a player has multiple teams in the same year, `STRING_AGG()` combines them into one readable field.

### Why This Matters

This adds team context to each player's career timeline.

It allows analysis of whether players remained with the same organization or moved between teams over time.

---

## Query C — Same Start and End Team with Over 10-Year Career

### Question

How many players started and ended on the same team and also played for over a decade?

### SQL Technique Used

- CTEs
- Career span calculation
- Conditional filtering
- Team comparison
- Aggregated count

### Logic

The query builds on the previous start/end team logic.

It calculates career span as:

`ending_year - starting_year`

Then it filters to players where:

- Starting team is not null
- Ending team is not null
- Starting team equals ending team
- Career span is greater than 10 years

The final output returns the count of players who meet all conditions.

### Why This Matters

This query identifies long-term team continuity.

In sports terms, these are players who had long careers and appear to have started and ended with the same team.

In business terms, this is similar to identifying long-tenure employees or loyal customers who remained with the same organization over time.

---

## Important Assumptions

- The `salaries` table is used as the available source for team-year information.
- Some players may not have matching salary records for their debut or final year.
- Players with multiple teams in a year are represented using comma-separated team IDs.
- Career length is calculated in full years using PostgreSQL date logic.

---

## Key SQL Skills Demonstrated

- Date construction
- Date arithmetic
- CTE-based query design
- Left joins
- String aggregation
- Conditional filtering
- Career lifecycle analysis

---

## Portfolio Value

This case shows how SQL can be used to create lifecycle metrics from raw date fields.

It is especially useful for demonstrating analytical thinking because the query moves from basic player information to higher-level career insights.

The same pattern could be applied to:

- Employee tenure analysis
- Customer retention analysis
- Subscription lifecycle tracking
- Contract start/end analysis