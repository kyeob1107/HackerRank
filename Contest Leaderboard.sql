[Contest Leaderboard | HackerRank](https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=false)

각 챌린지 별로 최대점수로 계산하여 hacker_id별로 총 점수의 합을 구하는 문제인데, hacker_id, 이름, 총점수를 출력하는데 총점이 0점인 사람은 출력하지 않고, 
  또 정렬은 총점기준으로 내림차순하고 id기준으로 오름차순하는 문제이다.
  ```sql
SELECT 
    h.hacker_id, h.name, s.tot_score
FROM 
    hackers h,
    (SELECT 
        s2.hacker_id, SUM(s2.max_score) tot_score
    FROM
        (SELECT 
            s1.hacker_id, MAX(s1.score) max_score
        FROM 
            submissions s1
        GROUP BY 
            s1.hacker_id, s1.challenge_id
        ) s2
     GROUP BY 
        s2.hacker_id
    ) s
WHERE 
    h.hacker_id = s.hacker_id
    AND s.tot_score >0
ORDER BY 
    s.tot_score DESC, h.hacker_id
```
