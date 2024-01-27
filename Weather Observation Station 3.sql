#[Weather Observation Station 3 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-3/problem?isFullScreen=false)

아이디가 짝수인 모든 도시이름을 중복되지 않게 출력하는 문제이다

```sql
/*
Enter your query here.
*/
SELECT DISTINCT s.city
FROM station s
WHERE s.id%2 = 0
```
