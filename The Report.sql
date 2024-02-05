[The Report | HackerRank](https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=false)

grades의 내용대로 각 학생의 mark에 따라 등급을 나누고 등급순으로 내림차순, 이름으로 오름차순하는데 7등급이하인 학생은 이름을 null로 표시하는 문제이다.

미리 정렬해두고 그 테이블을 가져다 쓰는 방식으로 했을 때 쿼리이다

```sql
# How to pre-order first(미리 정렬해두고 사용하는 방식)
SELECT 
    CASE 
        WHEN g.grade >= 8 THEN s.name
        ELSE NULL
    END name,
    g.grade,
    s.marks
FROM 
    (SELECT 
        s1.name,
        s1.marks
     FROM 
        students s1
    ORDER BY 
        s1.marks DESC, s1.name) s
LEFT JOIN 
		grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY 
		g.grade DESC, name
```

간단히 설명하자면 먼저 student테이블에 대해 이름과 mark데이터만 가져와서 mark로 먼저 내림차순, 이름을 오름차순 정렬을 한뒤 가져와서 grade와 s.mark가 각 grades의 min_mark와 max_mark사이에 있는 경우로 맞게 join해준다 그 뒤 이름표시에 관련해서 등급이 8이상인 경우만 이름 그대로 표시하고 아닌 경우는 null로 표시해준다 그리고 나머지 등급과 mark를 표시해주고 마지막으로 등급으로 내림차순, 이름(null로 표시해준 컬럼)으로 오름차순해준다

뭔가 먼저 정렬하고 하는 것이 비효율적인 듯하여 안하고 하는 방식으로 해보았는데 잘되었는데

아래가 그 방식으로 한 것으로 일반적인 것처럼 다하고 마지막에 정렬해주었다

```sql
SELECT 
    CASE 
        WHEN g.grade >= 8 THEN s.name
        ELSE NULL
    END name,
    g.grade,
    s.marks
FROM 
    students s
LEFT JOIN 
		grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY 
		g.grade DESC, s.name
```

간단히 설명하자면 학생테이블을 그대로 위의 방식과 동일하게 join하고 이름과, 나머지 표시될 컬럼도 동일하게 해준 다음, 정렬을 등급으로 내림차순, 기존 원래 student이름으로 오름차순 해주었다
