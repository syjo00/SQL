SELECT deptno,job,SUM(sal) AS sal
FROM scott.EMP e 
WHERE sal > 2000
GROUP BY deptno,JOB
ORDER BY 1,2;


SELECT ename,sal,comm FROM scott.emp WHERE deptno = 30 ORDER BY 2 DESC,3;

SELECT ename,to_char(hiredate,'yyyymmdd') hireyear,sal
FROM scott.EMP e
WHERE deptno =20
ORDER BY 2,hiredate;

SMITH	19801217	800
JONES	19810402	2975
FORD	19811203	3000
;

SELECT ename,to_char(hiredate,'yyyymmdd') hireyear,sal
FROM scott.EMP e
WHERE deptno =20
ORDER BY 2,sal;


SELECT JOB,SAL,DEPTNO FROM SCOTT.EMP WHERE DEPTNO >= 20
ORDER BY DECODE(JOB,'MANAGER',1,'CLERK',2)
,SAL;


SELECT DEPTNO,SAL,COMM FROM SCOTT.EMP WHERE DEPTNO IN (10,30)
ORDER BY DEPTNO,
		DECODE(DEPTNO,10,SAL) DESC,
		DECODE(DEPTNO,30,COMM),
		SAL;

