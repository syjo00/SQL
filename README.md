# SQL error 정리
```
[operator]
SELECT LAST + FIRST FROM tblComedian; 
--  ORA-01722: invalid number
```
- 에러원인 : "+"문자를 사용할 수 없음. 
- 문자열 연산자 : concat, '문자열'+'문자열'(X), '문자열'||'문자열'(O)
- 올바른 방법 : LAST||FIRST FROM tblComedian;  

```
[operator]
SELECT FIRST,weight > 65 FROM tblComedian;
-- ORA-00923: FROM keyword not found where expected
```
- 에러원인 : 비교연산은 컬럼 리스트에 작성할 수 없다.
- 올바른 방법 : SELECT FIRST,weight FROM tblComedian WHERE weight>65;

```
[aggregation_function]
SELECT count(name),name FROM tblCountry;
--SQL Error [937] [42000]: ORA-00937: not a single-group group function
```
- 에러원인 : 컬럼리스트에 집계함수와 단일함수는 함께 사용할 수 없다.
- 올바른 방법 : select count(name) from tblCountry; or select name from tblCountry;

```
[aggregation_fuction]
SELECT * FROM tblInsa WHERE basicpay > avg(basicpay);
--SQL Error [934] [42000]: ORA-00934: group function is not allowed here
```
- 에러 원인 : where절에는 집계함수(count,sum,avg,max,min)를 사용할 수 없다.

```
[aggregation_fuction]

FIRST  |LAST|GENDER|HEIGHT |WEIGHT|  NICK  |
재석   |유   |m     |   178|    64|메뚜기   |
명수   |박   |m     |   172|    66|하찮은   |
준하   |정   |m     |   184|    89|정중앙   |
동훈   |하   |m     |   169|    65|상꼬마   |
형돈   |정   |m     |   173|    85|미존개오 |
나래   |박   |f     |   148|    58|박가래   |
국주   |이   |f     |   167|    92|김태우   |
세호   |조   |m     |   167|    82|프로 억울러|
준현   |김   |m     |   182|   113|백돼지   |
민상   |유   |m     |   183|   129|이십끼   |

SELECT sum(first) FROM tblComedian;
--SQL Error [1722] [42000]: ORA-01722: invalid number;
```
- 에러원인 : sum()은 sum(컬럼명)으로 입력해야 하며 컬럼의 데이터는 숫자형식이어야 한다. 

```
select jikwi, --> 이름의 이름이 뭐니? (집단)--집합데이터
name, --> 집합데이터가 아님(개별 레코드 기준)
count(jikwi) --> 이 그룹은 몇명이니?(집단)--집합데이터
from tblinsa
group by jikwi;
-- ORA-00979: not a GROUP BY expression(name컬럼 때문에)
```
- 에러원인 : jikwi와 count(jikwi)컬럼은 집합데이터이지만 name컬럼은 개인데이터이기 때문에
- [group by를 사용한 select 절에서 사용할 수 있는  표현]  1. 집계함수 2. group by한 컬럼

```
[subquery]

select * from tblCountry;

NAME   |CAPITAL |POPULATION|CONTINENT|AREA|
-------+--------+----------+---------+----+
대한민국   |서울      |      4405|AS       |  10|
중국     |베이징     |    120660|AS       | 959|
일본     |도쿄      |     12461|AS       |  37|
미국     |워싱턴     |     24963|SA       | 936|
영국     |London  |      5741|EU       |  24|
이집트    |카이로     |      5969|AF       |  99|
오스트레일리아|Canberra|      1787|AU       | 768|
칠레     |산티아고    |      1339|SA       |  75|
우루과이   |몬테비디오   |       317|SA       |  17|
아르헨티나  |부에노스아이레스|      3388|SA       | 278
인도네시아  |자카르타    |     19134|AS       | 191|
네덜란드   |암스테르담   |      1476|EU       |   4|
케냐     |나이로비    |          |AF       |  58|
벨기에    |브뤼셀     |      1012|EU       |   3|

select name from tblCountry where population = max(population)
-- SQL Error [934] [42000]: ORA-00934: group function is not allowed here
```
- 에러원인 : 집계함수(count(),sum(),avg(),max(),min())를 허용되지 않는 위치에 사용했다.
```

[DDL]
create table tblMemo (

seq number(3) not null,
name varchar2(30) not null,
memo varchar2(1000) null,
regdate date null

);

insert into tblMemo (seq,name,memo,regdate) values(1,null,'메모입니다.',sysdate);
--ORA-01400: cannot insert NULL into ("SYSTEM"."TBLMEMO"."NAME")
```
- 에러원인 : name은 not null로 필수값인데 'null'값을 삽입하려고 했기 때문에 에러가 발생했다.
              
