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
- JOIN
    - ERD(Entity Relationship Diagram) - 개체 관계 다이어그램
        - PK(Primary Key) - 기본키. 중복이안되고 빠진데이터가 하나도 없다. UNIQUE이면서 NOT NULL
        - FK(Foreign Key) - 외래키 / 외부키. 다른엔티티(테이블)의 PK. 두 엔티티의 관계를 연결해주는 값.
        - Relationship - 
    - 카티션곱
    - 내부조인
    - 외부조인
- DDL
    - CREATE, ALTER, DROP













