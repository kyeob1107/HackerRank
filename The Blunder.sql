[The Blunder | HackerRank](https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=false)

정상 월급 평균과 숫자에서 0을 없앤 이상 월급 평균의 차를 구한 다음 올림하는 문제이다.

```sql
SELECT 
    CEIL(AVG(e.salary)-AVG(REGEXP_REPLACE(e.salary,'[0]','')))
FROM 
    employees e
```

쿼리에 대해 간단히 쓰면 각 월급 평균을 구하는데 뒤의 항은 정규표현식을 이용한 replace로 0을 공백으로 바꾸는 즉 0을 제거하는 함수를 의미한다 그런뒤 평균을 구해서 두개의 차를 구해주는데, ceil를 이용하여 올림하는 쿼리이다.
