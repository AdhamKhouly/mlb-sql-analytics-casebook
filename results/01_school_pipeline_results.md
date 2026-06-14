# 01 — School Pipeline Results

## Overview

This file documents the outputs from:

`queries/01_school_pipeline_analysis.sql`

This analysis explores the historical school pipeline behind MLB players using the Lahman Baseball Database.

The analysis answers:

1. In each decade, how many players were produced by schools in the dataset?
2. Which schools produced the most MLB players overall?
3. Which schools were the top producers in each decade?

---

## A) MLB Player Production by Decade

### Result Table

| Decade    | Total Number of Players |
| --------- | ----------------------: |
| 1864-1873 |                      19 |
| 1874-1883 |                      63 |
| 1884-1893 |                     178 |
| 1894-1903 |                     521 |
| 1904-1913 |                     841 |
| 1914-1923 |                     981 |
| 1924-1933 |                     813 |
| 1934-1943 |                     696 |
| 1944-1953 |                     480 |
| 1954-1963 |                     729 |
| 1964-1973 |                   1,533 |
| 1974-1983 |                   2,591 |
| 1984-1993 |                   3,275 |
| 1994-2003 |                   3,030 |
| 2004-2013 |                   1,594 |
| 2014-2023 |                       1 |

### Interpretation

The number of school-linked MLB players increased substantially over time, especially from the 1960s onward.

The strongest decades in the output are:

| Rank | Decade    | Total Number of Players |
| ---: | --------- | ----------------------: |
|    1 | 1984-1993 |                   3,275 |
|    2 | 1994-2003 |                   3,030 |
|    3 | 1974-1983 |                   2,591 |

This suggests that the recorded school pipeline became much larger during the modern era of the dataset.

### Key Takeaway

MLB player production through schools appears to grow sharply from the 1960s onward, peaking between the 1970s and early 2000s.

---

## B) Top 5 Schools That Produced the Most MLB Players

### Result Table

| Rank | University                        | Number of Players |
| ---: | --------------------------------- | ----------------: |
|    1 | University of Texas at Austin     |               107 |
|    2 | University of Southern California |               105 |
|    3 | Arizona State University          |               101 |
|    4 | Stanford University               |                86 |
|    5 | University of Michigan            |                76 |

### Interpretation

The top five schools show that MLB player production is not evenly distributed across institutions.

The University of Texas at Austin, University of Southern California, and Arizona State University form a clear leading group, with each school producing more than 100 MLB players in the dataset.

Stanford University and the University of Michigan also stand out as major long-term contributors to the MLB player pipeline.

### Key Takeaway

A small group of universities acted as especially strong MLB talent pipelines, with Texas, USC, and Arizona State leading the overall school production ranking.

---

## C) Top 3 Schools by Decade

### Result Table

| Decade      | First School                           | Second School                         | Third School                               |
| ----------- | -------------------------------------- | ------------------------------------- | ------------------------------------------ |
| 1864 - 1873 | Fordham University                     | Villanova University                  | University of Michigan                     |
| 1874 - 1883 | Yale University                        | Brown University                      | Cornell University                         |
| 1884 - 1893 | College of the Holy Cross              | University of Pennsylvania            | Brown University                           |
| 1894 - 1903 | Georgetown University                  | Brown University                      | Manhattan College                          |
| 1904 - 1913 | University of Notre Dame               | St. Mary's College of California      | College of the Holy Cross                  |
| 1914 - 1923 | College of the Holy Cross              | University of Alabama                 | The Ohio State University                  |
| 1924 - 1933 | College of the Holy Cross              | University of Alabama                 | University of Texas at Austin              |
| 1934 - 1943 | Duke University                        | University of Texas at Austin         | University of Illinois at Urbana-Champaign |
| 1944 - 1953 | University of Southern California      | University of Alabama                 | University of Texas at Austin              |
| 1954 - 1963 | University of Southern California      | Michigan State University             | University of Michigan                     |
| 1964 - 1973 | Arizona State University               | University of Southern California     | Stanford University                        |
| 1974 - 1983 | Arizona State University               | University of Texas at Austin         | University of Southern California          |
| 1984 - 1993 | Stanford University                    | Florida State University              | Louisiana State University                 |
| 1994 - 2003 | Stanford University                    | California State University Fullerton | Louisiana State University                 |
| 2004 - 2013 | California State University Long Beach | University of Miami                   | Arizona State University                   |
| 2014 - 2023 | Texas Christian University             | NULL                                  | NULL                                       |

### Interpretation

The top schools changed noticeably across eras.

Earlier decades were led by schools such as Fordham University, Yale University, Brown University, College of the Holy Cross, and Georgetown University.

Later decades show stronger representation from major modern college baseball programs such as:

* University of Southern California
* Arizona State University
* Stanford University
* Louisiana State University
* California State University Long Beach
* University of Miami

This suggests that MLB school pipelines shifted over time rather than remaining concentrated around the same institutions.

### Key Takeaway

The MLB school pipeline evolved across eras. Older East Coast institutions appear more prominently in early decades, while later decades show stronger representation from large modern baseball programs such as USC, Arizona State, Stanford, LSU, Long Beach, and Miami.

---

## Final Takeaway

This analysis shows that school-based MLB player production changed significantly over time.

The results suggest three main insights:

1. School-linked MLB player production increased sharply in the modern era.
2. A small group of universities produced a disproportionately high number of MLB players.
3. The top school pipelines shifted across decades, reflecting changes in the broader baseball development landscape.

From a SQL perspective, this analysis demonstrates decade bucketing, aggregation, ranking, window functions, and lookup-table joins in a clean analytical workflow.
