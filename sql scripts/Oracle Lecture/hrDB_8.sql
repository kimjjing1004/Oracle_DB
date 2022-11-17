/* DDL(Data Definition Language): Create문, Drop문, Alter문, Truncate문 */

DESC EMPLOYEES;
DESC MEMBER;

CREATE TABLE EMPLOYEES2(EMPLOYEE_ID NUMBER(10),
                        NAME VARCHAR2(20),
                        SALARY NUMBER(7, 2));

/* as select */
CREATE TABLE EMPLOYEES3
AS SELECT * FROM EMPLOYEES2;

/* table내에 column 추가 */
ALTER TABLE EMPLOYEES2
ADD(MANAGER_ID VARCHAR2(10));

/* table내에 column 수정 */
ALTER TABLE EMPLOYEES2
MODIFY(MANAGER_ID VARCHAR2(20));

/* column을 삭제 */
ALTER TABLE EMPLOYEES2
DROP COLUMN MANAGER_ID;

/* 문자형 데이터 */
-- CHAR, VARCHAR, NCHAR, NVARCHAR, LONG(2GB)

/* table 자체를 삭제 */
DROP TABLE EMPLOYEES2;

/* table 이름 변경 */
RENAME MEMBER TO MEMBER1;

/* truncate는 table 안에 데이터(내용)를 모두 삭제 */
TRUNCATE TABLE EMPLOYEES3;