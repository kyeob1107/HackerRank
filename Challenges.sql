[Challenges | HackerRank](https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=false)

가장 많은 수의 challenge를 만든 경우가 아니라면 동일한 수의 challenge를 만든 사람은 다 제외하고 challenge를 제출한 수에 대하여 
  그 수에 해당하는 사람이 한명인 경우와 가장 많은 challenge를 만든 경우에 포함되는 hacker의 id와 그 사람이 만든 challenge의 수를 출력하는데, 
  만든 수로 내림차순하고 이름으로 오름차순하는 문제이다.

```sql
WITH num_challenge_per_hacker AS(
    SELECT 
        c_s.hacker_id, COUNT(c_s.challenge_id) cnt_chall
    FROM 
        challenges c_s
    GROUP BY 
        c_s.hacker_id
)
SELECT 
    h.hacker_id, h.name, nc.cnt_chall
FROM 
    hackers h, num_challenge_per_hacker nc
WHERE 
    h.hacker_id = nc.hacker_id
    AND NOT EXISTS(
                SELECT 
                    nc_s.cnt_chall, COUNT(nc_s.hacker_id) cnt_hack
                FROM 
                    num_challenge_per_hacker nc_s
                WHERE 
                    nc.cnt_chall = nc_s.cnt_chall
                GROUP BY 
                    nc_s.cnt_chall
                HAVING 
                    cnt_hack>1
                    AND nc_s.cnt_chall != (SELECT MAX(sub.cnt_chall) FROM num_challenge_per_hacker sub)
                    )
ORDER BY 
    nc.cnt_chall DESC, h.hacker_id;
```

쿼리에 대해 간단히 설명하자면 우선 임시테이블로 challenges테이블로 부터 해커아이디로 그룹을 지어서 
  해커아이디와 해커아이디의 사람이 만든 challenge 수((cnt_chall이라고 하겠음))를 출력하는 쿼리로 임시테이블num_challenge_per_hacker를 만들었다

그리고 hackers 테이블과 num~테이블을 가져와 where절로 둘의 hacker_id가 같은 경우에 대해서만 데이터를 가져와서 
  hacker_id와 이름, cnt_chall을 출력하도록 하는데 각 행에 대하여 EXISTS절에 데이터가 존재하지 않는 경우만 출력하도록하며 정렬은 cnt_chall로 내림차순, hacker_id로 오름차순 정렬해준다
  
그리고 EXISTS절 서브쿼리에 대해 설명하면 우선 num~테이블로 부터 데이터를 가져오는데 단 메인쿼리의 cnt_chall과 같은 경우만 가져온다 
  그리고 cnt_chall에 대해 그룹지어서 cnt_chall 그 그룹이 cnt_hack(cnt_chall에 해당되는 hacker 수)가 1보다 크고 cnt_chall이 최대가 아닌 경우에만 
  cnt_chall과 그에 해당하는 hacker_id의 수를 출력하는 쿼리이다.

따라서 만약 가장 큰 수를 제외한 같은 수의 challenge를 만든 학생은 EXISTS 쿼리에 데이터가 존재하게 되기 때문에 해당되는 데이터는 메인쿼리에서 출력되지 않게 된다