```
[DDL]

CREATE TABLE tblMemo(

--모든 테이블에는 PK가 반드시 있어야 한다. 
seq number(3) PRIMARY KEY, --기본키(PK) -> 중복값을 가질 수 없다.(Unique) + NOT NULL ->완벽한 식별자
name varchar2(30),
memo varchar2(1000),
regdate DATE 

);

--현재 상태는 레코드를 구분할 방법이 없다.***
INSERT into tblMemo(seq,name,memo,regdate) VALUES (1,'홍길동','메모입니다.',sysdate);
INSERT INTO tblMemo(seq,name,memo,regdate) VALUES (2,'아무개','메모입니다.',sysdate);
INSERT into tblMemo(seq,name,memo,regdate) VALUES (1,'홍길동','메모입니다.',sysdate);
--ORA-00001: unique constraint (SYSTEM.SYS_C007216) violated
```
- 에러원인 : pk를 동일하게 하여 무결성 제약조건을 위배하였다.

```
[DDL] not null

CREATE TABLE tblMemo(

. 
seq number(3) not null,
name varchar2(30),
memo varchar2(1000),
regdate DATE 

);

INSERT INTO tblMemo(seq,name,memo,regdate) VALUES (NULL,'아무개','메모입니다.',sysdate);
--ORA-01400: cannot insert NULL into ("SYSTEM"."TBLMEMO"."SEQ")
```
- 에러원인 : seq는 필수 입력해야 하는 값이기 때문에 null값을 삽입할 수 없다.

```
[DDL] unique

CREATE TABLE tblMemo(

	seq number(3) PRIMARY KEY,
	name varchar2(30) UNIQUE, -- 중복값 금지, 식별자로는 사용할 수없다.(null값 허용)
	memo varchar2(1000),
	regdate DATE NULL
	
);

INSERT INTO tblMemo(seq,name,memo,regdate) values(1,'홍길동','메모입니다.',sysdate);
INSERT INTO tblMemo(seq,name,memo,regdate) values(2,'아무개','메모입니다.',sysdate);
INSERT INTO tblMemo(seq,name,memo,regdate) values(3,'홍길동','메모입니다.',sysdate);
--ORA-00001: unique constraint (SYSTEM.SYS_C007218) violated
```
- 에러원인 : name은 unique 때문에 값(홍길동)이 중복될 수 없다.

```
[DDL] check

DROP TABLE tblMemo;

CREATE TABLE tblMemo(

	seq number(3) PRIMARY KEY,
	name varchar2(20),
	memo varchar2(1000),
	regdate DATE,
	lv NUMBER NOT NULL check(lv>=1  AND lv<=5) --숫자(메모 중요도),1~5

);

INSERT INTO tblMemo(seq,name,memo,regdate,lv) values(1,'홍길동','메모입니다.',sysdate,1);
INSERT INTO tblMemo(seq,name,memo,regdate,lv) values(1,'홍길동','메모입니다.',sysdate,10);
-- ORA-02290: check constraint (SYSTEM.SYS_C007220) violated
```
- 에러원인 : lv의 범위는 1~5까지로 정의되었기 때문에 10은 제약조건을 위배하였다.

```
[insert]

create table tblMemo (
	
	seq number(3) primary key,
	name varchar2(30) default '익명' not null,
	memo varchar2(1000) not null,
	regdate date default sysdate null
);

insert into tblMemo(seq,name,memo,regdate) values (seqMemo.nextVal,'홍길동',sysdate);
-- 00947. 00000 -  "not enough values"

insert into tblmemo(seq,name,regdate) values (seqMemo.nextVal,'홍길동','메모입니다.',sysdate);
--  00913. 00000 -  "too many values"
```
- 에러원인 : 컬럼과 값의 개수가 일치하지 않아서 발생한 에러이다.

```
[group by]

select  jikwi, -- 집합데이터(그룹기준)
	name, -- 개인데이터(개별레코드 기준)
	count(*) -- 집합데이터(그룹기준)
from tblinsa
	group by jikwi;
	
--ORA-00979: not a GROUP BY expression
```
- 에러원인 : name컬럼은 개인데이터이기 때문에 select절에서 사용할 수 없다.
- group by를 사용한 select절에서 사용할 수 있는 표현 : 집계함수, group by한 컬럼 

