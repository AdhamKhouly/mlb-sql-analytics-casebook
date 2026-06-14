# 02 — Team Salary Spending Results

## Overview

This file documents the outputs from:

`queries/02_team_salary_spending_analysis.sql`

This analysis explores MLB team salary spending using the Lahman salary data.

The analysis answers:

1. Which teams appear among the highest salary spenders?
2. How does each team's cumulative payroll change over time?
3. When did each team first surpass $1 billion in cumulative spending?

---

## A) Highest Salary Spending Teams

### Result Sample

| Year | Team ID | Average Annual Spending |
| ---: | ------- | ----------------------: |
| 2013 | NYA     |             231,978,886 |
| 2013 | LAN     |             223,362,196 |
| 2014 | LAN     |             217,014,600 |
| 2005 | NYA     |             208,306,817 |
| 2008 | NYA     |             207,896,789 |
| 2010 | NYA     |             206,333,389 |
| 2011 | NYA     |             202,275,028 |
| 2009 | NYA     |             201,449,189 |
| 2014 | NYA     |             197,543,907 |
| 2012 | NYA     |             196,522,289 |
| 2006 | NYA     |             194,663,079 |
| 2007 | NYA     |             189,259,045 |
| 2004 | NYA     |             184,193,950 |
| 2014 | PHI     |             180,944,967 |
| 2012 | PHI     |             174,538,938 |
| 2012 | BOS     |             173,186,617 |
| 2011 | PHI     |             172,976,379 |
| 2013 | PHI     |             169,863,189 |
| 2010 | BOS     |             162,447,333 |
| 2011 | BOS     |             161,762,475 |

### Interpretation

The highest payroll records are dominated by large-market teams, especially the New York Yankees.

The Yankees appear repeatedly near the top across the 2000s and early 2010s, with their 2013 payroll ranking first in this output at 231,978,886.

The Los Angeles Dodgers also appear very strongly, especially in 2013 and 2014. The Philadelphia Phillies and Boston Red Sox also appear multiple times in the highest-spending group.

### Key Takeaway

The salary data shows that high payroll spending was concentrated among a small group of teams, with the Yankees standing out as the most frequent top spender in the sample.

---

## B) Cumulative Spending by Team Over Time

### Result Sample

| Year | Team ID | Annual Spending | Cumulative Spending |
| ---: | ------- | --------------: | ------------------: |
| 1997 | ANA     |      31,135,472 |          31,135,472 |
| 1998 | ANA     |      41,281,000 |          72,416,472 |
| 1999 | ANA     |      55,388,166 |         127,804,638 |
| 2000 | ANA     |      51,464,167 |         179,268,805 |
| 2001 | ANA     |      47,535,167 |         226,803,972 |
| 2002 | ANA     |      61,721,667 |         288,525,639 |
| 2003 | ANA     |      79,031,667 |         367,557,306 |
| 2004 | ANA     |     100,534,667 |         468,091,973 |
| 1998 | ARI     |      32,347,000 |          32,347,000 |
| 1999 | ARI     |      68,703,999 |         101,050,999 |
| 2000 | ARI     |      81,027,833 |         182,078,832 |
| 2001 | ARI     |      85,082,999 |         267,161,831 |
| 2002 | ARI     |     102,819,999 |         369,981,830 |
| 2003 | ARI     |      80,657,000 |         450,638,830 |
| 2004 | ARI     |      69,780,750 |         520,419,580 |
| 2005 | ARI     |      62,329,166 |         582,748,746 |
| 2006 | ARI     |      59,684,226 |         642,432,972 |
| 2007 | ARI     |      52,067,546 |         694,500,518 |
| 2008 | ARI     |      66,202,712 |         760,703,230 |

### Interpretation

The cumulative spending output shows each team's payroll building year by year.

For Anaheim, cumulative spending increased from 31,135,472 in 1997 to 468,091,973 by 2004.

For Arizona, cumulative spending increased from 32,347,000 in 1998 to 760,703,230 by 2008.

This type of result is useful because it shows long-term payroll accumulation rather than only single-season spending.

### Key Takeaway

Cumulative payroll makes long-term team investment easier to compare. It shows not only how much a team spent in a given year, but how quickly its total salary commitments accumulated over time.

---

## C) First Year Each Team Surpassed $1 Billion in Cumulative Spending

### Result Table

| Team ID | First Year Surpassed $1B |
| ------- | -----------------------: |
| NYA     |                     2003 |
| BOS     |                     2004 |
| LAN     |                     2005 |
| ATL     |                     2005 |
| NYN     |                     2005 |
| SEA     |                     2007 |
| BAL     |                     2007 |
| CHN     |                     2007 |
| TEX     |                     2007 |
| SLN     |                     2007 |
| SFN     |                     2007 |
| TOR     |                     2008 |
| CHA     |                     2008 |
| HOU     |                     2008 |
| PHI     |                     2008 |
| DET     |                     2009 |
| CLE     |                     2009 |
| CIN     |                     2010 |
| MIN     |                     2011 |

### Interpretation

The Yankees were the first team in this output to surpass $1 billion in cumulative recorded salary spending, reaching the milestone in 2003.

The Red Sox followed in 2004. The Dodgers, Braves, and Mets crossed the same threshold in 2005.

A larger group of teams crossed the milestone between 2007 and 2008, showing how payroll growth became more widespread across the league over time.

### Key Takeaway

The earliest teams to surpass $1 billion in cumulative spending were major high-payroll franchises, especially the Yankees, Red Sox, Dodgers, Braves, and Mets.

---

## Final Takeaway

This analysis shows how SQL can be used to move from annual salary records to more meaningful financial reporting.

The results highlight three important patterns:

1. High spending was concentrated among a relatively small group of teams.
2. Cumulative payroll provides a clearer view of long-term salary investment.
3. The Yankees crossed the $1 billion cumulative spending threshold earlier than every other team in the output.

From a SQL perspective, this analysis demonstrates aggregation, window functions, cumulative sums, ordering, and threshold-based milestone analysis.
