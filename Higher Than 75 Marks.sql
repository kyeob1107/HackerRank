[Higher Than 75 Marks | HackerRank](https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=false)

75점 보다 높은 학생들의 이름을 출력하는데 이름 끝 세글자로 오름차순정렬하고 만약 같은 게 있을 경우 id로 추가적으로 오름차순 정렬해주는 문제이다.

```sql
SELECT s.name
FROM students s
WHERE s.marks >75
ORDER BY SUBSTR(s.name,-3),s.id;
```
