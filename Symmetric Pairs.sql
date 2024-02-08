[Symmetric Pairs | HackerRank](https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=false)

(x1,y1), (x2,y2)에 대하여 x1=y2, x2=y1이 되면 대칭쌍이라고 하는데 모든 대칭쌍을 찾아서 x를 기준으로 정렬하여(x≤y되는 식으로) 출력하는 문제이다

```sql
SELECT 
    *
FROM 
    functions f
LEFT JOIN 
    functions f2 ON f.y = f2.x AND f.x = f2.y
```

우선 데이터를 한번 살펴보기 위해 러프한 가장 간단한 조건만 걸어서 확인해주니

예상되로 짝이 없는 데이터의 경우는 null로 표시되고, x=y인 경우 총 데이터에 하나 밖에 없을 경우(짝은 없는 경우)는 한번만 나오고, 두개가 있을 경우는 각 2번에 join이 2개씩되어서 총 4번나오게 되었다. (문제에는 그런 경우는 없는 것 같지만 만약 x=y인 데이터가 같은 값으로 3개가 존재하면 지금 쿼리로는 9개가 나올 것으로 예상되는데 이런 경우가 있다면 이 문제에서는 어떻게 해야할지는 모르겠다 하지만 없는 듯하여 나중에 복습할 때 고민해보는게 좋을 것같다)

한쌍에 대해서 한번만 표시하기 떄문에 distinct를 써도 될 것 같기는 하다

x=y가 같은 경우는 세어서 값을 표시해준다 아닌경우는 0이나 -1이나 no로 

```sql
SELECT 
    f.x, f.y,
    CASE
        WHEN f.x != f.y THEN 0
        WHEN f.x = f.y THEN COUNT(*)
    END cnt
FROM 
    functions f
GROUP BY 
    f.x, f.y
```

위 쿼리는 임시테이블로선언할 쿼리이다

간략히 설명하면 functions 테이블에서 x와 y에 대해 그룹핑해주고 x, y 그리고 x와 y가 다를 경우는 0으로 같을 경우는 그 갯수를 표시하도록 표시해주었다

그런 뒤 임시테이블의 이름을 cnt_check_functions로 선언해주었다

```sql
WITH cnt_check_functions AS(
    SELECT 
        f.x, f.y,
        CASE
            WHEN f.x != f.y THEN 0
            WHEN f.x = f.y THEN COUNT(*)
        END cnt
    FROM 
        functions f
    GROUP BY 
        f.x, f.y
)
SELECT 
    DISTINCT cf.x, cf.y
FROM 
    cnt_check_functions cf
JOIN 
    functions f2 ON cf.y = f2.x AND cf.x = f2.y
WHERE 
    cf.x < cf.y
    OR (cf.cnt > 1 AND cf.x = cf.y)
ORDER BY 
    cf.x
```

메인 쿼리에 대해서도 간단히 설명하면 위 임시테이블과 function테이블을 x1=y2, x2=y1의 식으로 만족하는 경우로 join해주고(아닌 것들은 제외해주기 위해서) 
  그러한 것들 중 x<y이거나 x=y인데 한개만 있는 경우가 아닌 경우 중복없이 x와 y를 출력하여 x를 기준으로 정렬해주는 쿼리이다
