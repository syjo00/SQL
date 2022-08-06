--CAST함수

SELECT  CAST('123' 	AS VARCHAR2(5))AS C1,
		CAST('123.456' AS NUMBER(6,3)) AS C2,
		CAST('2050-01-02'AS DATE) AS C3,
		CAST('2050-01-02 12:34:56' AS TIMESTAMP(2)) AS C4,
		CAST('2050-01-02 12:34:56 +08:00' AS TIMESTAMP(2) WITH TIME ZONE) AS C5
FROM DUAL;

--지정한 데이터 타입으로 변환할 수 있으면 1, 변환할 수 없으면 0
SELECT VALIDATE_CONVERSION('20500131' AS DATE, 'YYYYMMDD') AS C1
	   ,VALIDATE_CONVERSION('20500131' AS DATE, 'YYYYMMDD') AS C2
FROM DUAL;	   


SELECT VALIDATE_CONVERSION('2021-11-11' AS DATE, 'YYYY-MM-DD') FROM DUAL;

select * from v$version;