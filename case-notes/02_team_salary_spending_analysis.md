# 02 — Team Salary Spending Analysis

## Case Objective

This analysis explores MLB team payroll behavior using salary data from the Lahman Baseball Database.

The goal is to answer three questions:

1. Which teams rank in the top 20% for average annual spending?
2. How much has each team spent cumulatively over time?
3. In which year did each team first surpass $1 billion in cumulative spending?

This case focuses on payroll trends, team-level spending behavior, and long-term financial accumulation.

---

## Tables Used

| Table | Purpose |
|---|---|
| `salaries` | Contains player salary records by year, team, league, and player |

---

## Business Framing

From a business analytics perspective, salary data can be used to understand:

- Which teams consistently spend more than others
- How payroll has evolved over time
- Which teams reached major spending milestones earliest
- How long-term spending differs across franchises

This type of analysis is similar to financial reporting, budget tracking, and cumulative revenue or expense analysis in a business setting.

---

## Query A — Top 20% of Teams by Average Annual Spending

### Question

Return the top 20% of teams in terms of average annual spending.

### SQL Technique Used

- Aggregation by team and year
- Average calculation
- `NTILE(5)` window function
- Ranking into spending quintiles

### Logic

The query first calculates total annual payroll for each team by summing all player salaries within each `teamid` and `yearid`.

Then it calculates each team's average annual spending across all available seasons.

Finally, `NTILE(5)` splits teams into five groups based on average annual spending. The first quintile represents the top 20%.

### Why This Matters

This query identifies teams with the highest average payroll behavior over the available salary years.

It avoids ranking individual team-year totals only and instead evaluates team spending at the franchise level.

---

## Query B — Cumulative Spending by Team Over Time

### Question

For each team, show the cumulative sum of spending over the years.

### SQL Technique Used

- Aggregation
- Window function
- `SUM() OVER`
- `PARTITION BY`
- Ordered cumulative total

### Logic

The query first calculates annual spending per team.

Then it uses a window function to calculate a running cumulative total for each team ordered by year.

Each row shows:

- Team
- Year
- Annual spending
- Total cumulative spending up to that year

### Why This Matters

Cumulative spending is useful for understanding long-term financial investment.

This mirrors real-world business reporting where analysts track cumulative revenue, cost, investment, or budget usage over time.

---

## Query C — First Year Each Team Surpassed $1 Billion

### Question

Return the first year that each team's cumulative spending surpassed $1 billion.

### SQL Technique Used

- CTEs
- Window function
- Cumulative sum
- Threshold filtering
- `MIN(yearid)`

### Logic

The query calculates annual spending, then cumulative spending by team.

After cumulative totals are calculated, the query filters to rows where cumulative spending is greater than $1 billion.

The first year is identified using `MIN(yearid)`.

### Why This Matters

This turns a running total into a milestone analysis.

Instead of only showing spending values, the query identifies when each team crossed a major financial threshold.

---

## Important Assumptions

- Salary values are nominal and not adjusted for inflation.
- The analysis depends on the years available in the `salaries` table.
- Team IDs are treated as the team-level grouping key.
- Payroll totals are calculated using available player salary records only.

---

## Key SQL Skills Demonstrated

- Multi-step CTE logic
- Aggregation at different levels
- Window functions
- Running totals
- Ranking with `NTILE`
- Threshold analysis
- Financial-style SQL reporting

---

## Portfolio Value

This case is one of the strongest in the project because it connects SQL directly to business analytics.

The same logic could be used for:

- Customer spending analysis
- Department budget tracking
- Revenue accumulation
- Cost monitoring
- Financial milestone reporting

It demonstrates that SQL can be used not just to retrieve data, but to build structured analytical reports.