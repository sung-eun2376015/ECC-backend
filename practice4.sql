mysql> select a from sample71_a
    -> union
    -> select b from sample71_b
    -> union
    -> select age from sample31;
+------+
| a    |
+------+
|    1 |
|    2 |
|    3 |
|   10 |
|   11 |
|   36 |
|   18 |
|   25 |
+------+
8 rows in set (1.428 sec)

mysql> select age from sample31;
+------+
| age  |
+------+
|   36 |
|   18 |
|   25 |
+------+
3 rows in set (0.007 sec)

mysql> select b from sample71_b
    -> ;
+------+
| b    |
+------+
|    2 |
|   10 |
|   11 |
+------+
3 rows in set (0.009 sec)

mysql> select a from sample71_a;
+------+
| a    |
+------+
|    1 |
|    2 |
|    3 |
+------+
3 rows in set (0.008 sec)

mysql> select * from sample72_x,sample72_y;
+------+------+
| x    | y    |
+------+------+
| C    |    1 |
| B    |    1 |
| A    |    1 |
| C    |    2 |
| B    |    2 |
| A    |    2 |
| C    |    3 |
| B    |    3 |
| A    |    3 |
+------+------+
9 rows in set (0.187 sec)