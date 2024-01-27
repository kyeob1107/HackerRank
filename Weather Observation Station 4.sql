#[Weather Observation Station 4 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-4/problem?isFullScreen=false)

전체 데이터의 city행의 수와 중복되지 않는 도시의 종류 수의 차를 구하는 문제이다

```sql
/*
Enter your query here.
*/
SELECT COUNT(s.city)-COUNT(DISTINCT s.city)
FROM station s
```
