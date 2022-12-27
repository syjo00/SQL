--HAING절

SELECT SUM(SAL) AS SAL FROM SCOTT.EMP WHERE SUM(SAL) >25000;

SELECT SUM(sAL) AS SAL FROM SCOTT.EMP HAVING SUM(SAL)>25000;
 
SELECT DEPTNO,SUM(SAL) AS SAL
FROM SCOTT.EMP
GROUP BY DEPTNO 
HAVING SUM(SAL)>1000;

SELECT DEPTNO,SUM(SAL) AS SAL
FROM SCOTT.EMP
GROUP BY DEPTNO 
HAVING MAX(SAL) >= 5000;

