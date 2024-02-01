[Top Earners | HackerRank](https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=false)

한 직원의 총 수입은 월급*달수 로 구하는데, 가장 큰 총수입 금액과 그 금액을 받는 직원수를 구하는 문제이다

```sql
WITH total_earning AS (
    SELECT 
        e.employee_id,
        e.name,
        e.salary * e.months tot_earn
    FROM 
        employee e
)
SELECT 
    count(*)
FROM 
    total_earning te
WHERE 
    te.tot_earn = (SELECT MAX(te2.tot_earn) FROM total_earning te2);
```

```sql
ERROR 1064 (42000) at line 4: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'total_earning AS (
    SELECT 
        e.employee_id,
        e.name,
        e.' at line 1
#라고 에러가 떳다
```

결국 with안쓰고 서브쿼리 써서 해결하였다

```sql
SELECT 
    MAX(te.tot_earn),
    count(*)
FROM 
    (SELECT 
        e.employee_id,
        e.name,
        e.salary * e.months tot_earn
    FROM 
        employee e) te
WHERE 
    te.tot_earn = (SELECT MAX(e2.salary * e2.months) FROM employee e2);
```
