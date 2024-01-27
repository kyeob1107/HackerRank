[Weather Observation Station 11 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-11/problem?isFullScreen=false)

첫 글자가 모음으로 시작하지않거나 끝글자가 모음으로 끝나지 않는 모든 도시의 이름을 중복없이 출력하는 문제이다.

```sql
SELECT DISTINCT s.city
FROM station s
WHERE SUBSTR(s.city,1,1) NOT IN ('a', 'e', 'i', 'o', 'u')
    OR SUBSTR(s.city,-1,1) NOT IN ('a', 'e', 'i', 'o', 'u')
```
