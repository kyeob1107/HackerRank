[Weather Observation Station 6 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-6/problem?isFullScreen=false)

도시이름이 모음으로 시작하는 도시를 중복없이 모두 출력하는 문제이다.

```sql
SELECT DISTINCT s.city
FROM station s
WHERE SUBSTR(s.city,1,1) IN ('a', 'e', 'i', 'o', 'u')
```

첫글자를 추출해서 ()안에 있는 경우에 대해서만 출력하도록 조건을 걸어주었다
