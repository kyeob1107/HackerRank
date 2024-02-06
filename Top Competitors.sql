[Top Competitors | HackerRank](https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=false)

만점으로 점수 받은 challenge가 두개이상인 hacker의 id와 이름을 출력하는데 만점을 획득한 챌린지 수로 내림차순하고 id를 기준으로 오름차순하여 출력하는 문제이다.

```sql
SELECT 
	s.hacker_id, COUNT(DISTINCT s.challenge_id), COUNT(s.challenge_id)
FROM
	(SELECT
		s1.hacker_id, s1.challenge_id, s1.score 
	FROM
		submissions s1) AS s
GROUP BY s.hacker_id
HAVING COUNT(DISTINCT s.challenge_id) != COUNT(s.challenge_id)
```

```sql
SELECT 
	s.hacker_id , s.challenge_id, c.difficulty_level
FROM 
	submissions s
LEFT JOIN 
	challenges c ON s.challenge_id = c.challenge_id
```

challenge는 챌린지id와 그 챌린지를 처음 만든 사람의 id와 어려움 레벨로 구성된 테이블이라

join할때 조건으로 hacker_id로 하면 안된다(만들지 않은 사람들도 풀었기 때문에 그리고 혹시 만든 사람도 풀었나 싶어서 확인해보니 전부는 아니지만 일부 풀었는 사람도 있는 듯하였다)

```sql
SELECT tot.hacker_id, tot.name
FROM
    (SELECT 
        s.hacker_id, h.name, s.challenge_id
    FROM 
        submissions s
    LEFT JOIN 
        challenges c ON s.challenge_id = c.challenge_id 
    LEFT JOIN 
        difficulty d ON c.difficulty_level = d.difficulty_level
    LEFT JOIN 
        hackers h ON s.hacker_id = h.hacker_id 
    WHERE
        s.score = d.score) tot
GROUP BY 
    tot.hacker_id, tot.name
HAVING
	COUNT(tot.challenge_id) > 1
ORDER BY 
    COUNT(tot.challenge_id) DESC, tot.hacker_id
```

위의 이유로 서브쿼리로 하지 않고 바로 group by를 해면 에러가 나서 순서바꿔서 서브쿼리를 통해 테이블 만들어주고 거기서 group by를 해주었다

쿼리에 대해 간단히 설명하면 먼저 각 연결되는 컬럼들로 join해주었고, 그 뒤 제출한 점수가 만점을 받았는지 조건을 걸기 위하여 difficulty의 점수와 같을 때로 조건을 걸어주었다 
  그뒤 hacker_id와 이름, challenge_id를 출력하도록한 쿼리를 서브쿼리로 써서 hacker_id와 이름으로 그룹핑해준 뒤 
  각 그룹에 대해 (만점을 달성한)challenge의 수가 2개 이상인 hacker에 대해서만 id와 이름에 대해 출력해주는데 challenge의 갯수대로 내림차순하고 hacke_id로 오름차순해주었다
