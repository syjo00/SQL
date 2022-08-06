--
WITH w1 AS (SELECT TIMESTAMP '2050-01-02 12:34:56.789' AS dt FROM dual)
SELECT 	EXTRACT (YEAR FROM dt) AS c1,extract(MONTH FROM dt) AS c2
	   ,EXTRACT (DAY FROM dt) AS C3,EXTRACT(HOUR FROM DT) AS C4
	   ,EXTRACT (MINUTE FROM dt)AS C5,EXTRACT(SECOND FROM DT) AS C6
FROM W1;

WITH W1 AS (SELECT TO_DATE('2051-08-16 12:31:31','YYYY-MM-DD HH24:MI:SS') AS DT
		 FROM DUAL)
SELECT ROUND(DT) AS C1,ROUND(DT,'DD') AS CC2 FROM W1; 			


SELECT TO_TIMESTAMP('2050-01-02 12:34:56','YYYY-MM-DD HH24:MI:SS.FF3') AS C1
FROM DUAL;

-- YEAR TO MONTH
SELECT TO_YMINTERVAL('1-11') AS C1,TO_YMINTERVAL('P1Y11M') AS C2 FROM DUAL; 

--DAY TO SECOND
SELECT TO_DSINTERVAL ('1 23:59:59.999999') AS C1
	   ,TO_DSINTERVAL('P1DT23H59M59.99999S')AS C2
FROM DUAL;	   

SELECT NUMTOYMINTERVAL(2,'YEAR') AS C1,NUMTOYMINTERVAL(23,'MONTH')AS C2
FROM DUAL;


SELECT NUMTODSINTERVAL(10,'DAY')AS C1,NUMTODSINTERVAL(24,'HOUR')AS C2
	,NUMTODSINTERVAL(60,'MINUTE')AS C3,NUMTODSINTERVAL(60,'SECOND') AS C4
	,NUMTODSINTERVAL() 