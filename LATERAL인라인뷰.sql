SELECT a.deptno,b.dname,b.empno,b.ename
FROM scott.dept a,
	(SELECT x.* FROM scott.emp x WHERE x.deptno = a.deptno) b;

-- SQL Error [904] [42000]: ORA-00904: "A"."DEPTNO": invalid identifier

SELECT a.deptno,b.dname,b.empno,b.ename
FROM scott.dept a,
	(SELECT x.* FROM scott.emp x) b;

SELECT * FROM scott.dept; --A.DEPTNO
SELECT * FROM scott.emp; --EMPNO,ENAME,JOB,MRG,HIREATE,SAL,COMM,DEPTNO

--12.1 버전부터 가능
SELECT A.DEPTNO,A.DNAME,B.EMPNO,B.ENAME
FROM SCOTT.DEPT A
	,LATERAL
	(SELECT X.* FROM SCOTT.EMP X WHERE X.DEPTNO = A.DEPTNO) B;
	
SELECT a.deptno,b.dname,b.empno,b.ename
FROM scott.dept a,
	(SELECT x.* FROM scott.emp x WHERE x.deptno = a.deptno)(+) b; 

SELECT a.deptno,b.dname,b.sal
FROM scott.dept a,
	LATERAL
	(SELECT sum(x.sal) AS sal FROM emp x WHERE x.deptno = a.deptno) b;

SELECT a.deptno , a.dname, b.sal
FROM scott.dept a,
lateral(SELECT sum(x.sal) FROM scott.emp x WHERE x.deptno = a.deptno) GROUP by()) b;



	







