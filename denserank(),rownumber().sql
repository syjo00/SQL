--dense rank()
SELECT empno,ename,sal,dense_rank() over(ORDER BY sal) AS c1
FROM scott.EMP 
WHERE deptno = 30
ORDER BY  3,1;

--rownumber()

SELECT empno,ename,sal
	  ,ROW_number() over(ORDER BY sal) AS c1
	  ,ROW_NUMBER() over(ORDER BY sal,empno) AS c2
FROM scott.emp
WHERE deptno = 30
ORDER BY 3,1;

--가장 최근에 입사한 사원 출력
SELECT empno,ename,sal,deptno,hiredate
FROM (SELECT a.*
			,ROW_NUMBER() OVER(PARTITION BY deptno
							   ORDER BY hiredate DESC,empno DESC)AS rn
	  FROM scott.emp a)
WHERE rn=1;	  

--rownumber(),rank(),dense_Rank()

SELECT empno,ename,sal,
row_number() over(ORDER BY sal) AS c1,
RANK() OVER (ORDER BY sal) AS c2,
DENSE_rank() OVER (ORDER BY sal) AS c3
FROM SCOTT.EMP
WHERE DEPTNO = 30
ORDER BY 2,1;