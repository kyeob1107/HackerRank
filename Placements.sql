[Placements | HackerRank](https://www.hackerrank.com/challenges/placements/problem?isFullScreen=false)

가장 친한 친구가 자신보다 더 높은 연봉을 제안 받은 학생의 이름을 가장 친한 친구가 받게되는 연봉의 금액에 따라 오름차순 정렬하는 문제이다.

```sql
SELECT 
    f.id, f.friend_id, pid.salary, pfid.salary friend_salary,
    CASE 
        WHEN pid.salary < pfid.salary THEN "friend"
        WHEN pid.salary > pfid.salary THEN "owner"
        ELSE "same" #문제에서는 같은경우 없다고 했지만 혹시몰라서
    END comparison
FROM 
    friends f
LEFT JOIN 
    packages pid ON f.id = pid.id
LEFT JOIN
    packages pfid ON f.friend_id = pfid.id
```

위는 임시테이블로 정의할 쿼리이다 간단히 설명하면 우선 friends 테이블에서 packages 테이블을 left join하는데 각각 id와 같은 것으로 한번 friend_id와 같은것으로 한번해서 총 두번 left join해주었다. 그런 뒤 id와 friend_id, id의 salary, 친구의 salary, 그리고 id와 친구의 salary를 비교하여 친구가 더 크면 friend로 표시하고 id가 더 높을 경우 owner라고 표시해주며 (문제에서는 없다라고 전제해주었지만 혹시나 하는 생각에 넣어준) 같을 경우 same으로 표시해주는 컬럼comparison을 표시하도록 하였다

이 쿼리를 임시테이블 compare_salary로 선언해주었다

그리고 전에도 적을까하다 빼먹었던 것 같은데 hackerrank에서는 한글로 주석달아놓으면 에러가 나서 실행시에는 한글로 주석달아놓은 부분은 지우고 실행해야한다.

```sql
WITH compare_salary AS(
    SELECT 
        f.id, f.friend_id, pid.salary, pfid.salary friend_salary,
        CASE 
            WHEN pid.salary < pfid.salary THEN "friend"
            WHEN pid.salary > pfid.salary THEN "owner"
            ELSE "same"
        END comparison
    FROM 
        friends f
    LEFT JOIN 
        packages pid ON f.id = pid.id
    LEFT JOIN
        packages pfid ON f.friend_id = pfid.id
)
SELECT 
    s.name
FROM 
    compare_salary cs
LEFT JOIN 
    students s ON cs.id = s.id
WHERE 
    cs.comparison = 'friend'
ORDER BY 
    cs.friend_salary
```

그리고 이어서 메인쿼리에 대해서도 간단히 설명하자면 우선 둘을 id를 기준으로 left join(계속 left join하는 이유는 혹시나 빠진 데이터가 있으면 확인하기 위해서 해주는 것으로, 원래는 나눠서 따로 체크해본 뒤 의도에 따라 join이나 left join을 골라서 하면되는데 매번 나눠서 바꿔가며 하기는 버거로운 감이 있어서 한번에 해줄려고 left join부터 사용하는 것이다) 해주었다

그런 뒤 comparison이 friend인 것만 데이터(친구가 salary가 더 큰 경우)를 가져온다 그런 뒤 id의 이름을 출력해주는데 정렬을 친구의 salary를 기준으로 정렬해주는 쿼리이다.
