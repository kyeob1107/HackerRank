[Population Density Difference | HackerRank](https://www.hackerrank.com/challenges/population-density-difference/problem?isFullScreen=false)

모든 도시중 가장 인구가 많은 도시의 인구와 가장 적은 도시의 인구의 차이를 구하는 문제이다

```sql
SELECT MAX(c.population)-MIN(c.population)
FROM city c
```
