[Weather Observation Station 16 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-16/problem?isFullScreen=false)

38.7780보다 큰 것중 가장 작은 lat_n을 소수4째자리까지 표시해서 반올림하는 문제이다.

```sql
SELECT 
    ROUND(MIN(s.lat_n),4)
FROM 
    station s
WHERE 
    s.lat_n > 38.7880
```
