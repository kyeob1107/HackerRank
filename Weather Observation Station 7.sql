[Weather Observation Station 7 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-7/problem?isFullScreen=false)

도시이름이 모음으로 끝나는 모든 도시를 중복없이 출력하는 문제이다

```sql
SELECT DISTINCT s.city
FROM station s
WHERE SUBSTR(s.city,-1,1) IN ('a', 'e', 'i', 'o', 'u')
```

이전 문제와 동일하지만 추출하는 것을 -1로 하여 끝부터 첫 글자로 하여 바꿔주었다
