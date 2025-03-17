/*
 * 
 */
SELECT * FROM student;

SELECT * FROM department;

-- 단일행 서브쿼리 = <> > >= < <= 비교연산자로 비교.
-- join으로 두 테이블을  검색
SELECT s.name, d.dname
  FROM student s, department d
 WHERE s.deptno1 = d.deptno
   AND s.deptno1 = 103;

-- Anthony Hopkins 학생과 같은 학과에 다니는 학생을 모두 조회
SELECT s.name, d.dname
  FROM student s, department d
 WHERE s.deptno1 = d.deptno
   AND s.deptno1 = (SELECT deptno1
					  FROM student
					 WHERE name = 'Anthony Hopkins'); -- 학생 이름따라 학과번호 변경 가능

SELECT deptno1 FROM student WHERE name = 'Anthony Hopkins';

-- where절 서브쿼리에서 =으로 비교할 때 주의점
-- where절 서브쿼리는 다중행이 되면 안됨.
SELECT s.name, d.dname
  FROM student s, department d
 WHERE s.deptno1 = d.deptno
   AND s.deptno1 = (SELECT deptno1
					  FROM student);

-- 특정 교수의 입사일보다 뒤에 입사한 교수들의 정보 출력
SELECT *
  FROM professor;

SELECT *
  FROM department;

