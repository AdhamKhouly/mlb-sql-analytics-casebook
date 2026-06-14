# 04 — Player Attribute Results

## Overview

This file documents the outputs from:

`queries/04_player_attribute_comparison.sql`

This analysis compares MLB player attributes using the Lahman player and salary data.

The analysis answers:

1. Which players have the same birthday?
2. For each team, what percentage of players bat right, left, and both?
3. How have average height and weight at debut changed by decade?

---

## A) Players with the Same Birthday

### Result Sample

| Player 1        | Player 2          | Birthdate  |
| --------------- | ----------------- | ---------- |
| Robert Vavasour | Freeman           | 1845-01-31 |
| James Henry     | Frank Bernard     | 1854-05-04 |
| Charles N.      | Francis           | 1854-10-06 |
| William A.      | William Henry     | 1855-01-01 |
| William A.      | Thomas Edward     | 1855-01-01 |
| William Henry   | Thomas Edward     | 1855-01-01 |
| Louis J.        | John Joseph       | 1855-02-14 |
| David P.        | George Cresse     | 1855-08-20 |
| John Robert     | Cyrus Alban       | 1855-10-02 |
| John Parkinson  | James             | 1856-09-05 |
| Samuel R.       | George R.         | 1857-03-09 |
| Edward Nagle    | Edmund Dana       | 1857-10-24 |
| Harry Eugene    | John P.           | 1858-03-03 |
| John            | Fred J.           | 1858-04-01 |
| Dennis J.       | Lorenzo Burroughs | 1858-06-26 |
| John Nelson     | William J.        | 1858-07-15 |
| Edward T.       | George William    | 1858-07-18 |
| William J.      | Tobias Charles    | 1858-10-24 |
| Charles Anthony | Robert H.         | 1858-11-11 |

### Interpretation

The output identifies pairs of players who share the same exact birthdate.

The query uses a self join on birth year, birth month, and birth day. It also uses a player ID comparison to avoid duplicate mirrored pairs, so each player pair appears only once.

For example, multiple players in the sample share the birthdate `1855-01-01`, which creates more than one valid player pairing for the same date.

### Key Takeaway

The self-join approach is effective for identifying matching records within the same table while avoiding duplicate pair combinations.

---

## B) Batting-Side Percentages by Team

### Result Sample

| Team ID | Percent Right | Percent Left | Percent Both |
| ------- | ------------: | -----------: | -----------: |
| ANA     |       61.100% |      31.600% |       7.300% |
| ARI     |       61.700% |      30.400% |       7.900% |
| ATL     |       61.800% |      29.200% |       8.900% |
| BAL     |       61.800% |      29.600% |       8.600% |
| BOS     |       62.000% |      29.400% |       8.600% |
| CAL     |       60.600% |      29.300% |      10.100% |
| CHA     |       59.700% |      33.500% |       6.800% |
| CHN     |       63.800% |      28.500% |       7.700% |
| CIN     |       62.600% |      29.400% |       8.000% |
| CLE     |       59.600% |      29.700% |      10.800% |
| COL     |       63.700% |      27.800% |       8.500% |
| DET     |       60.800% |      28.600% |      10.600% |
| FLO     |       66.300% |      24.300% |       9.400% |
| HOU     |       62.300% |      23.900% |      13.800% |
| KCA     |       64.300% |      27.200% |       8.500% |
| LAA     |       68.200% |      16.600% |      15.200% |
| LAN     |       63.000% |      27.800% |       9.200% |
| MIA     |       64.900% |      29.900% |       5.200% |
| MIL     |       66.400% |      29.400% |       4.200% |

### Interpretation

The output summarizes batting-side distribution by team.

Across the sample, right-handed batters make up the largest share for every listed team. Most teams show right-handed batting percentages around 60% to 66%.

Left-handed batters generally make up the second-largest group, while switch hitters are usually the smallest group.

A few teams stand out:

| Team ID | Notable Pattern                                           |
| ------- | --------------------------------------------------------- |
| LAA     | Highest right-handed percentage in the sample at 68.200%  |
| LAA     | Highest switch-hitter percentage in the sample at 15.200% |
| CHA     | Highest left-handed percentage in the sample at 33.500%   |
| MIL     | Lowest switch-hitter percentage in the sample at 4.200%   |

### Key Takeaway

Right-handed batters dominate the team-level batting profiles in this sample, while switch hitters represent a much smaller share of players for most teams.

---

## C) Height and Weight Trends by Debut Decade

### Result Table

| Decade      | Average Weight | Weight Difference | Average Height | Height Difference |
| ----------- | -------------: | ----------------: | -------------: | ----------------: |
| 1871 - 1880 |         165.01 |              NULL |          68.99 |              NULL |
| 1881 - 1890 |         170.33 |              5.32 |          69.65 |              0.67 |
| 1891 - 1900 |         170.88 |              0.55 |          70.08 |              0.43 |
| 1901 - 1910 |         173.75 |              2.87 |          70.53 |              0.45 |
| 1911 - 1920 |         171.73 |             -2.01 |          70.78 |              0.25 |
| 1921 - 1930 |         173.59 |              1.85 |          70.97 |              0.18 |
| 1931 - 1940 |         179.35 |              5.76 |          71.73 |              0.76 |
| 1941 - 1950 |         182.51 |              3.16 |          72.09 |              0.36 |
| 1951 - 1960 |         184.81 |              2.30 |          72.49 |              0.40 |
| 1961 - 1970 |         186.01 |              1.20 |          72.93 |              0.44 |
| 1971 - 1980 |         185.98 |             -0.04 |          73.08 |              0.15 |
| 1981 - 1990 |         187.83 |              1.85 |          73.34 |              0.25 |
| 1991 - 2000 |         194.78 |              6.95 |          73.54 |              0.21 |
| 2001 - 2010 |         207.00 |             12.22 |          73.68 |              0.14 |
| 2011 - 2020 |         206.54 |             -0.46 |          73.60 |             -0.08 |

### Interpretation

The decade-level trend shows that MLB players became both heavier and taller over time.

Average weight increased from 165.01 pounds in 1871-1880 to 206.54 pounds in 2011-2020.

Average height increased from 68.99 inches in 1871-1880 to 73.60 inches in 2011-2020.

The largest weight jump in the output occurred between 1991-2000 and 2001-2010, when average weight increased by 12.22 pounds.

The largest height increase occurred between 1921-1930 and 1931-1940, when average height increased by 0.76 inches.

The final decade shows a slight decrease in both average weight and average height compared with the previous decade.

### Key Takeaway

MLB player body profiles changed significantly over time. The long-term trend shows players becoming taller and heavier, with especially large increases in average weight during the late twentieth and early twenty-first centuries.

---

## Final Takeaway

This analysis shows how SQL can be used for player comparison, team-level segmentation, and long-term trend analysis.

The results highlight three important patterns:

1. Self joins can identify players with matching attributes, such as shared birthdays.
2. Team-level batting profiles are mostly dominated by right-handed batters.
3. Player physical attributes changed substantially over time, especially average weight.

From a SQL perspective, this analysis demonstrates self joins, conditional aggregation, percentage calculations, recursive CTEs, decade grouping, and window functions.
