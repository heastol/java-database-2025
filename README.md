# java-database-2025
2025 JAVA 개발자과정 데이터베이스

## 1일차


## 2일차
- 함수(계속)
    - 문자함수 부터 : [SQL](./day02/sql01_함수계속.sql)
    - 숫자함수
    - 날짜함수
- 복수행함수 : [SQL](./day02/sql02_복수행함수.sql)
    - 집계함수
    - GROUP BY
    - HAVING
    - ROLLUP
    - RANK, DENSE_RANK, ROW_NUMBER

- 데이터베이스 타입형
    - **CHAR(n)** - 고정형 문자열, 최대 2000바이트
        - CHAR(20)으로 'Hello World'를 입력하면, 'Hello World         '로 저장!
        - 기준코드나 반드시 자리수를 지켜야하는 데이터 필요. 주민번호 등
    - **VARCHAR2(n)** - 가변형 문자열, 최대 4000바이트
        - **VARCHAR2(20)**으로 'Hello World'를 입력하면, 'Hello World'로 저장!
    - INTEGER - 모든 데이터의 기준. 4byte, 정수를 담는 데이터형
    - FLOAT(p) - 실수형 타입. 22byte
    - NUMBER(p, s) - 숫자값, p는 전체자릿수, s는 소숫점길이. 최대 22byte
    - DATE - 날짜타입
    - LONG - 가변길이 문자열, 최대 2GB
    - LONG RAW(n) - 원시 이진 데이터, 최대 2GB
    - CLOB - 대용량 텍스트 데이터타입, 최대 4GB
    - BLOD - 대용량 바이너리 데이터타입, 최대 4GB
    - BFILE - 외부파일에 저장된 데이터, 최대 4GB

## 3일차
- JOIN : [SQL](./day03/sql03_조인기본.sql)
    - ERD(Entity Relationship Diagram) - 개체 관계 다이어그램
        - PK(Primary Key) - 기본키. 중복이안되고 빠진데이터가 하나도 없다. UNIQUE이면서 NOT NULL
        - FK(Foreign Key) - 외래키 / 외부키. 다른엔티티(테이블)의 PK. 두 엔티티의 관계를 연결해주는 값.
        - Relationship - 부모 엔티티와 자식 엔티티간의 연관, 부모1, 자식 N을 가질 수 있음
    - 카티션곱
        - 두 개 이상의 테이블의 조건과 관계없이 연결할 수 있는 경우의 수 모두 만든 데이터
        - 조인이전에 데이터 확인 - 실무에서 카티션곱으로 데이터를 사용할 일이 절대! 없음
    - 내부조인
        - 다중 테이블에서 보통 PK와 FK간의 일치하는 데이터를 한꺼번에 출력하기 위한 방법
        - 관계형 데이터베이스에서 필수로 사용해야 함
        - INNER JOIN 또는 오라클 간결문법 사용
    - 외부조인
        - PK와 FK간 일치하지 않는 데이터도 출력하고자 할 때 사용하는 방법
        - LEFT OUTER JOIN, RIGHT OUTER JOIN 또는 오라클 간결문법 사용
- DDL : [SQL](./day03/sql04_DDL.sql)
    - CREATE - TABLE, VIEW, PROCEDURE, FUNCTION, 개체를 생성하는 키워드
        - 타입형
        '''sql
        CREATE TABLE 테이블명 (
            첫 번째 컬럼    타입형  제약조건,
            두 번째 컬럼    타입형  제약조건,
            ...
            마지막 컬럼     타입형  제약조건
            [
            기본키, 외래키 등에 대한 옵션
            ]
        );
        '''
    - ALTER - 개체 중 테이블에서 수정이 필요할 때 사용하는 키워드
        '''sql
        ALTER TABLE 테이블명 ADD (컬럼명 타입형 제약조건);
        ALTER TABLE 테이블명 MODIFY (컬럼명 타입형 제약조건);
        '''
    - DROP - 개체 삭제시 사용하는 키워드
        '''sql
        DROP TABLE 테이블명 purge; -- purge는 휴지통 -> 복구할 수 있음
        '''
    - TRUNCATE - 테이블 완전 초기화 키워드
        '''sql
        TRUNCATE TABLE 테이블명;
        '''

## 4일차
- VS Code DB플러그인
    - 확장 > Database 검색 > Database Client(weijan chen) > 확장중 Database 선택

- DML : [INSERT쿼리](./day04/sql01_INSERT.sql), [UPDATE/DELETE쿼리](./day04/sql02_UPDATE_DELETE.sql)
    - INSERT - 테이블에 새로운 데이터를 삽입하는 명령
        - 한 건씩 삽입
        '''sql
        INSERT INTO 테이블명 [(컬럼리스트)]
        VALUES (값리스트);
        '''
        - 여러건 한 번에 삽입

    - UPDATE - 데이터 변경. where 조건 없이 실행하면 테이블의 모든 데이터가 수정됨(주의요망!)
    '''sql
    UPDATE 테이블명 SET
        컬럼명 = 변경할 값,
        [컬럼명 = 변경할 값] -- 반복
    [where 조건]
    '''

    - DELETE - 데이터 삭제. where 조건 없이 실행하면 테이블의 모든 데이터가 삭제됨(주의요망!)
    '''sql
    DELETE FROM 테이블명
    [where 조건];
    '''
