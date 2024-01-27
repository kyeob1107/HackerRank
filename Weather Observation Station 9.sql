[Weather Observation Station 9 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-9/problem?isFullScreen=false)

첫 글자가 모음으로 시작하지 않는 모든 도시의 이름을 중복없이 출력하는 문제이다

```sql
SELECT DISTINCT s.city
FROM station s
WHERE SUBSTR(s.city,1,1) NOT IN ('a', 'e', 'i', 'o', 'u')
```
