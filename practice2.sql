
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sample             |
| sys                |
+--------------------+
5 rows in set (0.108 sec)

mysql> use sample
Database changed
mysql> select * from sample31
    -> ;
+------+------+-------------------+
| name | age  | address           |
+------+------+-------------------+
| A씨  |   36 | 대구광역시 중구   |
| B씨  |   18 | 부산광역시 연제구 |
| C씨  |   25 | 서울특별시 중구   |
+------+------+-------------------+
3 rows in set (0.139 sec)

mysql> select * from sample31 orderby agel
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'agel' at line 1
mysql> select * from sample31 orderby age;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'age' at line 1
mysql> select * from sample31 order by age;
+------+------+-------------------+
| name | age  | address           |
+------+------+-------------------+
| B씨  |   18 | 부산광역시 연제구 |
| C씨  |   25 | 서울특별시 중구   |
| A씨  |   36 | 대구광역시 중구   |
+------+------+-------------------+
3 rows in set (0.009 sec)

mysql> select * from sample31 order by age desc;
+------+------+-------------------+
| name | age  | address           |
+------+------+-------------------+
| A씨  |   36 | 대구광역시 중구   |
| C씨  |   25 | 서울특별시 중구   |
| B씨  |   18 | 부산광역시 연제구 |
+------+------+-------------------+
3 rows in set (0.008 sec)

mysql> select * from sample31 order by address;
+------+------+-------------------+
| name | age  | address           |
+------+------+-------------------+
| A씨  |   36 | 대구광역시 중구   |
| B씨  |   18 | 부산광역시 연제구 |
| C씨  |   25 | 서울특별시 중구   |
+------+------+-------------------+
3 rows in set (0.008 sec)

mysql> select * from sample31 order by age asc;
+------+------+-------------------+
| name | age  | address           |
+------+------+-------------------+
| B씨  |   18 | 부산광역시 연제구 |
| C씨  |   25 | 서울특별시 중구   |
| A씨  |   36 | 대구광역시 중구   |
+------+------+-------------------+
3 rows in set (0.010 sec)

mysql> select * from sample311 order by a;
+------+------+
| a    | b    |
+------+------+
| 1    |    1 |
| 10   |   10 |
| 11   |   11 |
| 2    |    2 |
+------+------+
4 rows in set (0.031 sec)

mysql> desc sample311
    -> ;
+-------+------------+------+-----+---------+-------+
| Field | Type       | Null | Key | Default | Extra |
+-------+------------+------+-----+---------+-------+
| a     | varchar(2) | YES  |     | NULL    |       |
| b     | int        | YES  |     | NULL    |       |
+-------+------------+------+-----+---------+-------+
2 rows in set (0.043 sec)

mysql> select * from sample32 order by a;
+------+------+
| a    | b    |
+------+------+
|    1 |    1 |
|    1 |    3 |
|    1 |    2 |
|    2 |    1 |
|    2 |    2 |
+------+------+
5 rows in set (0.035 sec)

mysql> select * from sample32 order by a,b;
+------+------+
| a    | b    |
+------+------+
|    1 |    1 |
|    1 |    2 |
|    1 |    3 |
|    2 |    1 |
|    2 |    2 |
+------+------+
5 rows in set (0.009 sec)

mysql> select * from sample33 order by no limit 3;
+------+
| no   |
+------+
|    1 |
|    2 |
|    3 |
+------+
3 rows in set (0.026 sec)

mysql> select * from sample33 order by no desc limit 3;
+------+
| no   |
+------+
|    7 |
|    6 |
|    5 |
+------+
3 rows in set (0.008 sec)

mysql> select * from sample33 order by no limit 3 offset 2;
+------+
| no   |
+------+
|    3 |
|    4 |
|    5 |
+------+
3 rows in set (0.011 sec)

mysql> select * from sample34
    -> ;
+------+-------+----------+
| no   | price | quantity |
+------+-------+----------+
|    1 |   100 |       10 |
|    2 |   230 |       24 |
|    3 |  1980 |        1 |
+------+-------+----------+
3 rows in set (0.045 sec)

mysql> select no,price*quantitiy as amount from sample34;
ERROR 1054 (42S22): Unknown column 'quantitiy' in 'field list'
mysql> select no,price*quantity as amount from sample34;
+------+--------+
| no   | amount |
+------+--------+
|    1 |   1000 |
|    2 |   5520 |
|    3 |   1980 |
+------+--------+
3 rows in set (0.008 sec)

