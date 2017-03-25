MySQL innodb_lock_wait 锁等待

 (2011-05-16 11:15:46)

![](MySQL_innodb_lock_wait_锁等待.files/image002.png)[转载▼](file://localhost/javascript/%3B)

标签：

[杂谈](http://search.sina.com.cn/?c=blog&q=???&by=tag)

分类： [Mysql](http://blog.sina.com.cn/s/articlelist_1807105182_3_1.html)

**MySQL 5.5 -- innodb_lock_wait ****锁 等待**

记得以前，当出现：ERROR 1205 (HY000): Lock wait timeout exceeded; try restarting
transaction，  
要解决是一件麻烦的事情 ；  
特别是当一个SQL执行完了，但未COMMIT，后面的SQL想要执行就是被锁，超时结束；  
DBA光从数据库无法着手找出源头是哪个SQL锁住了；  
有时候看看show engine innodb status , 并结合 show full processlist; 能暂时解决问题；但一直不能精确定位；

在5.5中，information_schema 库中增加了三个关于锁的表（MEMORY引擎）；  
innodb_trx ## 当前运行的所有事务  
innodb_locks ## 当前出现的锁  
innodb_lock_waits ## 锁等待的对应关系

看到这个就非常激动 ； 这可是解决了一个大麻烦，先来看一下表结构



  
[root@127.0.0.1](mailto:root@127.0.0.1) : information_schema 13:28:38> desc
innodb_locks;  
+-------------+---------------------+------+-----+---------+-------+  
| Field | Type | Null | Key | Default | Extra |  
+-------------+---------------------+------+-----+---------+-------+  
| lock_id | varchar(81) | NO | | | |#锁ID  
| lock_trx_id | varchar(18) | NO | | | |#拥有锁的事务ID  
| lock_mode | varchar(32) | NO | | | |#锁模式  
| lock_type | varchar(32) | NO | | | |#锁类型  
| lock_table | varchar(1024) | NO | | | |#被锁的表  
| lock_index | varchar(1024) | YES | | NULL | |#被锁的索引  
| lock_space | bigint(21) unsigned | YES | | NULL | |#被锁的表空间号  
| lock_page | bigint(21) unsigned | YES | | NULL | |#被锁的页号  
| lock_rec | bigint(21) unsigned | YES | | NULL | |#被锁的记录号  
| lock_data | varchar(8192) | YES | | NULL | |#被锁的数据  
+-------------+---------------------+------+-----+---------+-------+  
10 rows in set (0.00 sec)  
  
[root@127.0.0.1](mailto:root@127.0.0.1) : information_schema 13:28:56> desc
innodb_lock_waits;  
+-------------------+-------------+------+-----+---------+-------+  
| Field | Type | Null | Key | Default | Extra |  
+-------------------+-------------+------+-----+---------+-------+  
| requesting_trx_id | varchar(18) | NO | | | |#请求锁的事务ID  
| requested_lock_id | varchar(81) | NO | | | |#请求锁的锁ID  
| blocking_trx_id | varchar(18) | NO | | | |#当前拥有锁的事务ID  
| blocking_lock_id | varchar(81) | NO | | | |#当前拥有锁的锁ID  
+-------------------+-------------+------+-----+---------+-------+  
4 rows in set (0.00 sec)  
  
[root@127.0.0.1](mailto:root@127.0.0.1) : information_schema 13:29:05> desc
innodb_trx ;  
+----------------------------+---------------------+------+-----+-------------
--------+-------+  
| Field | Type | Null | Key | Default | Extra |  
+----------------------------+---------------------+------+-----+-------------
--------+-------+  
| trx_id | varchar(18) | NO | | | |#事务ID  
| trx_state | varchar(13) | NO | | | |#事务状态：  
| trx_started | datetime | NO | | 0000-00-00 00:00:00 | |#事务开始时间；  
| trx_requested_lock_id | varchar(81) | YES | | NULL | |#innodb_locks.lock_id  
| trx_wait_started | datetime | YES | | NULL | |#事务开始等待的时间  
| trx_weight | bigint(21) unsigned | NO | | 0 | |#  
| trx_mysql_thread_id | bigint(21) unsigned | NO | | 0 | |#事务线程ID  
| trx_query | varchar(1024) | YES | | NULL | |#具体SQL语句  
| trx_operation_state | varchar(64) | YES | | NULL | |#事务当前操作状态  
| trx_tables_in_use | bigint(21) unsigned | NO | | 0 | |#事务中有多少个表被使用  
| trx_tables_locked | bigint(21) unsigned | NO | | 0 | |#事务拥有多少个锁  
| trx_lock_structs | bigint(21) unsigned | NO | | 0 | |#  
| trx_lock_memory_bytes | bigint(21) unsigned | NO | | 0 | |#事务锁住的内存大小（B）  
| trx_rows_locked | bigint(21) unsigned | NO | | 0 | |#事务锁住的行数  
| trx_rows_modified | bigint(21) unsigned | NO | | 0 | |#事务更改的行数  
| trx_concurrency_tickets | bigint(21) unsigned | NO | | 0 | |#事务并发票数  
| trx_isolation_level | varchar(16) | NO | | | |#事务隔离级别  
| trx_unique_checks | int(1) | NO | | 0 | |#是否唯一性检查  
| trx_foreign_key_checks | int(1) | NO | | 0 | |#是否外键检查  
| trx_last_foreign_key_error | varchar(256) | YES | | NULL | |#最后的外键错误  
| trx_adaptive_hash_latched | int(1) | NO | | 0 | |#  
| trx_adaptive_hash_timeout | bigint(21) unsigned | NO | | 0 | |#  
+----------------------------+---------------------+------+-----+-------------
--------+-------+  
22 rows in set (0.01 sec)

下面我们来动手看看数据吧：  
##建立测试数据：  
use test;  
create table tx1  
(id int primary key ,  
c1 varchar(20),  
c2 varchar(30))  
engine=innodb default charset = utf8 ;

insert into tx1 values  
(1,'aaaa','aaaaa2'),  
(2,'bbbb','bbbbb2'),  
(3,'cccc','ccccc2');

commit;

###产生事务；  
### Session1  
start transaction;  
update tx1 set c1='heyf',c2='heyf' where id =3 ;

## 产生事务，在innodb_trx就有数据 ；  
[root@127.0.0.1](mailto:root@127.0.0.1) : information_schema 13:38:21> select
* from innodb_trx G  
*************************** 1. row ***************************  
trx_id: 3669D82  
trx_state: RUNNING  
trx_started: 2010-12-24 13:38:06  
trx_requested_lock_id: NULL  
trx_wait_started: NULL  
trx_weight: 3  
trx_mysql_thread_id: 2344  
trx_query: NULL  
trx_operation_state: NULL  
trx_tables_in_use: 0  
trx_tables_locked: 0  
trx_lock_structs: 2  
trx_lock_memory_bytes: 376  
trx_rows_locked: 1  
trx_rows_modified: 1  
trx_concurrency_tickets: 0  
trx_isolation_level: REPEATABLE READ  
trx_unique_checks: 1  
trx_foreign_key_checks: 1  
trx_last_foreign_key_error: NULL  
trx_adaptive_hash_latched: 0  
trx_adaptive_hash_timeout: 10000  
1 row in set (0.00 sec)

### 由于没有产生锁等待，下面两个表没有数据 ；  
[root@127.0.0.1](mailto:root@127.0.0.1) : information_schema 13:38:31> select
* from innodb_lock_waits G  
Empty set (0.00 sec)

[root@127.0.0.1](mailto:root@127.0.0.1) : information_schema 13:38:57> select
* from innodb_locks G  
Empty set (0.00 sec)

#### 产生锁等待  
#### session 2  
start transaction;  
update tx1 set c1='heyfffff',c2='heyffffff' where id =3 ;

  
[root@127.0.0.1](mailto:root@127.0.0.1) : information_schema 13:39:01> select
* from innodb_trx G  
*************************** 1. row ***************************  
trx_id: 3669D83 ##第2个事务  
trx_state: LOCK WAIT ## 处于等待状态  
trx_started: 2010-12-24 13:40:07  
trx_requested_lock_id: 3669D83:49:3:4 ##请求的锁ID  
trx_wait_started: 2010-12-24 13:40:07  
trx_weight: 2  
trx_mysql_thread_id: 2346 ##线程 ID  
trx_query: update tx1 set c1='heyfffff',c2='heyffffff' where id =3  
trx_operation_state: starting index read  
trx_tables_in_use: 1 ##需要用到1个表  
trx_tables_locked: 1 ##有1个表被锁  
trx_lock_structs: 2  
trx_lock_memory_bytes: 376  
trx_rows_locked: 1  
trx_rows_modified: 0  
trx_concurrency_tickets: 0  
trx_isolation_level: REPEATABLE READ  
trx_unique_checks: 1  
trx_foreign_key_checks: 1  
trx_last_foreign_key_error: NULL  
trx_adaptive_hash_latched: 0  
trx_adaptive_hash_timeout: 10000  
*************************** 2. row ***************************  
trx_id: 3669D82 ##第1个事务  
trx_state: RUNNING  
trx_started: 2010-12-24 13:38:06  
trx_requested_lock_id: NULL  
trx_wait_started: NULL  
trx_weight: 3  
trx_mysql_thread_id: 2344  
trx_query: NULL  
trx_operation_state: NULL  
trx_tables_in_use: 0  
trx_tables_locked: 0  
trx_lock_structs: 2  
trx_lock_memory_bytes: 376  
trx_rows_locked: 1  
trx_rows_modified: 1  
trx_concurrency_tickets: 0  
trx_isolation_level: REPEATABLE READ  
trx_unique_checks: 1  
trx_foreign_key_checks: 1  
trx_last_foreign_key_error: NULL  
trx_adaptive_hash_latched: 0  
trx_adaptive_hash_timeout: 10000  
2 rows in set (0.00 sec)

[root@127.0.0.1](mailto:root@127.0.0.1) : information_schema 13:40:12> select
* from innodb_locks G  
*************************** 1. row ***************************  
lock_id: 3669D83:49:3:4 ## 第2个事务需要的锁  
lock_trx_id: 3669D83  
lock_mode: X  
lock_type: RECORD  
lock_table: `test`.`tx1`  
lock_index: `PRIMARY`  
lock_space: 49  
lock_page: 3  
lock_rec: 4  
lock_data: 3  
*************************** 2. row ***************************  
lock_id: 3669D82:49:3:4 ## 第1个事务需要的锁  
lock_trx_id: 3669D82  
lock_mode: X  
lock_type: RECORD  
lock_table: `test`.`tx1`  
lock_index: `PRIMARY`  
lock_space: 49  
lock_page: 3  
lock_rec: 4  
lock_data: 3  
2 rows in set (0.00 sec)

[root@127.0.0.1](mailto:root@127.0.0.1) : information_schema 13:40:15> select
* from innodb_lock_waits G  
*************************** 1. row ***************************  
requesting_trx_id: 3669D83 ## 请求锁的事务  
requested_lock_id: 3669D83:49:3:4 ## 请求锁的锁ID  
blocking_trx_id: 3669D82 ## 拥有锁的事务  
blocking_lock_id: 3669D82:49:3:4 ## 拥有锁的锁ID  
1 row in set (0.00 sec)

  
哈哈，有了以上这些信息，以下问题就迎刃而解啦。  
当前有哪些事务在等待锁？ 这些锁需要锁哪些表，锁哪些索引，锁哪些记录和值 ？  
处于等待状态的相关SQL是什么？  
在等待哪些事务完成 ？  
拥有当前锁的SQL是什么？

我想这些SQL对DBA来说不难吧？ 大家自己动手吧。



