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
