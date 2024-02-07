[Ollivander's Inventory | HackerRank](https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=false)

사악하지 않은 지팡이 중 나이와 power가 같은 지팡이의 경우 가장 가격이 싼 경우만 가져와서

지팡이의 id, age, 필요한 코인수, power를 power를 기준으로 내림차순하며 power가 같을 경우 나이를 기준으로 내림차순하는 문제이다.
  ```sql
SELECT
    w.id, wp.age, w.coins_needed, w.power
FROM 
    wands w
LEFT JOIN 
    wands_property wp ON w.code = wp.code
WHERE wp.is_evil = 0
    AND EXISTS 
    (
        SELECT
            wp_s.age, w_s.power, MIN(w_s.coins_needed)
        FROM 
            wands w_s
        LEFT JOIN 
            wands_property wp_s ON w_s.code = wp_s.code
        WHERE 
            wp_s.age = wp.age
        GROUP BY 
            wp_s.age, w_s.power
        HAVING 
            MIN(w_s.coins_needed) = w.coins_needed)
ORDER BY
    w.power DESC, wp.age DESC
```

간단히 쿼리에 대해 설명하자면 우선 wands테이블과 wadas_property테이블을 code를 공통컬럼으로 하여 left join해주었으며 
  그중 사악하지 않은 지팡이에 대한 데이터만 가져왔다 그런 뒤 지팡이의 id, 나이, 필요한 코인수, power를 출력하는데 
  이 때 각 행에 대하여 EXISTS문 서브쿼리에 행이 존재할 경우에만 출력한다. 이때  EXISTS문에 들어갈 서브쿼리을 설명하자면 
  동일하게 wands와 wands_property 테이블을 code로 left join하고 메인쿼리의 age와 exists서브쿼리의 age가 같은 경우의 데이터만 가져와서 
  지팡이의 나이와 power를 기준으로 그룹지어서 그 그룹의 최소 필요코인 수와 메인쿼리의 필요 코인 수가 같을 때만 지팡이의 나이, power, 최소 필요 코인 수가 출력되는 쿼리이다
  (사실 특별한 컬럼을 출력할 필요없이 1이나 *로 하여 값이 출력되게만 하여도 충분히 동작한다)
