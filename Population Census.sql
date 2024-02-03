[Population Census  | HackerRank](https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=false)

city 테이블과 country 테이블을 이용하여 대륙이 아시아인 모든 도시의 인구의 합을 구하는 문제이다.

```sql
SELECT 
    SUM(ci.population)
FROM 
    city ci
LEFT JOIN
    country co ON ci.countrycode = co.code
WHERE 
    co.continent = 'Asia'
```
