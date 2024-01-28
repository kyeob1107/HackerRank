[Employee Salaries | HackerRank](https://www.hackerrank.com/challenges/salary-of-employees/problem?isFullScreen=false)

10개월 미만의 직원인 월급이 2000 이상인 직원의 직원 이름 목록을 출력하는 문제이며, 결과를 오름차순으로 정렬하는 문제이다.

```sql
SELECT e.name
FROM employee e
WHERE e.salary >2000 AND e.months <10
ORDER BY e.employee_id;
```