-- join되는 쿼리부터 생성.
-- 맥 라이언 교수 입사일자로 비교
SELECT p.name AS "PROF_NAME"
	 , p.hiredate
	 , d.dname AS "DEPT_NAME"
  FROM professor p, department d
 WHERE p.deptno = d.deptno
   AND p.hiredate > (SELECT hiredate
  					   FROM professor
 					  WHERE name = 'Meg Ryan';

SELECT hiredate
  FROM professor
 WHERE name = 'Meg Ryan'

COMMIT;

-- 다중행 서브쿼리
-- IN 서브쿼리 결과와 같은 값. 여러개(OR와 동일)
-- EXISTS 서브쿼리의 값이 있는 경우 메인쿼리를 수행
-- >ANY 서브쿼리 최솟값보다 메인쿼리의 큰 값을 조회
-- <ANY 서브쿼리 최댓값보다 메인쿼리의 작은 값을 조회
-- <ALL 서브쿼리 최댓값보다 메인쿼리의 큰 값을 조회
-- >ALL 서브쿼리 최솟값보다 메인쿼리의 작은 값을 조회

-- 지역이 Pohang Main Office인 부서코드에 해당하는 직원들의 사번, 이름, 부서번호를 출력하시오

SELECT *
  FROM dept2
 WHERE area = 'Pohang Main Office';

SELECT empno, name, deptno
  FROM emp2
 WHERE deptno IN (SELECT dcode
 				   FROM dept2
 				  WHERE area = 'Pohang Main Office');

-- emp2 테이블에서 'Section head' 직급의 최소 연봉보다 연봉이 높은 사람의 이르, 직급, 연봉을 출력하시오.
-- 단, 연봉은 $78,000,000 식으로 출력할 것

DELETE FROM emp2
 WHERE empno = '20000219';

COMMIT;

SELECT *
  FROM emp2
 WHERE EXISTS (SELECT *
 				 FROM emp2
 				WHERE POSITION = 'Section head');

SELECT *
  FROM emp2
 WHERE EXISTS (SELECT min(pay)
			     FROM emp2
			   	WHERE POSITION = 'Section head');

-- 서브쿼리 min함수 최솟값 스칼라에서 비교연산으로
SELECT name, POSITION
	 , to_char(pay, '999,999,999') AS "salary"
  FROM emp2
 WHERE pay > (SELECT min(pay)
 				FROM emp2
 			   WHERE POSITION = 'Section head');

-- >ANY로 서브쿼리 다중행에서 최솟값
SELECT name, POSITION
	 , to_char(pay, '999,999,999') AS "salary"
  FROM emp2
 WHERE pay < ANY (SELECT pay
 				    FROM emp2
 			   	   WHERE POSITION = 'Section head');

SELECT *
  FROM emp2
 WHERE pay > (SELECT)

SELECT *
  FROM emp2
 WHERE POSITION = 'Section head';

-- 다중 컬럼 서브쿼리, 파이썬 튜플과 동일
SELECT grade, name, height, weight
  FROM student
 WHERE (grade, weight) IN (SELECT grade, max(weight)
							 FROM student
							GROUP BY grade);

SELECT grade, max(weight)
  FROM student
 GROUP BY grade;
 
-- 교수 테이블과 학과 department 테이블을 조회하여 학과별로 입사일이 가장 오래된 교수의
-- 교수번호, 이름, 학과명을 출력하시오. 입사일 순으로 오름차순

SELECT p.profno AS "교수번호"
	 , p.name AS "교수명"
	 , d.dname AS "학과명"
	 , to_char(p.hiredate, 'YYYY-MM-DD') AS "입사일" 
  FROM professor p, department d
 WHERE p.deptno = d.DEPTNO
   AND (p.deptno, p.hiredate) IN (SELECT deptno, min(hiredate)
								    FROM professor
								   WHERE deptno IS NOT NULL
  								   GROUP BY deptno)
 ORDER BY p.hiredate ASC;

SELECT deptno, min(hiredate)
  FROM professor
 WHERE deptno IN NOT NULL
 GROUP BY deptno;

-- 상호연관 쿼리
SELECT b.POSITION, AVG(b.pay)
  FROM emp2 b
 GROUP BY b.POSITION;

SELECT AVG(b.pay)
  FROM emp2 b;

SELECT a.name, a.POSITION, a.pay
  FROM emp2 a
 WHERE a.pay >= (SELECT AVG(b.pay)
 				   FROM emp2 b
 				  WHERE b.POSITION = a.position);

COMMIT;

-- 여기까지, where절 서브쿼리

-- 스칼라 서브쿼리, select절 서브쿼리
SELECT *
  FROM emp2 e;

-- 조인은 건수가 만약 700만 건이라 해도 조인은 한 번만 수행
SELECT e.empno, e.name, e.deptno, d.dname
  FROM emp2 e, dept2 d
 WHERE e.deptno = d.dcode;

-- 조인 없이 스칼라 서브쿼리로 해결
-- 조인으로 되는 값을 서브쿼리 쓰면 성능에 악영향을 끼침
-- 스칼라 서브쿼리를 쓰면 where 검생을 700만건 수행
SELECT e.empno, e.name, e.deptno
	 , (SELECT dname FROM dept2 WHERE dcode = e.deptno) AS "부서명"
  FROM emp2 e;

-- 여기까지 스칼라(select절) 서브쿼리

-- from절 서브쿼리
SELECT *
  FROM emp2;

SELECT empno, name, birthday
	 , deptno, emp_type, tel
  FROM emp2;

SELECT es.empno, es.name
  FROM (SELECT empno, name, birthday
	 	 	 , deptno, emp_type, tel
  		  FROM emp2) es;

SELECT grpP.deptno, grpP.paySum
  FROM (SELECT deptno, sum(pay) AS paySum
		  FROM emp2
		 GROUP BY deptno) grpP;

-- 각 부서별 평균 연봉
SELECT grpP.deptno, grpP.payAvg
  FROM (SELECT deptno, avg(pay) AS payAvg
		  FROM emp2
		 GROUP BY deptno) grpP;

--11 emp2와 위에서 구한 값을 조인해서 평균 연봉보다 얼마씩 차이가 나는지

SELECT e.name, e.empno, e.POSITION, e.deptno, e.pay, g.payAvg
	 , (e.PAY  - g.payavg) AS "평균연봉차액"
  FROM emp2 e, (SELECT deptno, avg(pay) AS payAvg
	 		      FROM emp2
			     GROUP BY deptno) g -- g는 가상테이블
 WHERE e.deptno = g.deptno;

--12 with절로 가상테이블 형태 서브쿼리
WITH g1 AS
(
	 SELECT deptno, avg(pay) AS payAvg
	   FROM emp2
	  GROUP BY deptno
)
SELECT e.name, e.empno, e.POSITION, e.deptno, e.pay, g1.payavg
     , (e.pay - g1.payavg) AS "평균연봉차액"
  FROM emp2 e, g1
 WHERE e.deptno = g1.deptno;

-- 11번 12번은 차이가 없음

-- where절 서브쿼리 > from절 서브쿼리 > select절 서브쿼리 (사용자정의 함수로 대체)

-- 서브쿼리 사용시 NULL값 처리
INSERT INTO emp2 (empno, name, birthday, deptno, emp_type, tel)
VALUES (20000219, 'Ray Osmond', '1988-03-22', '999', 'Intern', '02)909-2345');

COMMIT;

SELECT *
  FROM emp2;

--
SELECT name, deptno, nvl((SELECT dname FROM dept2 WHERE dcode = emp2.deptno), '부서명없음') AS "부서명"
  FROM emp2
 ORDER BY deptno;

-- 위의 쿼리 조인으로 변경가능
SELECT e. name, e.deptno, nvl(d.dname, '부서명없음') AS "부서명"
  FROM emp2 e, dept2 d
 WHERE e.deptno = d.dcode(+)
 ORDER BY deptno;

COMMIT;






















