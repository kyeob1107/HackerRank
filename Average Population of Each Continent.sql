[Average Population of Each Continent | HackerRank](https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=false)

각 대륙별로 해당되는 도시들의 평균 인구를 출력하는 문제이다

LEFT Join을 했기에 눈치챌 수 있었는데

Antarctica 대륙의 나라 HMD, SGS는 city테이블에 관련 데이터가 없다

North America 대륙의 여러 나라들도 city테이블에 관련 데이터가 없다

따로 언급도 없고 다들 (inner) join으로 푼듯하여 그것으로 해서 제출하였다

```sql
SELECT 
    co.continent,
    TRUNCATE(AVG(ci.population),0)
FROM 
    country co
JOIN
    city ci ON ci.countrycode = co.code
GROUP BY 
    co.continent
```

다들 floor로 한듯해서 truncate로 해도 되는 것 아닌가 해서 해보았는데 처음에는 round처럼 자릿수 생략 가능한 줄 알고 생략했다가 에러가 떠서 0을 넣어주었다 truncate는 생략이 불가능한 듯하다

그리고 확실히 정수로 표현되게 버림 할 것이라면 floor를 쓰는 것이 편하다는 것을 확인하였다(자릿수 신경 쓸 필요가 없으니)

```sql
SELECT 
    co.continent,
    FLOOR(AVG(ci.population))
FROM 
    country co
JOIN
    city ci ON ci.countrycode = co.code
GROUP BY 
    co.continent
```
