[Interviews | HackerRank](https://www.hackerrank.com/challenges/interviews/problem?isFullScreen=false)
각 contest_id별로 contest_id와 hacker_id, name, 각 전체 submissions, accepted_submissions, views, unique_views를 출력하는데 contests_id의 오름차순으로 정렬하여 출력하는 문제이다
```sql
SELECT 
    con.contest_id, 
    con.hacker_id, 
    con.name,
    t3.total_submissions,
    t3.total_accepted_submissions,
    t3.total_views, 
    t3.total_unique_views
FROM
    contests con
LEFT JOIN
    (
    SELECT
        con2.contest_id, 
        COALESCE(SUM(t2.total_submissions), 0) total_submissions, 
        COALESCE(SUM(t2.total_accepted_submissions), 0) total_accepted_submissions,
        COALESCE(SUM(t2.total_views), 0) total_views, 
        COALESCE(SUM(t2.total_unique_views), 0) total_unique_views
    FROM 
        contests con2
    LEFT JOIN
        (SELECT 
            col.contest_id,
            col.college_id,
            COALESCE(SUM(t.total_submissions), 0) total_submissions, 
            COALESCE(SUM(t.total_accepted_submissions), 0) total_accepted_submissions,
            COALESCE(SUM(t.total_views), 0) total_views, 
            COALESCE(SUM(t.total_unique_views), 0) total_unique_views
        FROM 
            colleges col
        LEFT JOIN 
            (
            SELECT 
                ch.college_id,
                ch.challenge_id, 
                COALESCE(SUM(s.total_submissions), 0) total_submissions, 
                COALESCE(SUM(s.total_accepted_submissions), 0) total_accepted_submissions,
                COALESCE(SUM(v.total_views), 0) total_views, 
                COALESCE(SUM(v.total_unique_views), 0) total_unique_views
            FROM 
                challenges ch
            LEFT JOIN
                (
                SELECT 
                    vs.challenge_id,
                    SUM(vs.total_views) total_views,
                    SUM(vs.total_unique_views) total_unique_views
                FROM 
                    view_stats vs
                GROUP BY 
                    vs.challenge_id
                ) v ON ch.challenge_id = v.challenge_id
            LEFT JOIN 
                (
                SELECT 
                    ss.challenge_id ,
                    SUM(ss.total_submissions) total_submissions,
                    SUM(ss.total_accepted_submissions) total_accepted_submissions
                FROM 
                    submission_stats ss
                GROUP BY 
                    ss.challenge_id
                    ) s ON ch.challenge_id = s.challenge_id
            GROUP BY 
                ch.college_id, ch.challenge_id
            ) t ON col.college_id = t.college_id
        GROUP BY 
            col.contest_id, col.college_id
        ) t2 ON con2.contest_id = t2.contest_id
    GROUP BY 
        con2.contest_id
    ) t3 ON con.contest_id = t3.contest_id
WHERE t3.total_views + t3.total_unique_views 
        + t3.total_submissions + t3.total_accepted_submissions >0
ORDER BY 
    con.contest_id;
```

run code는 성공하였지만 제출할 때 시간이 너무 오래 걸려서 인지 계속 실패했고, 따라서 더 줄일 수 있을지 여부를 확인을 해보았다

우선 문제에서 주어진 전제조건으로 contes는 여러개의 college에서 후보자를 심사할 수 있으나, 각 college에서는 단 1개의 심사 공모전만 개최한다는 조건이 있었다

이게 의미상 contests, colleges, challenges까지는 다 고유한 값을 가진다고 생각 할 수 있을 것 같아 나머지 테이블은 한번에 join해주어도 위에서 언급한 중복해서 여러번 포함되는 경우를 가지지 않을 것 같다고 생각되어 서브쿼리 수를 좀 더 줄이고 한번에 시도해보았다

```sql
SELECT 
    con.contest_id, 
    con.hacker_id, 
    con.name,
    COALESCE(SUM(s.total_submissions), 0) total_submissions,
    COALESCE(SUM(s.total_accepted_submissions), 0) total_accepted_submissions,
    COALESCE(SUM(v.total_views), 0) total_views, 
    COALESCE(SUM(v.total_unique_views), 0) total_unique_views
FROM
    contests con 
LEFT JOIN
    colleges col ON con.contest_id = col.contest_id
LEFT JOIN 
    challenges ch ON col.college_id = ch.college_id
LEFT JOIN
    (
    SELECT 
        vs.challenge_id,
        SUM(vs.total_views) total_views,
        SUM(vs.total_unique_views) total_unique_views
    FROM 
        view_stats vs
    GROUP BY 
        vs.challenge_id
    ) v ON ch.challenge_id = v.challenge_id
LEFT JOIN 
    (
    SELECT 
        ss.challenge_id ,
        SUM(ss.total_submissions) total_submissions,
        SUM(ss.total_accepted_submissions) total_accepted_submissions
    FROM 
        submission_stats ss
    GROUP BY 
        ss.challenge_id
    ) s ON ch.challenge_id = s.challenge_id
GROUP BY 
    con.contest_id, con.hacker_id, con.name
HAVING 
	total_submissions + total_accepted_submissions
                + total_views + total_unique_views > 0
ORDER BY 
    con.contest_id;
```

줄였는데도 제출이 안된다..ㅠ(그래서 일단 제출을 못하고 github에만 추가해주었다)
