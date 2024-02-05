[Weather Observation Station 20 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true)

lat_n의 중위값(median)을 구하는 문제이다

```sql
SELECT 
    ROUND(p.lat_n,4)
FROM 
    (SELECT 
        s.lat_n, 
        PERCENT_RANK() OVER(ORDER BY s.lat_n) per
     FROM 
        station s) p
WHERE 
    p.per = 0.5
```