mysql> select *,price*quantity "금액" from sample34;
+------+-------+----------+------+
| no   | price | quantity | 금액 |
+------+-------+----------+------+
|    1 |   100 |       10 | 1000 |
|    2 |   230 |       24 | 5520 |
|    3 |  1980 |        1 | 1980 |
+------+-------+----------+------+
3 rows in set (0.008 sec)

mysql> select *,price*quantity "금액" from sample34 where price*quantity>=2000;
+------+-------+----------+------+
| no   | price | quantity | 금액 |
+------+-------+----------+------+
|    2 |   230 |       24 | 5520 |
+------+-------+----------+------+
1 row in set (0.012 sec)

mysql> select concat(quantity,unit) from sample35;
+-----------------------+
| concat(quantity,unit) |
+-----------------------+
| 10개                  |
| 24통                  |
| 1장                   |
+-----------------------+
3 rows in set (0.040 sec)

mysql> select current_timestamp
    -> ;
+---------------------+
| current_timestamp   |
+---------------------+
| 2025-09-21 21:26:58 |
+---------------------+
1 row in set (0.010 sec)

mysql> select * from sample37;
+------+
| a    |
+------+
|    1 |
|    2 |
| NULL |
+------+
3 rows in set (0.029 sec)

mysql> select a as "코드",
    -> case
    -> when a=1 then "남자"
    -> when a=2 then "여자"
    -> else '미지정'
    -> end
    -> as "성별" from sample37;
+------+--------+
| 코드 | 성별   |
+------+--------+
|    1 | 남자   |
|    2 | 여자   |
| NULL | 미지정 |
+------+--------+
3 rows in set (0.010 sec)

mysql> select a as "코드"
    -> case a
    -> when 1 then '남자'
    -> when 2 then '여자'
    -> else '미지정'
    -> end
    -> as "성별"
    -> from sample37;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'case a
when 1 then '남자'
when 2 then '여자'
else '미지정'
end
as "성별' at line 2
mysql> select a as "code",
    -> case a when 1 then 'man' when 2 then 'girl' else 'not determined' end
    -> as sex
    -> from sample37;
+------+----------------+
| code | sex            |
+------+----------------+
|    1 | man            |
|    2 | girl           |
| NULL | not determined |
+------+----------------+
3 rows in set (0.010 sec)

mysql> select * from sample41;
Empty set (0.038 sec)

mysql> desc sample41;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| no    | int         | NO   |     | NULL    |       |
| a     | varchar(30) | YES  |     | NULL    |       |
| b     | date        | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.027 sec)

mysql> insert into sample41 valuse(1,'abc','2025-09-21');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'valuse(1,'abc','2025-09-21')' at line 1
mysql> insert into sample41 values(1,'abc','2025-09-21');
Query OK, 1 row affected (0.095 sec)

mysql> select * from sample41;
+----+------+------------+
| no | a    | b          |
+----+------+------------+
|  1 | abc  | 2025-09-21 |
+----+------+------------+
1 row in set (0.008 sec)

mysql> insert into sample41(no,a) values(2,'xyz');
Query OK, 1 row affected (0.108 sec)

mysql> select * from sample41;
+----+------+------------+
| no | a    | b          |
+----+------+------------+
|  1 | abc  | 2025-09-21 |
|  2 | xyz  | NULL       |
+----+------+------------+
2 rows in set (0.008 sec)

mysql> delete from sample41 where no=2;
Query OK, 1 row affected (0.076 sec)

mysql> select * from sample41;
+----+------+------------+
| no | a    | b          |
+----+------+------------+
|  1 | abc  | 2025-09-21 |
+----+------+------------+
1 row in set (0.009 sec)

mysql> insert into sample41(no,a) values(2,'xyz2');
Query OK, 1 row affected (0.070 sec)

mysql> select * from sample41;
+----+------+------------+
| no | a    | b          |
+----+------+------------+
|  1 | abc  | 2025-09-21 |
|  2 | xyz2 | NULL       |
+----+------+------------+
2 rows in set (0.008 sec)

mysql> update sample41 set b='2015-09-20' where no=2;
Query OK, 1 row affected (0.075 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from sample41;
+----+------+------------+
| no | a    | b          |
+----+------+------------+
|  1 | abc  | 2025-09-21 |
|  2 | xyz2 | 2015-09-20 |
+----+------+------------+
2 rows in set (0.008 sec)

mysql> update sample41 set no=no+1;
Query OK, 2 rows affected (0.056 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from sample41;
+----+------+------------+
| no | a    | b          |
+----+------+------------+
|  2 | abc  | 2025-09-21 |
|  3 | xyz2 | 2015-09-20 |
+----+------+------------+
2 rows in set (0.008 sec)

mysql> exit;
Bye