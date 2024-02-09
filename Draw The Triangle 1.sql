[Draw The Triangle 1 | HackerRank](https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=false)

P(n)이라고 하면  ‘* ‘를 n개부터 시작하여 1개까지 표시해서 행으로 이어서 패턴 그리는 것을 의미한다고 하면 P(20)를 그리는 문제였다

```sql
WITH RECURSIVE cte AS (
    SELECT 20 AS n
    UNION ALL
    SELECT n - 1 FROM cte WHERE n > 1
)
SELECT REPEAT('* ',n) FROM cte
```

재귀를 사용하여 20부터 시작해서 1까지(n>1일때까지 n-1하니 1이 되면 더이상 n-1하지 않아서) 모든 결과 행 하나로 합치는 재귀의 형태이다

그런뒤 * 를 n번 반복하여 적도록 하기 위해 repeat를 사용했다
