/*
 * UPDATE / DELETE
 * 데이터 변경 / 데이터 삭제
 */
-- 삭제
SELECT count(*) FROM professor_new;

DELETE FROM PROFESSOR_NEW
 WHERE profno = 1001;

-- 삭제시 where절 빼는 것은 극히 주의!
DELETE FROM professor_new; -- TRUNCATE와 동일하나 테이블 초기화는 없음

-- 변경
-- profno 4002인 수잔 서랜든의 아이디를 기존 SHrandon에서 Susans로, 급여를 330에서 350으로 올리시오
UPDATE professor_new SET
	ID = 'SusanS'
  , PAY = 350
 WHERE profno = 4002;

/*
 * 트랜잭션, COMMIT, ROLLBACK 
 */

START TRANSACTION;

UPDATE professor_new SET
	   ID = 'susanS'
	 , PAY = 350;

SELECT * FROM professor_new;

ROLLBACK;
COMMIT;

BEGIN TRANSACTION READ WRITE; --안써도 무방












