[Type of Triangle | HackerRank](https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=false)

#주어진 세 변의 길이를 보고 어떤 삼각형인지 판별하는 문제이다

```sql
SELECT 
    CASE
        WHEN (t.A + t.B <= t.C) OR (t.A + t.C <= t.B) OR (t.C + t.B <= t.A) THEN "Not A Triangle"
        WHEN t.A = t.B AND t.B = t.C THEN "Equilateral"
        WHEN (t.A = t.B AND t.B != t.C) OR (t.A = t.C AND t.A != t.B) 
            OR (t.C = t.B AND t.B != t.A) THEN "Isosceles"
        ELSE "Scalene" END type_of_triangle
FROM triangles t
```

#우선 삼각형의 조건을 만족하지 못하는 경우는 not a triangle로 먼저 분류해주고 그다음 세변의 길이가 같은 경우는 equilateral로 두변의 길이만 같은 경우는 isosceles로 그것도 아니면 그외는 세변의 길이가 모두 다른 삼각형인 경우이기 때문에 scalene으로 분류해주었다
