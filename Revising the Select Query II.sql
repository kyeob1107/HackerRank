#https://www.hackerrank.com/challenges/revising-the-select-query-2/problem?isFullScreen=false
인구가 12만보다 많은 미국의 도시 이름을 출력하는 문제이다

```sql
SELECT c.name
FROM city c
WHERE c.countrycode = 'USA'
    AND c.population > 120000
```
