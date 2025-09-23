mysql> select * from sample51
    -> ;
+------+------+----------+
| no   | name | quantity |
+------+------+----------+
|    1 | A    |        1 |
|    2 | A    |        2 |
|    3 | B    |       10 |
|    4 | C    |        3 |
|    5 | NULL |     NULL |
+------+------+----------+
5 rows in set (1.564 sec)

mysql> select count(*) from sample51
    -> ;
+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.169 sec)

mysql> select count(name),count(no) from sample51;
+-------------+-----------+
| count(name) | count(no) |
+-------------+-----------+
|           4 |         5 |
+-------------+-----------+
1 row in set (0.050 sec)

mysql> select distint name from sample51;
ERROR 1054 (42S22): Unknown column 'distint' in 'field list'
mysql> select distinct name from sample51;
+------+
| name |
+------+
| A    |
| B    |
| C    |
| NULL |
+------+
4 rows in set (0.066 sec)

mysql> select sum(quantity) from sample51;
+---------------+
| sum(quantity) |
+---------------+
|            16 |
+---------------+
1 row in set (0.034 sec)

mysql> select avg(quantity) from sample51;
+---------------+
| avg(quantity) |
+---------------+
|        4.0000 |
+---------------+
1 row in set (0.009 sec)

mysql> select min(quantity) from sample51;
+---------------+
| min(quantity) |
+---------------+
|             1 |
+---------------+
1 row in set (0.040 sec)

mysql> select name from sample51 group by name;
+------+
| name |
+------+
| A    |
| B    |
| C    |
| NULL |
+------+
4 rows in set (0.010 sec)

mysql> select name,count(name),sum(quantity) from sample51 group by name;
+------+-------------+---------------+
| name | count(name) | sum(quantity) |
+------+-------------+---------------+
| A    |           2 |             3 |
| B    |           1 |            10 |
| C    |           1 |             3 |
| NULL |           0 |          NULL |
+------+-------------+---------------+
4 rows in set (0.014 sec)

mysql> select name,count(name),sum(quantity) from sample51 group by name having count(name)=1;
+------+-------------+---------------+
| name | count(name) | sum(quantity) |
+------+-------------+---------------+
| B    |           1 |            10 |
| C    |           1 |             3 |
+------+-------------+---------------+
2 rows in set (0.064 sec)

mysql> select name,count(name),sum(quantity) from sample51 group by name order by sum(quantity);
+------+-------------+---------------+
| name | count(name) | sum(quantity) |
+------+-------------+---------------+
| NULL |           0 |          NULL |
| A    |           2 |             3 |
| C    |           1 |             3 |
| B    |           1 |            10 |
+------+-------------+---------------+
4 rows in set (0.013 sec)

mysql> select * from sample54;
+------+------+
| no   | a    |
+------+------+
|    1 |  100 |
|    2 |  900 |
|    3 |   20 |
|    4 |   80 |
+------+------+
4 rows in set (0.068 sec)

mysql> delete from sample54 where a=(select min(a) from sample54);
ERROR 1093 (HY000): You can't specify target table 'sample54' for update in FROM clause
mysql> select (select count(*) from sample51)as sql1 (select count(*) from sample54)as sql2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(select count(*) from sample54)as sql2' at line 1
mysql> select (select count(*) from sample51)as sql1, (select count(*) from sample54)as sql2;
+------+------+
| sql1 | sql2 |
+------+------+
|    5 |    4 |
+------+------+
1 row in set (0.073 sec)

mysql> update sample54 set a=(select max(a) from sample54) ;
ERROR 1093 (HY000): You can't specify target table 'sample54' for update in FROM clause
mysql> select * from sample541;
Empty set (0.052 sec)

mysql> insert into sample541 values((select count(*) from sample51),(select count(*) from sample54));
Query OK, 1 row affected (0.187 sec)

mysql> select * from sample541;
+------+------+
| a    | b    |
+------+------+
|    5 |    4 |
+------+------+
1 row in set (0.008 sec)

mysql> insert into sample54 select1,2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select1,2' at line 1
mysql> insert into sample541 select1,2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select1,2' at line 1
mysql> select * from sample551;
+------+------+
| no   | a    |
+------+------+
|    1 | NULL |
|    2 | NULL |
|    3 | NULL |
|    4 | NULL |
|    5 | NULL |
+------+------+
5 rows in set (0.041 sec)

mysql> select * from sample552;
+------+
| no2  |
+------+
|    3 |
|    5 |
+------+
2 rows in set (0.031 sec)

mysql> update sample551 set a='있음' where exists (select no2 from sample552 where no2=no);
Query OK, 2 rows affected (0.158 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from sample551;
+------+------+
| no   | a    |
+------+------+
|    1 | NULL |
|    2 | NULL |
|    3 | 있음 |
|    4 | NULL |
|    5 | 있음 |
+------+------+
5 rows in set (0.034 sec)

mysql> update sample551 set a='없음' where (select * from sample551 where no2=no);
ERROR 1054 (42S22): Unknown column 'no2' in 'where clause'
mysql> update sample551 set a='없음' where (select * from sample552 where no2=no);
Query OK, 2 rows affected (0.083 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from sample551;
+------+------+
| no   | a    |
+------+------+
|    1 | NULL |
|    2 | NULL |
|    3 | 없음 |
|    4 | NULL |
|    5 | 없음 |
+------+------+
5 rows in set (0.008 sec)

mysql> select * from sample551 where no in (select no2 in sample551);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sample551)' at line 1
mysql> select * from sample551 where no in (select no2 in sample552);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'sample552)' at line 1
mysql> select * from sample551 where no in (select no2 from sample552);
+------+------+
| no   | a    |
+------+------+
|    3 | 없음 |
|    5 | 없음 |
+------+------+
2 rows in set (0.065 sec)
