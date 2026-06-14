# 04 — Player Attribute Comparison

## Case Objective

This analysis compares MLB player attributes and tracks how physical characteristics changed over time.

The goal is to answer three questions:

1. Which players share the same birthday?
2. For each team, what percentage of players bat right, left, or both?
3. How have average height and weight at debut changed by decade?

This case focuses on player comparison, team-level attribute distribution, and long-term physical trends.

---

## Tables Used

| Table | Purpose |
|---|---|
| `players` | Contains player birth dates, physical attributes, batting side, and debut dates |
| `salaries` | Used to connect players to teams |

---

## Business Framing

Player attributes can be analyzed in the same way businesses analyze customer, employee, or user characteristics.

This type of analysis helps answer questions such as:

- Are certain attributes more common within specific groups?
- How do group-level distributions differ?
- How have characteristics changed over time?
- Are there long-term trends in the population?

In this case, the population is MLB players.

---

## Query A — Players with the Same Birthday

### Question

Which players have the same birthday?

### SQL Technique Used

- Self join
- Date construction with `MAKE_DATE`
- Duplicate pair prevention
- Null filtering

### Logic

The query first creates valid birthdates from `birthyear`, `birthmonth`, and `birthday`.

Then it joins the player table to itself on the exact same birthdate.

The condition `p1.playerid < p2.playerid` prevents duplicate mirrored pairs.

For example, it avoids returning both:

- Player A / Player B
- Player B / Player A

### Why This Matters

This is a clean example of using a self join to compare records within the same table.

Self joins are useful when looking for duplicates, relationships, similarities, or pairwise comparisons.

---

## Query B — Batting-Side Percentages by Team

### Question

For each team, what percent of players bat right, left, and both?

### SQL Technique Used

- Distinct player-team pairs
- Conditional aggregation
- `FILTER`
- Percentage calculation
- `NULLIF` to prevent division by zero

### Logic

The query first creates a distinct list of player-team combinations from the `salaries` table.

This prevents the same player from being counted multiple times for the same team.

Then it joins to the `players` table to access the `bats` field.

The query calculates:

- Number of right-handed batters
- Number of left-handed batters
- Number of switch hitters
- Percentage of each group by team

### Why This Matters

This creates a team-level profile of batting-side distribution.

It shows how individual player attributes can be aggregated into group-level insights.

This is similar to demographic or segmentation analysis in business analytics.

---

## Query C — Height and Weight Trends by Debut Decade

### Question

How have average height and weight at debut changed by decade?

### SQL Technique Used

- Date extraction
- Decade grouping
- Aggregation
- `LAG`
- Decade-over-decade difference calculation

### Logic

The query extracts each player's debut year and converts it into a debut decade.

Then it calculates average height and average weight for each debut decade.

Finally, the `LAG()` window function compares each decade to the previous decade.

The output includes:

- Debut decade
- Number of players in that decade
- Average height
- Height change from previous decade
- Average weight
- Weight change from previous decade

### Why This Matters

This query turns static player attributes into a historical trend analysis.

Instead of only reporting average height and weight, it shows how those averages changed over time.

---

## Important Assumptions

- Height and weight are analyzed only for players with non-null values.
- Batting-side percentages are based on players connected to teams through the `salaries` table.
- Players are counted once per team in the batting-side analysis.
- Decades are based on debut year, not birth year.
- Height and weight are not adjusted for position or role.

---

## Key SQL Skills Demonstrated

- Self joins
- Date construction
- Conditional aggregation
- Percentage calculations
- Distinct deduplication
- Window functions
- `LAG`
- Trend analysis by decade

---

## Portfolio Value

This case demonstrates how SQL can be used for comparison and segmentation analysis.

It includes multiple valuable analytical patterns:

- Pairwise matching
- Attribute distribution
- Group-level percentages
- Historical trend reporting
- Period-over-period comparison

These techniques are directly transferable to business analytics projects involving customers, employees, products, or transactions.