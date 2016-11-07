create database study;
use study;
-- 查询练习- -----------

-- 学生表
CREATE TABLE stu (
  sid	CHAR(6),
  sname		VARCHAR(50),
  age		INT,
  gender	VARCHAR(50)
);

INSERT INTO stu VALUES('S_1001', 'liuYi', 35, 'male');
INSERT INTO stu VALUES('S_1002', 'chenEr', 15, 'female');
INSERT INTO stu VALUES('S_1003', 'zhangSan', 95, 'male');
INSERT INTO stu VALUES('S_1004', 'liSi', 65, 'female');
INSERT INTO stu VALUES('S_1005', 'wangWu', 55, 'male');
INSERT INTO stu VALUES('S_1006', 'zhaoLiu', 75, 'female');
INSERT INTO stu VALUES('S_1007', 'sunQi', 25, 'male');
INSERT INTO stu VALUES('S_1008', 'zhouBa', 45, 'female');
INSERT INTO stu VALUES('S_1009', 'wuJiu', 85, 'male');
INSERT INTO stu VALUES('S_1010', 'zhengShi', 5, 'female');
INSERT INTO stu VALUES('S_1011', 'xxx', NULL, NULL);

-- 雇员表
CREATE TABLE emp(
  empno		INT,
  ename		VARCHAR(50),
  job		VARCHAR(50),
  mgr		INT,
  hiredate	DATE,
  sal		DECIMAL(7,2),-- 小数
  comm		DECIMAL(7,2),
  deptno		INT
) ;

INSERT INTO emp VALUES(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20);
INSERT INTO emp VALUES(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO emp VALUES(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30);
INSERT INTO emp VALUES(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20);
INSERT INTO emp VALUES(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
INSERT INTO emp VALUES(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30);
INSERT INTO emp VALUES(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,10);
INSERT INTO emp VALUES(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,NULL,20);
INSERT INTO emp VALUES(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,10);
INSERT INTO emp VALUES(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO emp VALUES(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,NULL,20);
INSERT INTO emp VALUES(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30);
INSERT INTO emp VALUES(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20);
INSERT INTO emp VALUES(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);

CREATE TABLE dept(
  deptno		INT,
  dname		VARCHAR(14),
  loc		VARCHAR(13)
);
INSERT INTO dept VALUES(10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES(40, 'OPERATIONS', 'BOSTON');
SELECT * FROM dept;
SELECT * FROM emp;
SELECT * FROM stu;

-- DQL练习

-- 查询指定列
select sid,sname,age from stu;

-- 查询性别为女,且年龄大于等于50的记录
select * from stu where gender='female' and age>=50;

-- 查询学号为s_1001 或者姓名为liSi的记录
select * from stu where sid='s_1001'or sname='lisi';

-- 查询学号为001 002 003的记录 in的用法
select * from stu where sid in('S_1001','S_1002','S_1003');

-- 查询学号不是001 002 003的记录 in的用法
select * from stu where sid not in ('S_1001','S_1002','S_1003');

-- 查询年龄为null/not null的记录
select * from stu where age is NULL;
select * from stu where age is NOT NULL;

-- 查询年龄在20-40 between用法
select * from stu where age between 20 and 40;

-- 查询非男性记录
select * from stu where gender!='male';
select * from stu where gender='female';
select * from stu where gender<>'male'; -- <> not equal

-- 模糊查询 like关键字 '_'匹配任意一个字母,'%'匹配0-n个字母
select * from stu where sname like '_____';
select * from stu where sname like '____'; -- 5个字母构成,最后一个字母为i
select * from stu where sname like 'z%';-- 以z开头的
select * from stu where sname like '_i%';-- 第二个字母i开头
select * from stu where sname like '%a%';-- 字母中含有a的

select * from emp;
-- 字段控制查询
select distinct deptno from emp;-- 去除重复 distinct
select *,sal+comm from emp; -- 任何东西与null相加还是null
select *,sal+ifnull(comm,0) from emp;-- ifnull 用法
select *,sal+ifnull(comm,0) as total from emp; -- 给列起别名
select sname as 姓名 ,gender as 性别 from stu;-- 给列起别名
select sname,sname 姓名 from stu;-- as可省略

-- 排序
select * from stu order by age asc;-- 升序
select * from stu order by age desc;-- 降序
select * from emp order by sal,empno desc;-- 按月薪升序排,月薪相同,按编号排降序

-- 聚合函数
-- 聚合函数是用来做纵向运算的函数

-- count()统计指定列不为null的记录行数
select count(*)from stu;
select count(comm)from emp;-- 查询emp表中有佣金的人数
select count(*)from emp where sal>2500;-- 查询月薪大于2500人数
select count(comm),count(mgr) from emp;-- 查询有佣金 有领导的人数
select count(*)from emp where comm is not null and mgr is not null;-- 查询有佣金且有领导的人数
-- sum()计算指定列的数据和,不是数值类型则为0
select sum(sal)from emp;
select sum(sal),sum(comm) from emp;
select sum(sal)+ifnull(comm,0) as 和 from emp;
select sum(sal),count(sal) from emp;
select sum(sal)/count(sal) as 平均工资 from emp;-- 计算出了平均工资
-- avg()计算平均值 min max 指定列的最大和最小,为字符串类型,使用字符串排序
select avg(sal) from emp;
select max(sal),min(sal)from emp;

-- 分组查询
-- 例如,查询每个部门的工资和
-- group by
select deptno,count(*),sum(sal) from emp group by deptno;
select deptno,count(*),sum(sal) from emp where sal>1500 group by deptno; -- 每个部门工资大于5000的人数
-- having
select deptno,count(*),sum(sal) from emp group by deptno having sum(sal)>9000;-- 查询总工资和大于9000的部门和编号
-- where 是分组前对数据进行过滤; having 分组后对数据进行过滤

-- limit
-- 用于限定查询结果的起始行和总行数,用于分页
select * from emp limit 3,10; -- 起始行从0开始




















