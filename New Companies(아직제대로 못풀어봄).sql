[New Companies | HackerRank](https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=false)

각 회사별로 각 직위에 있는 사람이 몇명씩인지 출력하는 문제이다.
  ```sql
select c.company_code, c.founder, count(distinct lm.lead_manager_code), 
count(distinct sm.senior_manager_code), count(distinct m.manager_code), 
count(distinct e.employee_code)

from Company c, Lead_Manager lm, Senior_Manager sm, Manager m, Employee e
where c.company_code = lm.company_code
    and lm.lead_manager_code = sm.lead_manager_code
    and sm.senior_manager_code = m.senior_manager_code
    and m.manager_code = e.manager_code
group by c.company_code, c.founder
order by c.company_code
```
되는 쿼리는 저래서 가져는 왔는데 아직 이해도 잘 안되었고 혼자서 풀려니 되지않을까 생각하는 부분 다해봤지만 에러떠서 너무 시간소모많이한 관계로
일단 되는 다른사람 것 가져와서 저런식으로 하면 되는 구나 하고 넘어가고 다시 볼 예정
