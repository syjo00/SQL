--LNNVL함수 : 해당 컬럼에 NULL이 존재할 경우 해당 NULL 데이터도 함께 조회되도록 하기 위함.
---------->> LNNVL 함수 내부 조건은 조회하려고 하는 조건의 반대조건으로 부여하는 거을 기억해야 한다.

--LNNVL(COMM<>0) :COMM이 NULL이거나 0인행을 조회한다.

SELECT ENAME,COMM FROM SCOTT.EMP WHERE LNNVL(COMM<>0);

--LNNVL(COMM>300) =  COMM이 300이하의 직원을 조회하는 쿼리 = NVL(COMM,0)<=300 = comm is null or comm <=300
SELECT ENAME,JOB,COMM
FROM SCOTT.EMP e 
WHERE DEPTNO = 30
AND LNNVL(COMM>300); 


SELECT ENAME,JOB,COMM
FROM SCOTT.EMP e 
WHERE DEPTNO = 30
AND  NVL(COMM,0)<=300 ; 



--조건 우선순위 : 연산자 > 비교조건 >IN,LIKE,BETWEEN,NULL>NOT > AND >OR
SELECT ENAME,DEPTNO,JOB
FROM SCOTT.EMP e
WHERE JOB = 'CLERK'
AND (DEPTNO = 10 OR DEPTNO = 20);

