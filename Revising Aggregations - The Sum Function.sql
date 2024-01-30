[Revising Aggregations - The Sum Function | HackerRank](https://www.hackerrank.com/challenges/revising-aggregations-sum/problem?isFullScreen=false)

지역구가 캘리포니아인 CITY의 모든 도시의 총인구를 조회하는 문제이다

```sql
SELECT SUM(c.population)
FROM city c
WHERE c.district = 'California'
```
