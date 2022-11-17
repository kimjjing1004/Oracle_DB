/* 컬럼속성(무결성 제약조건) */

-- not null: 널값이 입력되지 못하게하는 조건
-- unique: 중복된 값이 입력되지 못하게 하는 조건
-- primary key(기본키): not null + unique의 의미
-- foreign key(외래키): 다른 테이블의 필드(컬럼)을 참조해서 무결성을 검사
-- check: 주어진 값만 허용하는 조건

/* not null */
CREATE TABLE NULL_TEST(COL1 VARCHAR2(20) NOT NULL,
                       COL2 VARCHAR2(20) NULL,
                       COL3 VARCHAR2(20));
                       
INSERT INTO NULL_TEST(COL1, COL2)
VALUES('aa', 'bb');

SELECT * FROM NULL_TEST;

INSERT INTO NULL_TEST(COL2, COL3)
VALUES('cc', 'dd');
-- col1이 무결성 제약조건 중 하나인 not null 컬럼속성 조건이 들어갔기 때문에
-- 값을 입력 안하면 자동으로 null값이 들어갈려고 하기 때문에 오류 발생!


/* unique */
CREATE TABLE UNIQUE_TEST(COL1 VARCHAR2(20) UNIQUE NOT NULL,
                         COL2 VARCHAR2(20) UNIQUE,
                         COL3 VARCHAR2(20) NOT NULL,
                         COL4 VARCHAR2(20) NOT NULL,
                         CONSTRAINTS TEMP_UNIQUE
                         UNIQUE(COL3, COL4));
-- constraints 조건이름 조건(컬럼1, 컬럼2, ...)
-- ()에 어떠한 제약조건을 주고 그에 대한 사용자 정의로 이름을 정한다
-- col3, col4 둘다 중복은 허용하지만, null값은 허용하지 않는다
-- 하지만, col3, col4을 합쳤을때는 unique 조건을 적용하여 중복을 허용하지 않는다

INSERT INTO UNIQUE_TEST(COL1, COL2, COL3, COL4)
VALUES('aa', 'bb', 'cc', 'dd');

INSERT INTO UNIQUE_TEST(COL1, COL2, COL3, COL4)
VALUES('a2', 'b2', 'c2', 'd2');

SELECT * FROM UNIQUE_TEST;

UPDATE UNIQUE_TEST
SET COL1 = 'aa'
WHERE COL2 = 'b2';
-- col1은 컬럼 속성이 unique라서 중복된 값이 불가인 컬럼이라서 오류!

INSERT INTO UNIQUE_TEST(COL1, COL2, COL3, COL4)
VALUES('a3', '', 'c3', 'd3');
-- col2는 컬럼 속성이 unique라서 null값이 허용이 되기 때문에 공백을 허용함

INSERT INTO UNIQUE_TEST(COL1, COL2, COL3, COL4)
VALUES('a4', '', 'c4', 'd4');
-- unique여도 null값은 비교대상에서 제외되기 때문에 null값이 또 들어와도 허용함


/* 기본키(primary key): 테이블 생성시 기본키 생성*/
/* 인라인 방식 */
CREATE TABLE PRIMARY_TEST(STUDENT_ID NUMBER(10) PRIMARY KEY,
                          NAME VARCHAR2(20));
-- 인라인 방식은 primary key의 이름이 없는데 SYS가 들어가는 형태로 자동 생성됨 

/* 아웃라인 방식 */         
CREATE TABLE PRIMARY_TEST(STUDENT_ID NUMBER(10),
                          NAME VARCHAR2(20),
                          CONSTRAINTS STUDENT_PK
                          PRIMARY KEY(STUDENT_ID));
-- 아웃라인 방식은 primary key를 직접 지정하여 사용

CREATE TABLE PRIMARY_TEST(STUDENT_ID NUMBER(10),
                          NAME VARCHAR2(20));
                          
/* 테이블을 생성하고 나서 이후에 기본키를 지정하는 방법 */
ALTER TABLE PRIMARY_TEST
ADD CONSTRAINTS STUDENT_PK PRIMARY KEY(STUDENT_ID);


/* 외래키(foreign key) */
/* 인라인 방식 */
CREATE TABLE FOREIGN_KEY(DEPARTMENT_ID CONSTRAINTS DEPT_FK
                         REFERENCES DEPARTMENTS(DEPARTMENT_ID));
-- 부모 테이블인 departments의 department_id컬럼을 참조하여
-- 새로 생성하는 자식 테이블인 foreign_key의 department_id컬럼을
-- dept_fk로 외래키 이름을 설정하여 부모 테이블을 참조하는 외래키 역할을 수행

/* 아웃라인 방식 */
CREATE TABLE FOREIGN_KEY(DEPARTMENT_ID,
                         CONSTRAINTS DEPT_FK
                         FOREIGN KEY(DEPARTMENT_ID)
                         REFERENCES DEPARTMENTS(DEPARTMENT_ID));
                         
/* 테이블을 생성하고 나서 이후에 외래키를 지정하는 방법 */
ALTER TABLE FOREIGN_KEY
ADD CONSTRAINTS DEPT_FK FOREIGN KEY(DEPARTMENT_ID)
REFERENCES DEPARTMENTS(DEPARTMENT_ID);


/* check */
CREATE TABLE CHECK_TEST(GENDER VARCHAR2(10) NOT NULL
                        CONSTRAINTS CHECK_SEX CHECK(GENDER IN('M', 'F'));

CREATE TABLE CHECK_TEST(GENDER VARCHAR2(10) NOT NULL
                        CONSTRAINTS CHECK_SEX CHECK(GENDER IN('남성', '여성'));
                        
INSERT INTO CHECK_TEST VALUES('남자');
-- check_test테이블에 '남자'값이 들어올때 check조건에 의해
-- gender컬럼에 있는 값들 중 '남성' or '여성'이라는 값만 받기 때문에 오류!