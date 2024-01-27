#[Weather Observation Station 5 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=false)

#나라이름이 가장 짧은 나라와 긴 나라의 이름과 글자수를 출력하는 문제이다.

```sql
(SELECT s.city, LENGTH(s.city)
FROM station s
ORDER BY LENGTH(s.city), s.city
LIMIT 1)
UNION
(SELECT s.city, LENGTH(s.city)
FROM station s
ORDER BY LENGTH(s.city) DESC, s.city
LIMIT 1)
```

#몇 일 전에 유사하게 각 테이블에 대해 구하고 첫번째에 해당하는 행만 가져와 union으로 합치는 방법을 사용하였다 
#각 서브쿼리로 첫번째는 각 도시, 글자수로 하여 글자수로 먼저 오름차순하여 첫번째 값으로 최소값을 가져왔고, 
#두번째는 각 도시, 글자수로 하여 글자수로 먼저 내림차순하여 첫번째 값으로 최대값을 가져왔다
#(그리고 정렬기준에 도시이름도 추가해주어 만약 동일글자수가 여러 개이면 알파벳순으로 먼저 오게 정렬해주었다)
