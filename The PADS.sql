[The PADS | HackerRank](https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=false)

각 이름에 대해 직업의 첫글자를 괄호안에 넣어 뒤에 붙이고(이름순으로 정렬), 또 `There are a total of [occupation_count] [occupation]s.` 형태(occupation_count는 직업에 해당되는 수, occupation은  직업인데 소문자로 하라고 한다)로 출력(occupation_count로 오름차순 정렬하고 같은게 있을 경우 occupation으로 오름차순 정렬)하는 문제이다

```sql
(SELECT CONCAT(o.name,"(",SUBSTR(o.occupation,1,1),")")
FROM occupations o
ORDER BY o.name)
UNION ALL
(SELECT 
    CONCAT("There are a total of", " ", COUNT(o.name), " ",o.occupation,"s")
FROM occupations o
GROUP BY o.occupation
ORDER BY COUNT(o.name))
```

각각 쿼리만 따로 해줬을 때는 정렬 똑바로 되었었는데 왜 union하니까 정렬 또 안된 것으로 나오는지?

```sql
SELECT CONCAT(o.name,"(",SUBSTR(o.occupation,1,1),")")
FROM occupations o
ORDER BY o.name;
SELECT 
    CONCAT("There are a total of", " ", COUNT(o.name), " ",lower(o.occupation),"s.")
FROM occupations o
GROUP BY o.occupation
ORDER BY COUNT(o.name), o.occupation;
```
