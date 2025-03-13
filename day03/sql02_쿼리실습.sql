--
-- 79페이지 SUBSTR, INSTR퀴즈
-- SUBSTR - 문자열 특정부분 출력 -> tel의 첫번째 부터 INSTR -> tel의 )까지 -> -1은 뒤에서 한자리 제거
SELECT name,  tel, SUBSTR(tel, 1, INSTR(tel, ')') - 1) AS "AREA CODE"
  FROM student
 WHERE deptno1 = 201;

-- 81페이지 LPAD 퀴즈
-- LPAD - ename의 크기를 9바이트만큼 설정 후 부족한 바이트는 왼쪽부터 12345를 채워 9바이트로 만듦
SELECT ename, LPAD(ename, 9, '12345')
  FROM emp
 WHERE deptno = 10;

-- 82페이지 RPAD 퀴즈
--
SELECT ename, RPAD(ename)
  FROM emp
 WHERE deptno = 10;

-- 84페이지 REPLACE 퀴즈1
-- ename의 2,3 번째 문자를 SUBSTR로 선택을하고 --로 REPLACE시킴
SELECT ename AS NAME, REPLACE(ename, SUBSTR(ename, 2, 3), '--')
  FROM emp
 WHERE deptno = 20;

-- 84페이지 REPLACE 퀴즈2
-- student에서 name과 jumin을 출력하면서 jumin의 7번째 부터 13번째 까지를 -/-/-/-로 replace
SELECT name, jumin, REPLACE(jumin, SUBSTR(jumin, 7, 13), '-/-/-/-') AS "REPLACE"
  FROM student
 WHERE deptno1 = 101;

-- 85페이지 REPLACE 퀴즈3
--
SELECT name, tel, REPLACE(tel, SUBSTR(tel, INSTR(tel, '-') - 3, '***') AS "REPLACE"
  FROM student
 WHERE deptno1 = 102;