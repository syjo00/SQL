# SQL error 정리
```
SELECT LAST + FIRST FROM tblComedian; 
-- error : ORA-01722: invalid number
```
- 에러원인 : "+"문자를 사용할 수 없음. 
- 문자열 연산자 : concat, '문자열'+'문자열'(X), '문자열'||'문자열'(O)
- 올바른 방법 : LAST||FIRST FROM tblComedian;  
