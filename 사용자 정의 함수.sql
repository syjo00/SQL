--월말일 처리

CREATE OR REPLACE FUNCTION fnc_add_months(i_date IN DATE,i_integer IN number)
RETURN DATE
IS 
l_date DATE:= ADD_MONTHS(i_date,i_integer);
BEGIN 
	RETURN CASE
		   WHEN TO_CHAR(i_date,'DD') < TO_CHAR(l_date,'DD')
		   THEN i_date + NUMTOYMINTERVAL(i_integer,'MONTH') --날짜사이의 기간을 년월 형태로 표현
		   ELSE l_date
END;

END fnc_add_month;

DROP FUNCTION fnc_add_months;

-- NUMTOYMINTERVAL(i_integer,'MONTH') --날짜사이의 기간을 년월 형태로 표현

SELECT fnc_add_months (DATE '2050-01-15',-1) AS C1
	  ,fnc_add_months (DATE '2050-01-31',1) AS C2
	  ,fnc_add_months (DATE '2050-02-28',1) AS C3
FROM DUAL;


--에러내용 : SQL Error [6575] [65000]: ORA-06575: Package or function FNC_ADD_MONTHS is in an invalid state