- 트랜잭션 : [트랜잭션쿼리](./day04/sql03_트랜잭션.sql)
    - 논리적인 처리단위. 
    - 은행에서 돈을 찾을 때 아주 많은 테이블 접근해서 일을 처리
        - 적어도 일곱 여덟개 이상의 테이블에 접근해서 조회하고 업데이트 수행
        - 제대로 일이 처리안되면 다시 원상복귀
        - DB 설정 AUTO COMMIT 해제 권함
        - ROLLBACK 트랜잭션 종료가 아님. COMMIT만 종료를 뜻함.
        '''sql
        SET TRANSACTION READ WRITE; -- 트랜잭션 시작(옵션)
        COMMIT; -- 트랜잭션 확정
        ROLLBACK;   -- 원상복귀
        '''

- 제약조건(Constraint) [제약조건쿼리](./day04/sql04_제약조건.sql)
    - 잘못된 데이터가 들어가지 않도록 막는 기법
        - PRIMARY KEY - 기본키, UNIQUE NOT NULL. 중복되지 않고 없어도 안됨
        - FORIEGN KEY - 외래키, 다른 테이블의 PK에 없는 값을 가져다 쓸 수 없음
        - NOT NULL - 값이 빠지면 안됨
        - UNIQUE - 들어간 데이터가 중복되면 안됨
        - CHECK - 기준에 부합하지 않는 데이터는 입력되면 안됨
        - DEFAULT - NULL입력시 기본값이 입력되도록 하는 제약조건
        '''sql
        CREATE TABLE 테이블명(
            컬럼 생성시 제약조건 추가
        );

        ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건
        '''
- INDEX : [INDEX쿼리](./day04/sql05_인덱스.sql), [인덱스용테이블생성](./ref/bulk_data_insert.sql)
    - 책의 찾아보기와 동일한 기능
    - 검색을 매우 빨리 할 수 있도록 해줌
    - B(alance) Tree를 사용해서 검색횟수를 반 이하로 줄임
    - 인덱스 종류
        - 클러스터드(Clustered) 인덱스 (테이블 당 1개)
            - PK에 자동으로 생성되는 인덱스(무지 빠름)
            - PK가 없으면 처음으로 설정되는 UNIQUE 제약조건의 컬럼에 생성
        - 보조(Non-Clustered) 인덱스 (여러개)
            - 사용자가 추가하는 인덱스
            - 클러스터드 인덱스보다 조금 느림
        - 유의점
            - PK에 자동 인덱스 후, 컬럼에 UNIQUE를 걸어도 인덱스가 생성 안됨. 수동으로 생성 필요
            - WHERE절에서 검색하는 컬럼은 인덱스를 걸어주는 것이 성능향상에 도움
            - 인덱스는 한 테이블당 4개 이상 걸면 성능이 저하됨
            - NULL값이 많은 컬럼에 인덱스는 성능 저하
            - INSERT, UPDATE, DELETE가 많이 발생하는 테이블에 인덱스를 걸면 성능 저하

            '''sql
            CREATE INDEX 인덱스명 ON 테이블명(인덱스절컬럼명)
            '''

## 5일차
- VIEW : [뷰쿼리](./day05/sql01_뷰.sql)
    - 기존 테이블에서 권한별로 보일 수 있는 컬럼을 지정해서 만드는 개체(보안목적)
    - 기존 테이블 중 개인정보나 중요한 부분이 있으면 제외하고 보일 수 있음
    - 뷰이라도 INSERT, UPDATE, DELETE 가능함. 단 단일뷰가 가능
    '''sql
    CREATE VIEW 뷰명
    AS
        SELECT 쿼리;
        [WITH READ ONLY]
    '''
    - 복합뷰는 두 개이상의 테이블을 조인해서 만든 뷰. DML기능 불가.

- 서브쿼리 : [서브쿼리](./day05/sql02_서브쿼리.sql)
    - 메인쿼리를 도와주는 하위쿼리를 뜻함. 소괄호() 내에 포함됨
    - 단일행 서브쿼리, 다중행 서브쿼리마다 사용법 다름
    - SELECT절 서브쿼리, FROM절 서브쿼리, WHERE절 서브쿼리
    - 서브쿼리는 JOIN으로 거의다 변경가능

- 시퀀스
    - 번호로 지정된 PK값을 자동으로 삽입할 수 있도록 도와주는 기능
    - 없어도 기능에는 차이가 없지만 효율을 위해서 사용
    - Oracle에만 존재

        '''sql
        CREATE SEQUENCE 시퀀스명
        INCREMENT BY 1 -- 증가값
        START WITH 1 -- 초기 시작값
        [MAXVALUE 999999] -- 최대 증가값
        [CYCLE] -- 최대증가값에 도달하면 다시 처음1로 돌아갈 것인지
        [CACHE] -- 번호증가 캐쉬(대용량 삽입시만 관계)

        시퀀스명.nextval
        시퀀스명.currval
        '''

- 사용자 계정 권한 : [쿼리](./day05/sql04_사용자계정관리.sql)
    - 사용자 생성 후 권한(롤)을 부여해야 스키마를 사용가능

    '''sql
    -- 권한 부여
    GRANT 권한|롤 TO 사용자 [WITH ADMIN|GRANT OPTION];
    -- 권한 해제
    REVOKE 권한|롤 FROM 사용자;
    '''

## 6일차
- PL/SQL - ORACLE에서 파이썬처럼 코딩
...











