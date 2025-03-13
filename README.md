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
- DML
    - INSERT
    - UPDATE
    - DELETE
- 제약조건
- INDEX
- VIEW
- 서브쿼리
- 시퀀스











