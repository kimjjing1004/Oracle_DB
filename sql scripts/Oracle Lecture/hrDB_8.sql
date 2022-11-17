/* DDL(Data Definition Language): Create��, Drop��, Alter��, Truncate�� */

DESC EMPLOYEES;
DESC MEMBER;

CREATE TABLE EMPLOYEES2(EMPLOYEE_ID NUMBER(10),
                        NAME VARCHAR2(20),
                        SALARY NUMBER(7, 2));

/* as select */
CREATE TABLE EMPLOYEES3
AS SELECT * FROM EMPLOYEES2;

/* table���� column �߰� */
ALTER TABLE EMPLOYEES2
ADD(MANAGER_ID VARCHAR2(10));

/* table���� column ���� */
ALTER TABLE EMPLOYEES2
MODIFY(MANAGER_ID VARCHAR2(20));

/* column�� ���� */
ALTER TABLE EMPLOYEES2
DROP COLUMN MANAGER_ID;

/* ������ ������ */
-- CHAR, VARCHAR, NCHAR, NVARCHAR, LONG(2GB)

/* table ��ü�� ���� */
DROP TABLE EMPLOYEES2;

/* table �̸� ���� */
RENAME MEMBER TO MEMBER1;

/* truncate�� table �ȿ� ������(����)�� ��� ���� */
TRUNCATE TABLE EMPLOYEES3;