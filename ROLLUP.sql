ROLLUP함수


--****ROLLUP 함수****
--부서별,직업별 급여의 합을 구함
SELECT 
DEPTNO,JOB,SUM(SAL)
FROM SCOTT.EMP
GROUP BY DEPTNO,JOB;

--전체 급여의 합만 출력
SELECT DEPTNO,JOB,SUM(SAL)
FROM SCOTT.EMP e 
GROUP BY ROLLUP((DEPTNO,JOB));

--부서별 급여의 합만 출력
SELECT DEPTNO,JOB,SUM(SAL)
FROM SCOTT.EMP e 
GROUP BY DEPTNO,ROLLUP(JOB);

-->> 1번 그룹 : DEPTNO + JOB, 2번 그룹 :DEPTNO


SELECT DEPTNO,COUNT(*) AS C1
FROM SCOTT.EMP 
WHERE SAL>2000
GROUP BY ROLLUP(DEPTNO)
ORDER BY 1;



DEPTNO 	C1
10		2
20		2
30		1
NULL	5(총계)


SELECT DEPTNO,JOB,COUNT(*) AS C1
FROM SCOTT.EMP 
WHERE SAL>2000
GROUP BY ROLLUP(DEPTNO,JOB)
ORDER BY 1,2;

DEPTNO JOB
10	MANAGER		1
10	PRESIDENT	1
10	  NULL		2
20	ANALYST		1
20	MANAGER		1
20	  NULL		2
30	MANAGER		1
30	  NULL		1
				5

SELECT * FROM SCOTT.EMP WHERE SAL>2000;
					