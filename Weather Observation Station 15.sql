[Weather Observation Station 15 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-15/problem?isFullScreen=false)

137.2345보다 작은 것 중에서 가장 큰 LAT_N를 가지고 있는 것의 LONG_W을 조회하는 문제이다. 답은 소수점 4자리이하로 반올림한다.

```sql
SELECT 
    ROUND(s.long_w,4)
FROM 
    station s
WHERE 
    s.lat_n = (SELECT MAX(s2.lat_n) FROM station s2 WHERE s2.lat_n < 137.2345)
```
