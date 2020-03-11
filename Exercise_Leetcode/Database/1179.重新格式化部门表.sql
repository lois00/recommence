1179. 重新格式化部门表
SQL架构

部门表 Department：

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| revenue       | int     |
| month         | varchar |
+---------------+---------+
(id, month) 是表的联合主键。
这个表格有关于每个部门每月收入的信息。
月份（month）可以取下列值 ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]。

 

编写一个 SQL 查询来重新格式化表，使得新的表中有一个部门 id 列和一些对应 每个月 的收入（revenue）列。

查询结果格式如下面的示例所示：

Department 表：
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+

查询得到的结果表：
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+

注意，结果表有 13 列 (1个部门 id 列 + 12个月份的收入列)。


Solutions:
一：我的愚笨解法
```
SELECT d.id
    ,max(d1.revenue) as Jan_Revenue
    ,max(d2.revenue) as Feb_Revenue
    ,max(d3.revenue) as Mar_Revenue
    ,max(d4.revenue) as Apr_Revenue
    ,max(d5.revenue) as May_Revenue
    ,max(d6.revenue) as Jun_Revenue
    ,max(d7.revenue) as Jul_Revenue
    ,max(d8.revenue) as Aug_Revenue
    ,max(d9.revenue) as Sep_Revenue
    ,max(d10.revenue) as Oct_Revenue
    ,max(d11.revenue) as Nov_Revenue
    ,max(d12.revenue) as Dec_Revenue
FROM Department d
LEFT JOIN Department d1 ON d.id=d1.id and d1.month='Jan'
LEFT JOIN Department d2 ON d.id=d2.id and d2.month='Feb'
LEFT JOIN Department d3 ON d.id=d3.id and d3.month='Mar'
LEFT JOIN Department d4 ON d.id=d4.id and d4.month='Apr'
LEFT JOIN Department d5 ON d.id=d5.id and d5.month='May'
LEFT JOIN Department d6 ON d.id=d6.id and d6.month='Jun'
LEFT JOIN Department d7 ON d.id=d7.id and d7.month='Jul'
LEFT JOIN Department d8 ON d.id=d8.id and d8.month='Aug'
LEFT JOIN Department d9 ON d.id=d9.id and d9.month='Sep'
LEFT JOIN Department d10 ON d.id=d10.id and d10.month='Oct'
LEFT JOIN Department d11 ON d.id=d11.id and d11.month='Nov'
LEFT JOIN Department d12 ON d.id=d12.id and d12.month='Dec'
GROUP BY d.id
```
执行用时 :2449 ms, 内存消耗 :0B

二：参考其他大神的解法做个记录
```
SELECT id
    ,sum(CASE month WHEN 'Jan' THEN revenue END) as Jan_Revenue
    ,sum(CASE month WHEN 'Feb' THEN revenue END) as Feb_Revenue
    ,sum(CASE month WHEN 'Mar' THEN revenue END) as Mar_Revenue
    ,sum(CASE month WHEN 'Apr' THEN revenue END) as Apr_Revenue
    ,sum(CASE month WHEN 'May' THEN revenue END) as May_Revenue
    ,sum(CASE month WHEN 'Jun' THEN revenue END) as Jun_Revenue
    ,sum(CASE month WHEN 'Jul' THEN revenue END) as Jul_Revenue
    ,sum(CASE month WHEN 'Aug' THEN revenue END) as Aug_Revenue
    ,sum(CASE month WHEN 'Sep' THEN revenue END) as Sep_Revenue
    ,sum(CASE month WHEN 'Oct' THEN revenue END) as Oct_Revenue
    ,sum(CASE month WHEN 'Nov' THEN revenue END) as Nov_Revenue
    ,sum(CASE month WHEN 'Dec' THEN revenue END) as Dec_Revenue
FROM Department 
GROUP BY id
```
执行用时 :1804 ms, 内存消耗 :0B
