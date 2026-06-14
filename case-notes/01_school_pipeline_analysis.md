# 01 — School Pipeline Analysis

## Case Objective

This analysis explores how schools contributed to the historical MLB player pipeline using the Lahman Baseball Database.

The goal is to answer three questions:

1. In each decade, how many schools produced MLB players?
2. Which schools produced the most MLB players overall?
3. For each decade, which schools were the top producers of MLB players?

This case focuses on identifying long-term talent pipeline patterns across schools and decades.

---

## Tables Used

| Table | Purpose |
|---|---|
| `schools` | Connects MLB players to schools and years attended |
| `school_details` | Provides school names, cities, states, and countries |

---

## Business Framing

From a sports analytics perspective, this type of analysis helps answer questions such as:

- Which schools have historically been strong MLB talent pipelines?
- Has the number of MLB-producing schools increased over time?
- Do certain schools dominate specific eras?
- How has the player development landscape changed by decade?

Instead of only counting players, the analysis looks at both school-level and decade-level production.

---

## Query A — Schools Producing MLB Players by Decade

### Question

In each decade, how many schools produced MLB players?

### SQL Technique Used

- Recursive CTE
- Decade generation
- `COUNT(DISTINCT schoolid)`
- `COUNT(DISTINCT playerid)`
- Left join between generated decades and school records

### Logic

The query first finds the earliest and latest years available in the `schools` table. It then dynamically generates decade buckets using a recursive CTE.

Each school record is assigned to a decade based on `yearid`.

The final output counts:

- The number of distinct schools that produced players in each decade
- The number of distinct players connected to those schools in each decade

### Why This Matters

This shows whether the MLB player pipeline became more concentrated or more distributed over time.

If the number of schools increases over decades, it may suggest that MLB talent sourcing became more geographically and institutionally diverse.

---

## Query B — Top 5 Schools Overall

### Question

What are the top 5 schools that produced the most MLB players?

### SQL Technique Used

- Aggregation
- `COUNT(DISTINCT playerid)`
- Join to school metadata
- Ranking by total players produced

### Logic

The query groups the `schools` table by `schoolid` and counts the number of unique players connected to each school.

It then joins to `school_details` so the output includes readable school names and location fields.

### Why This Matters

This identifies the strongest overall MLB talent pipelines in the dataset.

For portfolio purposes, this is a clear example of turning raw relational data into a ranked business-style summary.

---

## Query C — Top 3 Schools by Decade

### Question

For each decade, what were the top 3 schools that produced the most MLB players?

### SQL Technique Used

- Recursive CTE
- Aggregation
- Window function
- `DENSE_RANK()`
- Join to school metadata

### Logic

The query generates decade buckets, counts distinct players per school within each decade, and then ranks schools inside each decade.

`DENSE_RANK()` is used so schools with the same player count receive the same rank.

The final result keeps only schools ranked in the top 3 for each decade.

### Why This Matters

This is more insightful than only looking at all-time totals.

A school may not be top 5 overall, but it may have dominated a specific era. This query captures era-specific talent pipeline strength.

---

## Key SQL Skills Demonstrated

- Recursive CTEs
- Dynamic decade generation
- Aggregation
- Distinct counting
- Window functions
- Ranking within groups
- Joining lookup/detail tables
- Translating raw data into business insights

---

## Portfolio Value

This case demonstrates the ability to analyze historical trends using SQL.

It goes beyond simple filtering and shows how SQL can be used to build reusable analytical logic for time-based reporting and ranked comparisons.

This is especially relevant for data analyst, business analyst, and sports analytics roles.