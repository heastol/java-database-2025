CREATE OR REPLACE FUNCTION GET_DNAME(
	-- v_deptno		dept2.dcode%TYPE
	v_deptno	emp2.deptno%TYPE
)  RETURN VARCHAR2
IS
	deptname	dept.dname%TYPE;
BEGIN
	SELECT dname INTO deptname
	  FROM dept2 WHERE dcode = v_deptno;

	RETURN deptname; -- 빼먹으면 안됨
END GET_DNAME;
