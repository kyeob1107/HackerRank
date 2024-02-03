[Weather Observation Station 18 | HackerRank](https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=false)

가장 작은값과 큰 값의 lat_n과 long_w의 절대값 차를 구한 뒤 합([Manhattan Distance](https://xlinux.nist.gov/dads/HTML/manhattanDistance.html)라고 하는 듯하다 좌표 형식으로 각 각 lat_n중 가장 작은 값과 long_w중 가장 작은 값을 좌표로 가지는 지점과 각각 둘 다에 대해 가장 큰 값을 가지는 지점에 대해 거리를 구하는데 그 거리 구하는 방식을 각각 x좌표, y좌표의 차를 절대값으로 구한 뒤 합하는 방식으로 구함)을 구하는 문제이다

```sql
SELECT 
    ROUND(ABS(MAX(s.lat_n)-MIN(s.lat_n))+ABS(MAX(s.long_w)-MIN(s.long_w)),4)
FROM 
    station s
```
