[Weather Observation Station 17 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-17/problem?isFullScreen=false)

38.7780보다 큰 것중 가장 작은 lat_n의 좌표를 가진 것의 long_w를 소수 4째자리까지 표시하여 반올림하는 문제이다.

```sql
SELECT 
    ROUND(s.long_w,4)
FROM 
    station s
WHERE 
    s.lat_n = (SELECT MIN(s2.lat_n) FROM station s2 WHERE s2.lat_n > 38.7880)
```
