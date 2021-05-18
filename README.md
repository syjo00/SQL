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
- 에러원인 : 집계함수(count,sum,avg,max,min)를 허용되지 않는 위치에 사용했다.
```
             
              


