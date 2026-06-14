# 03 — Player Career Results

## Overview

This file documents the outputs from:

`queries/03_player_career_analysis.sql`

This analysis explores MLB player career timelines using the Lahman player and salary data.

The analysis answers:

1. How old was each player at their first and last MLB game?
2. How long was each player's career?
3. What team did each player play on during their starting and ending years?
4. How many players started and ended on the same team while also playing for over a decade?

---

## A) Player Age at First Game, Last Game, and Career Length

### Result Sample

| Player Name             | Birth Year | First Game Year | Final Game Year | Age at First Game | Age at Last Game | Career Length |
| ----------------------- | ---------: | --------------: | --------------: | ----------------: | ---------------: | ------------: |
| Nicholas                |       1876 |            1898 |            1933 |                21 |               57 |            35 |
| James Henry             |       1850 |            1872 |            1904 |                21 |               54 |            32 |
| Saturnino Orestes Armas |       1925 |            1949 |            1980 |                23 |               54 |            31 |
| Charles Timothy         |       1875 |            1904 |            1934 |                28 |               58 |            30 |
| Walter Arlington        |       1860 |            1880 |            1909 |                20 |               49 |            29 |
| Hugh Ambrose            |       1869 |            1891 |            1918 |                22 |               49 |            27 |
| Charles Evard           |       1882 |            1904 |            1931 |                21 |               48 |            27 |
| John Joseph             |       1881 |            1902 |            1929 |                21 |               48 |            27 |
| Lynn Nolan              |       1947 |            1966 |            1993 |                19 |               46 |            27 |
| James Thomas            |       1863 |            1884 |            1912 |                20 |               48 |            27 |
| Adrian Constantine      |       1852 |            1871 |            1897 |                19 |               45 |            26 |
| Jamie                   |       1962 |            1986 |            2012 |                23 |               49 |            25 |
| Julio Cesar             |       1958 |            1982 |            2007 |                23 |               49 |            25 |
| Thomas Edward           |       1943 |            1963 |            1989 |                20 |               46 |            25 |
| Dennis Joseph           |       1858 |            1879 |            1904 |                21 |               46 |            25 |
| Rickey Nelson Henley    |       1958 |            1979 |            2003 |                20 |               44 |            24 |
| Louis Norman            |       1907 |            1929 |            1953 |                22 |               46 |            24 |
| John Picus              |       1883 |            1909 |            1933 |                25 |               50 |            24 |
| Early                   |       1920 |            1939 |            1963 |                19 |               43 |            24 |
| William J.              |       1866 |            1888 |            1912 |                21 |               45 |            24 |

### Interpretation

The output ranks players by career length from longest to shortest.

The longest career in the sample belongs to Nicholas, who played across 35 years, from 1898 to 1933. Several other players also had careers lasting more than 25 years, which makes them clear outliers in terms of longevity.

This query transforms raw debut and final game dates into more meaningful career metrics:

* Age at first game
* Age at last game
* Total career length

### Key Takeaway

The longest MLB careers in this output span multiple decades, with the top players remaining active for 24 to 35 years.

---

## B) Starting and Ending Team

### Result Sample

| Player Name       | Starting Year | Ending Year | Starting Team | Ending Team |
| ----------------- | ------------: | ----------: | ------------- | ----------- |
| Anthony Scott     |          1997 |        1999 | FLO           | TBA         |
| Jeffrey Charles   |          1996 |        2004 | ML4           | CLE         |
| Joseph Ronald     |          2001 |        2014 | PIT           | SEA         |
| Vincent Maurice   |          1985 |        1997 | SLN           | DET         |
| Scott Gerald      |          1993 |        1999 | SDN           | CHN         |
| Larry Dewayne     |          2000 |        2013 | TOR           | CHA         |
| Jason David       |          1995 |        2009 | ATL           | LAN         |
| Masahide          |          2008 |        2009 | CLE           | CLE         |
| Kent McKay        |          1989 |        1990 | CAL           | CAL         |
| Brady Kevin       |          1988 |        2002 | BOS           | CLE         |
| Alex              |          1995 |        2002 | NYN           | MIL         |
| Joseph Melton     |          1989 |        2001 | CIN           | NYA         |
| Yasiel            |          2013 |        2014 | LAN           | LAN         |
| Daniel Donovan    |          1996 |        1999 | MIN           | NYA         |
| Kevin Charles     |          1998 |        2009 | FLO           | TOR         |
| Dax Xenos         |          1996 |        1996 | SFN           | SFN         |
| Jerry Scott       |          1990 |        1990 | CHA           | CHA         |
| Alejandro Alberto |          2007 |        2014 | FLO           | CHA         |
| Brad William      |          1995 |        2006 | MIN           | MIN         |

### Interpretation

This output compares each player's starting and ending team based on the salary records available for their debut and final years.

Some players started and ended with the same team, such as:

| Player Name  | Starting Team | Ending Team |
| ------------ | ------------- | ----------- |
| Masahide     | CLE           | CLE         |
| Kent McKay   | CAL           | CAL         |
| Yasiel       | LAN           | LAN         |
| Dax Xenos    | SFN           | SFN         |
| Jerry Scott  | CHA           | CHA         |
| Brad William | MIN           | MIN         |

Other players ended with a different team than the one they started with, showing career movement across teams.

### Key Takeaway

The start/end team comparison gives a quick view of player movement and team continuity across a career.

---

## C) Players Who Started and Ended on the Same Team and Played Over a Decade

### Result Table

| Metric                                                                      | Value |
| --------------------------------------------------------------------------- | ----: |
| Players who started and ended on the same team and played for over a decade |    19 |

### Interpretation

The query found 19 players who met both conditions:

1. Their starting team matched their ending team.
2. Their career length was greater than 10 years.

This represents a specific type of career continuity: players with long careers who also appear to have started and ended with the same team.

### Key Takeaway

Only 19 players in this output started and ended on the same team while also playing for more than a decade, making this a relatively selective career-continuity group.

---

## Final Takeaway

This analysis shows how SQL can transform player biography and salary records into career lifecycle insights.

The results highlight three useful patterns:

1. Some players had exceptionally long MLB careers, lasting more than 25 years.
2. Many players ended their careers with different teams than the ones they started with.
3. A small group of players combined long career length with same-team start/end continuity.

From a SQL perspective, this analysis demonstrates date calculations, CTEs, joins, career-span logic, and conditional aggregation.
