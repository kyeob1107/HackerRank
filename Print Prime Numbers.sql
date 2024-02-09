[Print Prime Numbers | HackerRank](https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=false)

1000이하의 소수를 모두 나타내는데 각 소수간에 &로 연결해서 표시하는 문제이다

```sql
WITH RECURSIVE numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1 FROM numbers WHERE num < 1000
)
SELECT 
    GROUP_CONCAT(n.num SEPARATOR '&')
FROM 
    numbers n
WHERE 
    n.num NOT IN (
            SELECT
                DISTINCT n2.num
            FROM 
                numbers n1
            JOIN 
                numbers n2 ON n1.num < n2.num
                AND MOD(n2.num, n1.num) = 0
            ORDER BY 
                n2.num
            );
```

우선 WITH를 통해 재귀를 사용하여 2~1000까지 행으로써 표시된 테이블을 생성해주고

그 테이블을 가져오는데 조건으로 num의 값이 서브쿼리의 목록(1열1~여러행인 테이블)에 포함되지 않는 경우에 대해서만 가져오는데 
  서브쿼리에 대해 설명하면 위에서 생성한 numbers 테이블을 n1과 n2로 2개 가져와서 n2>n1를 만족하고 
  n2를 n1으로 나눴을 때 나머지가 0인 경우에 대해서만 join해준다(1000이하에서 어떤 수의 약수인 값들을 테이블로써 출력하기 위해서) 
  그런뒤 중복없이 n2의 숫자들을 출력하는데 오름차순으로 정렬해주는 서브쿼리이다 이러한 조건을 만족하는 값들(모든 행)을 group_concat으로 합쳐주는데 구분자는 &를 사용하여 합쳐주는 쿼리이다
