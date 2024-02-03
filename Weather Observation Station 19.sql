[Weather Observation Station 19 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=false)

앞의 문제와 거리 구하는 것은 동일한데 피타고라스의 공식 사용해서 구하는 방식인 유클리안 거리를 구하는 문제이다.

```sql
SELECT 
    ROUND(SQRT(POW(MAX(s.lat_n)-MIN(s.lat_n),2)+POW(MAX(s.long_w)-MIN(s.long_w),2)),4)
FROM 
    station s
```
