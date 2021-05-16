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





