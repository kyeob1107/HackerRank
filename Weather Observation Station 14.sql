[Weather Observation Station 14 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-14/problem?isFullScreen=false)

STATION에서 137.2345보다 작은 값을 가진 북위(LAT_N)중 가장 큰값을 조회하는 문제이다. 이때 답을 소수점 4자리로 자른다.

```sql
SELECT 
    TRUNCATE(MAX(s.lat_n),4)
FROM 
    station s
WHERE 
    s.lat_n < 137.2345
```
