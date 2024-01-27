[Weather Observation Station 10 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-10/problem?isFullScreen=false)

끝 글자가 모음으로 끝나지 않는 모든 도시의 이름을 중복없이 출력하는 문제이다

```sql
SELECT DISTINCT s.city
FROM station s
WHERE SUBSTR(s.city,-1,1) NOT IN ('a', 'e', 'i', 'o', 'u')
```

계속 큰 의미없이 조금씩 바꾸다보니 이젠 다음 문제가 뭐일지 예상될 정도이다.. 언제까지 반복이 될지 모르겠다..
