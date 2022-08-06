--순위함수
select sal
FROM scott.emp
WHERE deptno = 30
ORDER BY sal;

SELECT sal,COMM
FROM scott.emp
WHERE deptno =30
ORDER BY sal,comm;

--Rank함수

SELECT rank(1500) WITHIN GROUP (ORDER BY sal) AS c1, --sal이 1500이므로 4위
	   rank(1500,500)WITHIN GROUP (ORDER BY sal,comm) AS c2 --sal이 1500,comm이 500이므로 5위
FROM scott.emp
WHERE deptno = 30;



SELECT DENSE_RANK (1500) WITHIN GROUP (ORDER BY sal) AS c1
	,DENSE_RANK (1500,500) WITHIN GROUP (ORDER BY sal,comm) AS c2
FROM scott.emp
WHERE deptno=30;

--keep 키워드
SELECT ename,sal,hiredate FROM scott.emp WHERE deptno = 20 ORDER BY 2,3,1;

SELECT min(hiredate) keep(DENSE_RANK FIRST ORDER BY sal) AS c1,
max(hiredate) keep(DENSE_RANK FIRST ORDER BY sal) AS c2,
min(hiredate) keep(DENSE_RANK LAST ORDER BY sal) AS c3,
max(hiredate) keEp(DENSE_Rank LAST ORDER BY sal) AS c4
FROM scott.emp WHERE deptno = 20;