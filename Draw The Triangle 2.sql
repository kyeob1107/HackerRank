[Draw The Triangle 2 | HackerRank](https://www.hackerrank.com/challenges/draw-the-triangle-2/problem?isFullScreen=false)

1번 문제와 반대로 그리는 문제이다

```sql
WITH RECURSIVE cte AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM cte WHERE n < 20
)
SELECT REPEAT('* ',n) FROM cte
```
