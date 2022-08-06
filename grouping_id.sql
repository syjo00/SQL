SELECT DEPTNO,JOB,COUNT(*) AS C1
	   ,GROUPING (DEPTNO) AS G1
	   ,GROUPING(JOB) AS G2
FROM SCOTT.EMP
WHERE SAL>2000
GROUP BY ROLLUP(DEPTNO,JOB)
ORDER BY 1,2;

SELECT CASE WHEN GROUPING(DEPTNO) =1 AND GROUPING(JOB)=1
			THEN 'TOTAL'
			ELSE TO_CHAR(DEPTNO)
		END AS DEPTNO,
		CASE WHEN GROUPING(DEPTNO)=0 AND GROUPING(JOB)=1
			THEN 'ALL'
			ELSE JOB
		END AS JOB,
		COUNT(*) AS C1,GROUPING(DEPTNO) AS G1,GROUPING(JOB) AS G2
FROM SCOTT.EMP
WHERE SAL>200
GROUP BY ROLLUP(DEPTNO,JOB)
ORDER BY 4,5,1,2;

--GROUPIN_ID 함수
SELECT  DECODE(GROUPING_ID(DEPTNO,JOB),3,'TOTAL',TO_CHAR(DEPTNO)) AS DEPTNO,
		DECODE(GROUPING_ID(DEPTNO,JOB),1,'ALL',JOB) AS JOB,
		COUNT(*) AS C1,
		GROUPING(DEPTNO) AS G1,
		GROUPING(JOB) AS G2,
		GROUPING_ID(DEPT_NO,JOB) AS GI,
		BIN_TO_NUM(GROUPING(DEPTNO),GROUPING(JOB)) AS bn
FROM EMP
WHERE SAL>2000
GROUP BY ROLLUP(DEPTNO,JOB)
;

--GROUP_ID 함수
SELECT DEPTNO,JOB,COUNT(*) AS C1,GROUP_ID () AS GI
FROM SCOTT.EMP 
WHERE SAL > 2000
GROUP BY DEPTNO,ROLLUP(DEPTNO,JOB);