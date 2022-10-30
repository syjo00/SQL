--NULL조건
SELECT ename,comm FROM scott.emp where(comm IS NULL OR comm=0);

--comm이 null이거나 0인행을 조회한다.
SELECT ename,comm FROM scott.emp WHERE nvl(comm,0) = 0;