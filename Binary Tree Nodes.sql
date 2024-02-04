[Binary Tree Nodes | HackerRank](https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=false)

binary tree의 node가 무슨 종류의 노드인지 구별하는 문제이다.

```sql
SELECT 
    b.n,
    CASE
        WHEN b.p is NULL THEN "Root"
        WHEN EXISTS (SELECT * FROM bst b2 WHERE b.n = b2.p) THEN "Inner"
        ELSE "Leaf"
    END node_type
FROM 
    bst b
ORDER BY b.n
```

먼저 parent가 없다면 Root이므로 그렇게 정해줬고 있다면 그 노드를 parent로 가지는 노드가 존재하는지 EXSIST를 사용하여 확인해준 뒤 존재한다면 Inner로 판단해주었고, 
마지막으로 그 외의 경우는 parent는 존재하지만 그 노드를 parent로 가지는 노드는 존재하지 않는 경우이기에 Leaf로 판단해주었다

간만에 hackerrank에서 의미있는 푸는 보람이 있는 문제를 푼 것 같아서 기쁘다
