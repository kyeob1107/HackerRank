[African Cities | HackerRank](https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=false)

city 테이블과 country 테이블을 이용하여 대륙이 아프리카인 모든 도시의 이름을 표시하는 문제이다.

```sql
SELECT 
    ci.name
FROM 
    city ci
LEFT JOIN
    country co ON ci.countrycode = co.code
WHERE 
    co.continent = 'Africa'
```
