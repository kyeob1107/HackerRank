#[Weather Observation Station 2 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=false)

모든 lat의 총합과 lon의 총합을 소수 둘째자리까지 반올림하여 표시하는 문제이다

```sql
/*
Enter your query here.
*/
SELECT ROUND(SUM(lat_n),2) lat, ROUND(SUM(long_w),2) lon
FROM station s
```
