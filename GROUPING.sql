SELECT AVG(SUM(sal))AS sal
FROM scott.emp
WHERE sal>2000
group BY deptno;

SELECT avg(sal) AS c1
FROM scott.emp
WHERE sal>2000;


SELECT deptno FROM scott.emp GROUP BY deptno;