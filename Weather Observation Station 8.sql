[Weather Observation Station 8 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-8/problem?isFullScreen=false)

도시이름의 첫글자와 끝글자가 모음인 모든 도시를 중복없이 출력하는 문제이다

```sql
SELECT DISTINCT s.city
FROM station s
WHERE SUBSTR(s.city,1,1) IN ('a', 'e', 'i', 'o', 'u')
    AND SUBSTR(s.city,-1,1) IN ('a', 'e', 'i', 'o', 'u')
```

이전 문제들과 거의 동일하게 and로 합친 쿼리라 생각하면 될듯하다