```
[alter]

create table tblEdit(
	seq number primary key,
	data varchar2(20) not null
);

insert into tblEdit values(1,'마우스');
insert into tblEdit values(2,'키보드');
insert into tblEdit values(3,'모니터');

-- <새로운 컬럼 추가하기> alter table tblEdit add(추가컬럼정의); 

alter table tblEdit add(price number(5) null);
--> null컬럼 추가

alter table tblEdit add(description varchar2(100) not null);
-- 1.SQL Error [1758] [42000]: ORA-01758: table must be empty to add mandatory (NOT NULL) column

INSERT INTO tblEdit values(4,'올해 새롭게 출시된 초경량 노트북');
-- 2. ORA-12899: value too large for column "SYSTEM"."TBLEDIT"."DATA" (actual: 46, maximum: 20)


-- < 컬럼의 길이 수정하기(확장,축소) >
alter table tblEdit modify (data varchar2(50));
-- 3. ORA-01441 : cannot decrease column length because some value is too big

```
- 1.에러원인 : not null컬럼을 추가하기 위해서는 테이블에 데이터가 없어야 한다.
- 2.에러원인 : data값이 너무 커서 삽입할 수 없다.
- 3.에러원인 : value 값이 너무 크기 때문에 컬럼의 길이를 줄일 수 없다. 

```
[PL-SQL]

declare 
num number; -- 숫자형
name varchar2(30); --문자형
today date;--날짜형

begin
    num:=10;
    dbms_output.put_line(num); --sysout
    
    num:='홍길동';
    dbms_output.put_line(name);
    -- ※ error : PL/SQL: numeric or value error: character to number conversion error
    
    
    today:='2021-05-26'; --리터럴 -> 암시적 형변환
    dbms_output.put_line(today);
    
    today:=to_date('2021-05-26','yyyy-mm-dd'); -- FM
    dbms_output.put_line(today);
    
    today:=sysdate;
    dbms_output.put_line(today);    
end;
```
- 에러 원인 : num은 숫자형이고 num에 초기화한 변수 '홍길동'은 문자형이기 때문에 위와 같은 에러가 발생했다.
- 해결 방법 : name :='홍길동';으로 변경하면 된다.

```
[PL-SQL]

declare
vbuseo varchar2(15);

begin

select buseo into vbuseo from tblinsa where name = '홍길동'
dbms_output.put_line('결과 : ' vbuseo);

dbms_output.put_line('결과 : ' buseo);
    --  ※ error : ANSI-SQL 식별자 PLS-00201: identifier 'BUSEO' must be declared
   
end;

```
- 에러원인 : PL/SQL 블럭내부에서는 ANSI-SQL의 식별자(테이블명, 컬럼명 등)를 직접 사용할 수 없다.

```
[PL-SQL for loop]

begin
    -- i: 루프변수
    -- in: 연결 키워드
    -- 1 : 초깃값
    -- ...: 증가
    
    for i in 1..10 loop
    
    dbms_output.put_line(i);
    i:=i+1;
    -- ※ error: PLS-00363: expression 'I' cannot be used as an assignment target.
    
    end loop; 
end;
```

- 에러 원인 :  Oracle 에서 Procedure 나 Function 호출할때 인자(Parameter)를 잘못 준 경우에 발생한다.
- 해결방법 : 아래처럼 적는다.

```
	begin

		    for i in reverse 1..10 loop

		         dbms_output.put_line(i);

		end loop;
	end;	
```
```
[복합키]

create table tblGugudan(

 dan number not null primary key,
 num number not null primary key
 -- ※ error : ORA-02260: table can have only one primary key

);

```
- 에러원인 : 한개의 테이블은 한개의 기본키만 가질 수 있다.
- 해결방법 : 아래 처럼 적는다.

```
     1.첫번째 방법

	create table tblGugudan(

	dan number not null,
	num number not null,
	result number not null,

	constraint tblGugudan_dan_num_pk primary key(dan,num) -- 복합키

	);

     2. 두번째 방법

	create table tblGugudan(

	 dan number not null,
	 num number not null,
	 result number not null

	);   

	alter table tblGugudan
	   add constraint tblGugudan_dan_num_pk primary key(dan,num) --복합키	

```

```
[예외처리부]

declare
    vnum number;
    vname number;
begin

    dbms_output.put_line('시작');
    
    select name into vname from tblInsa where num =1001;
    dbms_output.put_line(vname);
    -- ※ 1.error : ORA-06502: PL/SQL: numeric or value error: character to number conversion error   
    
        vnum := 0;
    
    -- ※ 2.error : ORA-01476: divisor is equal to zero
    dbms_output.put_line(100 / vnum);
    
    dbms_output.put_line('끝');

exception   
    
    when VALUE_ERROR then
        dbms_output.put_line('자료형 불일치');
    
    when zero_divide then
        dbms_output.put_line('0으로 나누려고 함');
    
    when others then -- catch (Exception e) : 모든 종류의 예외 처리
        dbms_output.put_line('예외처리');

end;
```
- 1.에러원인 : 변수를 선언할 때 vname을 숫자형으로 선언했는데 name컬럼(문자형)에 넣으려고 했기 때문에
- 2.에러원인 : 0으로 나눌 수 없다.
    


