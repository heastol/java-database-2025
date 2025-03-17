/*
 * VIEW
 */
-- sysdba로 실행해야 함.
GRANT CREATE VIEW TO sampleuser;

--
SELECT * FROM emp2;

-- 뷰생성 DDL
CREATE OR REPLACE VIEW V_emp2
AS
	SELECT empno, name, deptno, tel, POSITION, pempno
	  FROM emp2;

-- 뷰로 select
SELECT *
  FROM V_emp2;

-- 뷰로 insert
-- 단, 뷰에 속하지 않는 컬럼 중 not null 조건이 있으면 데이터 삽입 불가
INSERT INTO V_emp2 VALUES (20000219, 'Tom Halland', 1004, '051)627-9968', 'IT Programmer', 19960304);

-- deptno컬럼이 not null인데 뷰에는 존재하지 않아 insert 불가
INSERT INTO V_emp2 VALUES (20000220, 'Zen daya', '051)627-9968', 'IT Programmer', 19960304);

COMMIT;

-- CRUD 중 select만 가능하게 만들려면
CREATE OR REPLACE VIEW V_emp2
AS
	SELECT empno, name, deptno, tel, POSITION, pempno
	  FROM emp2
WITH READ ONLY;

-- 삽입 불가
INSERT INTO V_emp2 VALUES (20000221, 'Hugo Sung', 1004, '051)627-9768', 'IT Programmer', 19960303);

-- 복합뷰. 조인등으로 여러 테이블을 합쳐서 보여주는 뷰
-- 복합뷰는 isnert, UPDATE, DELETE가 거의 불가.
CREATE OR REPLACE VIEW v_emp3
AS
	SELECT e.empno, e.name, e.deptno, d.dname
	  FROM emp2 e, dept2 d
	 WHERE e.deptno = d.dcode;

-- 조회
SELECT * FROM v_emp3;




































