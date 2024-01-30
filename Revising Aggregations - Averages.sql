[Revising Aggregations - Averages | HackerRank](https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem?isFullScreen=false)

지역구가 캘리포니아인 CITY의 모든 도시의 평균 인구를 조회하는 문제이다

```sql
SELECT AVG(c.population)
FROM city c
WHERE c.district = 'California'
```
