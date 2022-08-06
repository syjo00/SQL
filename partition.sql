--슈도칼럼
SELECT deptno,rowid AS c1 FROM scott.dept;

SELECT empno,job,sal
	   ,sum(sal)over(PARTITION BY job) AS c1
       ,sum(sal)over()AS c2
FROM scott.emp
WHERE deptno = 30
ORDER BY 2,1; --2번쨰,1번째 컬럼 순으로 오름차순 정렬


SELECT empno,sal,sum(sal) over(ORDER BY sal,empno) AS c1
FROM scott.EMP
WHERE deptno = 30
ORDER BY 2,1; --ORDER BY 절로 파티션 내의 정렬순서 지정